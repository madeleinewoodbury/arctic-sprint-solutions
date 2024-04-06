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
from flask_caching import Cache
from googletrans import Translator


# Babel stuff
def get_locale():
    # Sjekk om språket er lagret i sesjonen
    if 'language' in session:
        return session['language']
    # Dersom ingen language i session returner engelsk språk.
    return 'en'  


db = SQLAlchemy()
admin_manager = Admin()
translator_manager = Translator()
cache = Cache()


def translate_filter(text):
    # Forutsetter at translator_manager er riktig importert og definert
    cached_data = {}
    if ('language' in session) and (session['language'] != 'en'):
        cache_key = "{}_{}".format(text, session['language'])
        cached_data = cache.get(cache_key)
        if cached_data is not None:
            return cached_data
        try:
            translated_text = translator_manager.translate(text, dest=session['language'], src='en').text
        except Exception as e:
            print(e)
            return text
        cached_data = translated_text
        cache.set(cache_key, cached_data, timeout=300)
        return cached_data
    return text


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
    cache.init_app(app)
    babel = Babel(app, locale_selector=get_locale)

    # Register new filter for jinja
    app.jinja_env.filters["translate"] = translate_filter
    
    from .admin import admin_manager as admin_bp

    from .auth import auth as auth_bp
    app.register_blueprint(auth_bp, url_prefix='/auth')

    from .attractions import attractions as attractions_bp
    app.register_blueprint(attractions_bp)

    from .main import main as main_bp
    app.register_blueprint(main_bp)

    return app
