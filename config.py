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
        'no': 'Norwegian'
        }
    BABEL_DEFAULT_LOCALE = 'en'
    BABEL_TRANSLATION_DIRECTORIES = 'translations'

    
    MAIL_SERVER = 'localhost'
    MAIL_PORT = 25
    MAIL_USE_TLS = False
    MAIL_USE_SSL = False
    # MAIL_DEBUG = app.debug
    MAIL_USERNAME = None
    MAIL_PASSWORD = None
    MAIL_DEFAULT_SENDER = None
    MAIL_MAX_EMAILS = None
    # MAIL_SUPPRESS_SEND = app.testing
    MAIL_ASCII_ATTACHMENTS = False



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
