from . import api
from ihome.utils.commons import login_required
from ihome.models import Order
from flask import g, current_app, jsonify, request
from ihome.utils.response_code import RET
from ihome import db

from alipay.aop.api.response.AlipayOfflineMaterialImageUploadResponse import AlipayOfflineMaterialImageUploadResponse
from alipay.aop.api.request.AlipayOfflineMaterialImageUploadRequest import AlipayOfflineMaterialImageUploadRequest
from alipay.aop.api.request.AlipayTradePagePayRequest import AlipayTradePagePayRequest
from alipay.aop.api.request.AlipayTradeWapPayRequest import AlipayTradeWapPayRequest

from alipay.aop.api.request.AlipayTradeQueryRequest import AlipayTradeQueryRequest
from alipay.aop.api.request.AlipayTradeAppPayRequest import AlipayTradeAppPayRequest
from alipay.aop.api.domain.AlipayTradePagePayModel import AlipayTradePagePayModel
from alipay.aop.api.response.AlipayTradePayResponse import AlipayTradePayResponse
from alipay.aop.api.domain.AlipayTradeAppPayModel import AlipayTradeAppPayModel

from alipay.aop.api.domain.AlipayTradeWapPayModel import AlipayTradeWapPayModel

from alipay.aop.api.domain.AlipayTradeQueryModel import AlipayTradeQueryModel
from alipay.aop.api.domain.SettleDetailInfo import SettleDetailInfo
from alipay.aop.api.DefaultAlipayClient import DefaultAlipayClient
from alipay.aop.api.AlipayClientConfig import AlipayClientConfig
from alipay.aop.api.domain.GoodsDetail import GoodsDetail
from alipay.aop.api.domain.SubMerchant import SubMerchant
from alipay.aop.api.domain.SettleInfo import SettleInfo
from alipay.aop.api.FileItem import FileItem
from alipay.aop.api.util.SignatureUtils import verify_with_rsa

import os


@api.route('/orders/<int:order_id>/payment', methods=["POST"])
@login_required
def order_pay(order_id):
    """发起支付宝支付"""
    user_id = g.user_id

    # 判断订单状态
    try:
        order = Order.query.filter(Order.id == order_id, Order.user_id == user_id, Order.status == "WAIT_PAYMENT").first()
    except Exception as e:
        current_app.logger.error(e)
        return jsonify(errno=RET.DBERR, errmsg="数据库异常")

    if order is None:
        return jsonify(errno=RET.NODATA, errms="订单数据有误")

    # todo: 业务处理 使用python的SDK 调用支付宝的支付接口

    """
    设置配置，包括支付宝网关地址、app_id、应用私钥、支付宝公钥等，其他配置值可以查看AlipayClientConfig的定义。
    """
    alipay_client_config = AlipayClientConfig(sandbox_debug=True)
    alipay_client_config.server_url = 'https://openapi.alipaydev.com/gateway.do'
    alipay_client_config.app_id = '2016101900724693'  # 应用id 这里是沙箱id
    alipay_client_config.charset = 'utf-8'

    with open(os.path.join(os.path.dirname(__file__), 'keys/app_private_key.txt')) as f:  # 应用私钥
        alipay_client_config.app_private_key = f.read()

    with open(os.path.join(os.path.dirname(__file__), 'keys/alipay_public_key.txt')) as f:  # 支付宝公钥
        alipay_client_config.alipay_public_key = f.read()

    alipay_client_config.sign_type = 'RSA2'  # RSA或RSA2

    """
    得到客户端对象。
    注意，一个alipay_client_config对象对应一个DefaultAlipayClient，定义DefaultAlipayClient对象后，
    alipay_client_config不得修改，如果想使用不同的配置，请定义不同的DefaultAlipayClient。
    logger参数用于打印日志，不传则不打印，建议传递。
    """
    client = DefaultAlipayClient(alipay_client_config=alipay_client_config)

    # 对照接口文档，构造请求对象
    model = AlipayTradeWapPayModel()

    model.out_trade_no = order_id  # 订单编号
    model.total_amount = "%.2f" % (order.amount/100.0)  # 支付总金额
    model.subject = "爱家租房 %s" % order.id  # 订单标题
    model.quit_url = "http://47.98.34.63:5000/orders.html"  # 用户付款中途退出返回商户网站的地址
    model.product_code = "QUICK_WAP_WAY"  # 销售产品码，商家和支付宝签约的产品码
    model.timeout_express = "30m"  # 订单过期关闭时长（分钟）

    pay_request = AlipayTradeWapPayRequest(biz_model=model)  # 通过模型创建请求对象
    # get请求 用户支付成功后返回的页面请求地址
    pay_request.return_url = "http://47.98.34.63:5000/payComplete.html"
    # post请求 用户支付成功后返回的页面请求地址
    pay_request.notify_url = ''
    # 利用阿里支付对象发一个获取页面的请求 参数为order_string
    pay_url = client.page_execute(pay_request, http_method='GET')

    return jsonify(errno=RET.OK, errmsg="OK", data={"pay_url": pay_url})


def check_pay(params):
    """定义检查支付结果的函"""
    sign = params.pop('sign', None)  # 取出签名
    sigan_type = params.pop('sign_type')  # 取出签名类型

    params = sorted(params.items(), key=lambda e: e[0], reverse=False)
    message = "&".join("{}={}".format(k, v) for k, v in params).encode()  # 将列表转为二进制参数字符串

    public_key_dir = os.path.join(os.path.dirname(__file__), 'keys/alipay_public_key.txt')

    print("校验中 公钥是%s" % public_key_dir)
    with open(public_key_dir, 'rb') as public_key:

        try:
            status = verify_with_rsa(public_key.read().decode('utf-8'), message, sign)  # 验证签名并获取结果
            return status  # 返回验证结果
        except Exception as e:  # 如果验证失败，返回假值
            return False


@api.route('/order/payment', methods=["PUT"])
def save_order_payment_result():
    """保存订单支付结果"""
    alipay_dict = request.form.to_dict()

    print("刚刚进入 还未校验")
    # 借助工具验证参数的合法性
    # 如果确定参数是支付宝的，返回True，否则返回false
    result = check_pay(alipay_dict)
    print("校验完 结果是%s" % result)

    if result:
        # 修改数据库的订单状态信息
        order_id = alipay_dict.get("out_trade_no")
        trade_no = alipay_dict.get("trade_no")  # 支付宝的订单交易号

        try:
            Order.query.filter_by(id=order_id).update({"status": "WAIT_COMMENT", "trade_no": trade_no})
            db.session.commit()
        except Exception as e:
            current_app.logger.error(e)
            db.session.rollback()

    return jsonify(errno=RET.OK, errmsg="OK")






