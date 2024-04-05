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


class TestConfig(Config):
    SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URI")


"""    DEBUG = True
    MYSQL_HOST = 'localhost:3306'
    MYSQL_USER = 'user'
    MYSQL_PASSWORD = 'test'
    MYSQL_DB = 'arcticSprintSolutionsDB'

    MYSQL_DICT = {
        'host': MYSQL_HOST,
        'user': MYSQL_USER,
        'password': MYSQL_PASSWORD,
        'database': MYSQL_DB
    }"""


class LiveConfig(Config):
    # TODO: Denne må oppdateres dersom vi skal ha en live database-sever.
    """DEBUG=False
    MYSQL_HOST = 'kark.uit.no'
    MYSQL_USER = 'stud_v23_ete026'
    MYSQL_PASSWORD = ''
    MYSQL_DB = 'stud_v23_ete026'

MYSQL_DICT = {
    'host': MYSQL_HOST,
    'user': MYSQL_USER,
    'password': MYSQL_PASSWORD,
    'database': MYSQL_DB
}"""


config = {
    'testing': TestConfig,
    'live': LiveConfig
}
