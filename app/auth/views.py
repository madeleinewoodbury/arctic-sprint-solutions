from . import auth
from flask import render_template, request, redirect, url_for, session

@auth.route('/register', methods=['GET', 'POST'])
def user_register() -> 'html':
	pass

@auth.route('/login', methods=['GET', 'POST'])
def user_login() -> 'html':
	pass
