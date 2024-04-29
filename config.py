"""Configuration settings for the application

Keyword arguments:
	Config: Base config class.
	TestConfig: Configuration settings for testing.
	LiveConfig: Configuration settings for live (production).
Return: 
	Dictionary mapping configuration names to classes.
"""

from dotenv import load_dotenv
import os
import secrets
basedir = os.path.abspath(os.path.dirname(__file__))


# load environment variables located in .env file
load_dotenv()

class Config():
    SECRET_KEY = secrets.token_urlsafe(16)

    # Translation
    LANGUAGES = {
        'en': 'English', 
        'nb': 'Norwegian'
        # 'ja': 'Japanese',
        # 'es': 'Spanish',
        # 'fr': 'French',
        # 'nl': 'Dutch',
        # 'de': 'German',
        # 'el': 'Greek',
        # 'ru': 'Russian',
        # 'sv': 'Swedish',
        # 'fi': 'Finnish',
        # 'ko': 'Korean',
        # 'zh': 'Chinese',
        # 'da': 'Danish',
        # 'pt': 'Portuguese'
        }
    BABEL_DEFAULT_LOCALE = 'en'
    BABEL_TRANSLATION_DIRECTORIES = 'translations'

    # Flask-Mail settings
    # Setter opp en lokalserver som ikke trenger brukernavn/passord
    MAIL_SERVER = 'localhost'
    MAIL_PORT = 1025
    MAIL_USE_TLS = False
    MAIL_USE_SSL = False
    # MAIL_DEBUG = app.debug
    MAIL_USERNAME = None
    MAIL_PASSWORD = None
    MAIL_DEFAULT_SENDER = None
    MAIL_MAX_EMAILS = None
    MAIL_SUPPRESS_SEND = False # default: app.testing
    MAIL_ASCII_ATTACHMENTS = False

    # Mail template settings
    FLASK_MAIL_SUBJECT_PREFIX = "[Hitchhiker's Guide]"
    FLASK_MAIL_SENDER = 'hitchhiker@the_end_of_the_universe.rom'

    # Caching settings
    CACHE_TYPE = 'SimpleCache'
    CACHE_DEFAULT_TIMEOUT = 300
    # TEMPLATES_AUTO_RELOAD = False


class TestConfig(Config):
    SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URI")
    DEBUG = True
    TESTING = True


class LiveConfig(Config):
    pass


config = {
    'testing': TestConfig,
    'live': LiveConfig
}
