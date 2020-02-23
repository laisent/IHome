#coding:utf-8

from .CCPRestSDK import REST


# 修改_serverIP的值
_serverIP = 'app.cloopen.com'

# 主帐号
accountSid = '8aaf070870dgfddgfbba6089f'

# 主帐号Token
accountToken = 'e948b5e50a5ghkhjgk21d8812520'

# 应用Id
appId = '8aaf0708701ea9ab01703458bc0708a6'

# 请求地址，格式如下，不需要写http://
serverIP = 'app.cloopen.com'

# 请求端口
serverPort = '8883'

# REST版本号
softVersion = '2013-12-26'

class CCP(object):
    """"自己封装的发送短信的辅助类"""
    # 用来保存对象的类属性
    instance = None

    def __new__(cls):
        # 判断CCP类有没有已经创建好的对象，如果没有，创建一个对象，并且保存
        # 如果有，则将保存的对象直接返回
        if cls.instance is None:
            obj = super().__new__(cls)

            # 初始化REST SDK
            cls.rest = REST(serverIP, serverPort, softVersion)
            cls.rest.setAccount(accountSid, accountToken)
            cls.rest.setAppId(appId)

            cls.instance = obj

        return cls.instance

    def send_template_sms(self, to, datas, temp_id):
        """
        发送模板短信
        :param to: 手机号码
        :param datas: 内容数据 格式为列表 例如：{'12','34'}，如不需替换请填 ''
        :param temp_id: $temp_id 模板Id
        :return:
        """
        result = self.rest.sendTemplateSMS(to, datas, temp_id)
        # for k, v in result.items():
        #     if k == 'templateSMS':
        #         for k, s in v.items():
        #             print('%s:%s' % (k, s))
        #     else:
        #         print('%s:%s' % (k, v))

        # statusCode: 000000
        # smsMessageSid: 79ec944ad89141fd9762602818c7e856
        # dateCreated: 20200212211951
        status_code = result.get("statusCode")
        if status_code == "000000":
            # 表示发送成功
            return "0"
        else:
            # 发送失败
            return "-1"


if __name__ == "__main__":
    ccp = CCP()
    ret = ccp.send_template_sms("18011111111", ["1234", "5"], 1)
    print(ret)


