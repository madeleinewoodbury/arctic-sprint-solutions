"""Flask app creation - create_app

Keyword arguments:
create_app(config_name) - Creates the flask app based on specific config.
config_name (str) - The name of the configuration to use.
Return: flask application (with right configuration)
"""


from flask import Flask, request, session
from config import config
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_admin import Admin
from flask_babel import Babel
from flask_mail import Mail 
from flask_moment import Moment
from flask_caching import Cache
from googletrans import Translator
from .translate import get_locale, translate_filter


db = SQLAlchemy()
admin_manager = Admin()
mail = Mail()
translator_manager = Translator()
cache = Cache()


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
    mail.init_app(app)
    cache.init_app(app)
    babel = Babel(app, locale_selector=get_locale)
    moment = Moment(app)
    moment.locale = get_locale

    # Register new filter for jinja
    app.jinja_env.filters["translate"] = translate_filter

    @app.context_processor
    def inject_cities():
        from .attractions.forms import SelectCityForm
        selected_city = session.get('selected_city')
        if not selected_city:
            session['selected_city'] = 1
        return dict(select_city_form=SelectCityForm())
    
    
    from .admin import admin_manager as admin_bp

    from .auth import auth as auth_bp
    app.register_blueprint(auth_bp, url_prefix='/auth')

    from .attractions import attractions as attractions_bp
    app.register_blueprint(attractions_bp)

    from .main import main as main_bp
    app.register_blueprint(main_bp)

    return app
