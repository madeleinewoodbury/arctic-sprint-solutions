"""Configuration settings for the application

Keyword arguments:
	Config: Base config class.
	TestConfig: Configuration settings for testing.
	LiveConfig: Configuration settings for live (production).
Return: 
	Dictionary mapping configuration names to classes.
"""


import os
import secrets
basedir = os.path.abspath(os.path.dirname(__file__))


class Config():
    SECRET_KEY = secrets.token_urlsafe(16)


class TestConfig(Config):
    SQLALCHEMY_DATABASE_URI = 'mysql://user:test@localhost:3306/arcticSprintSolutionsDB'


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
	DEBUG=False
	MYSQL_HOST = 'kark.uit.no'
	MYSQL_USER = 'stud_v23_ete026'
	MYSQL_PASSWORD = ''
	MYSQL_DB = 'stud_v23_ete026'

    MYSQL_DICT = {
        'host': MYSQL_HOST,
        'user': MYSQL_USER,
        'password': MYSQL_PASSWORD,
        'database': MYSQL_DB
    }


config = {
    'testing': TestConfig,
    'live': LiveConfig
}
