"""Flask app creation - create_app

Keyword arguments:
create_app(config_name) - Creates the flask app based on specific config.
config_name (str) - The name of the configuration to use.
Return: flask application (with right configuration)
"""


from flask import Flask
from config import config
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_admin import Admin

db = SQLAlchemy()
admin_manager = Admin()

# Flask-login verdier
login_manager = LoginManager()
login_manager.session_protection = 'strong'
login_manager.login_view = 'auth.login'


def create_app(config_name):
    from .attractions.views import attractions
    app = Flask(__name__)

    # Loads the configurations settings based on config type.
    app.config.from_object(config[config_name])
    db.init_app(app)
    login_manager.init_app(app)
    admin_manager.init_app(app)

    from .admin import admin_manager as admin_bp

    from .auth import auth as auth_bp
    app.register_blueprint(auth_bp, url_prefix='/auth')

    from .attractions import attractions as attractions_bp
    app.register_blueprint(attractions_bp)

    from .main import main as main_bp
    app.register_blueprint(main_bp)

    return app
