from . import api
from ihome import db, models
# import logging
from flask import current_app


@api.route('/index')
def index():
    # current_app.logger.error("error msg")
    # current_app.logger.error("warn msg")
    # current_app.logger.error("info msg")
    # current_app.logger.error("debug msg")
    return "index page"
