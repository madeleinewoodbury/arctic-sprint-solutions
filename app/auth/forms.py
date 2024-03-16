from flask_wtf import FlaskForm as Form
from wtforms import StringField, PasswordField, BooleanField, SubmitField, HiddenField, SelectMultipleField
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError, Regexp, Email
from app.models import User

class LoginForm(Form):
	email = StringField('Email', validators=[DataRequired(), Email()])
	password = PasswordField('Password', validators=[DataRequired()])
	remember_me = BooleanField('Remember me')
	submit = SubmitField('Login', render_kw={'class': 'btn btn-primary'})

class RegistrationForm(Form):
	first_name = StringField('First Name', validators=[DataRequired(), Length(max=50)])
	last_name = StringField('Last Name', validators=[DataRequired(), Length(max=50)])
	username = StringField('Username', validators=[DataRequired(), Length(min=6, max=20), 
                                                Regexp('^[a-zA-Z0-9_]+$', message='Username can only contain letters, numbers, and underscores.')])
	email = StringField('Email', validators=[DataRequired(), Email(), Length(max=50)])
	password = PasswordField('Password', validators=[DataRequired(), Length(min=6, max=50)])
	confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), Length(min=6, max=50), EqualTo('password')])
	submit = SubmitField('Register', render_kw={'class': 'btn btn-primary'})
 
	def validate_username(self, username):
		user = User.query.filter_by(username=username.data).first()
		if user is not None:
			raise ValidationError('This username is already taken.')

	def validate_email(self, email):
		user = User.query.filter_by(email=email.data).first()
		if user is not None:
			raise ValidationError('This email is already taken.')


class ProfileForm(Form):
    email = StringField('Email', validators=[DataRequired(), Email()])
    gravatar_url = HiddenField('Gravatar URL')
    tag = SelectMultipleField('Select Tags', coerce=int)
    submit = SubmitField('Update profile', render_kw={'class': 'btn btn-primary'})