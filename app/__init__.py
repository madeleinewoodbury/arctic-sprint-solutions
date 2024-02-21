"""Flask app creation - create_app

Keyword arguments:
create_app(config_name) - Creates the flask app based on specific config.
config_name (str) - The name of the configuration to use.
Return: flask application (with right configuration)
"""


from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://user:test@localhost/arcticSprintSolutionsDB'
    SQLALCHEMY_TRACK_MODIFICATIONS = False


config = {
    'development': Config,
    'production': Config,
    'testing': Config
}

def create_app(config_name):
    app = Flask(__name__)

    # Loads the configurations settings based on config type.
    app.config.from_object(config[config_name])

    db.init_app(app)

    with app.app_context():
        from app.routes.attractions_view import attractions
        app.register_blueprint(attractions)

    return app

    