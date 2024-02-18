from flask import Flask

app = Flask(__name__)

#TODO: use python-dotenv for environment variables
app.config['SECRET_KEY'] = "Preferrably use env for secret"

@app.route('/')
def welcome():
    return 'Welcome to Arctic Sprint Solutions'


if __name__ == '__main__':
    app.run(debug=True, port=5200)