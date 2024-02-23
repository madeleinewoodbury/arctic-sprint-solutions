from flask_wtf import FlaskForm as Form
from wtforms import StringField, EmailField, PasswordField, BooleanField, SubmitField
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError
from ..models import User

class LoginForm(Form):
	email = EmailField('Email', validators=[DataRequired()])
	password = PasswordField('Password', validators=[DataRequired()])
	remember_me = BooleanField('Remember me?')
	submit = SubmitField('Login')

class RegistrationForm(Form):
	first_name = StringField('First Name', validators=[DataRequired(), Length(max=50)])
	last_name = StringField('Last Name', validators=[DataRequired(), Length(max=50)])
	username = StringField('Username', validators=[DataRequired(), Length(min=6, max=50)])
	email = EmailField('Email', validators=[DataRequired(), Length(max=50)])
	password = PasswordField('Password', validators=[DataRequired(), Length(min=6, max=50)])
	confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), Length(min=6, max=50), EqualTo('password')])
	submit = SubmitField('Register')
 
	def validate_username(self, username):
		user = User.query.filter_by(username=username.data).first()
		if user is not None:
			raise ValidationError('This username is already taken.')

	def validate_email(self, email):
		user = User.query.filter_by(email=email.data).first()
		if user is not None:
			raise ValidationError('This email is already taken.')
