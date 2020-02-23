import redis


class Config(object):
    """配置信息"""
    # 秘钥
    SECRET_KEY = "NKDGsdag1f2456+jyc"

    # 数据库sqlalchemy的配置参数
    SQLALCHEMY_DATABASE_URI = "mysql+mysqlconnector://root:root@127.0.0.1:3306/ihome"

    # 设置sqlalchemy自动跟踪数据库
    SQLALCHEMY_TRACK_MODIFICATIONS = True

    # redis配置参数
    REDIS_HOST = "127.0.0.1"
    REDIS_PORT = 6379

    # flask_session配置参数 使用redis保存session
    SESSION_TYPE = "redis"
    SESSION_REDIS = redis.StrictRedis(host=REDIS_HOST, port=REDIS_PORT)
    SESSION_USE_SIGNER = True  # 对cookie中的session_id进行隐藏
    PERMANENT_SESSION_LIFETIME = 86400  # session的有效期：1天 单位s


class DevelopmentConfig(Config):
    """开发模式的配置信息"""
    # 调试模式
    DEBUG = True


class ProductConfig(Config):
    """生存环境的配置信息"""
    pass


config_map = {
    "develop": DevelopmentConfig,
    "product": ProductConfig
}
