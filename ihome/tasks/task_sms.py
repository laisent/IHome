from celery import Celery
from ihome.libs.yuntongxun.sms import CCP


# 定义celery对象
celery_app = Celery("ihome", broker="redis://127.0.0.1:6379/1")


@celery_app.task
def send_sms(to, datas, temp_id):
    """"发送短信的异步任务"""
    import ssl
    # 取消证书验证
    ssl._create_default_https_context = ssl._create_unverified_context
    # 修改_serverIP的值
    _serverIP = 'app.cloopen.com'
    ccp = CCP()
    ccp.send_template_sms(to, datas, temp_id)


