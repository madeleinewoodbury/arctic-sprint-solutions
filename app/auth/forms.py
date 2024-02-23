from flask_wtf import FlaskForm as Form
from wtforms import StringField, EmailField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError
from ..models import User

class LoginForm(Form):
	email = EmailField('Email', validators=[DataRequired()])
	password = PasswordField('Password', validators=[DataRequired()])
	submit = SubmitField('Login')

class RegistrationForm(Form):
	first_name = StringField('First Name', validators=[DataRequired(), Length(max=50)])
	last_name = StringField('Last Name', validators=[DataRequired(), Length(max=50)])
	username = StringField('Username', validators=[DataRequired(), Length(min=6, max=50)])
	email = EmailField('Email', validators=[DataRequired(), Length(max=50)])
	password = PasswordField('Password', validators=[DataRequired(), Length(min=6, max=50)])
	confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), EqualTo('password')])
	submit = SubmitField('Register')
 
	def validate_username(self, username):
		user = User.query.filter_by(username=username.data).first()
		if user is not None:
			raise ValidationError('This username is already taken.')

	def validate_email(self, email):
		user = User.query.filter_by(email=email.data).first()
		if user is not None:
			raise ValidationError('This email is already taken.')


'''
class User(UserMixin, db.Model):
	__tablename__ = 'user'
	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(50))
	first_name = db.Column(db.String(50))
	last_name = db.Column(db.String(50))
	email = db.Column(db.String(50), unique=True)
	password = db.Column(db.String(255), nullable=False)
	role = db.Column(db.Integer, db.ForeignKey('userRole.id'))
	created_at = db.Column(db.DateTime, default=datetime.utcnow)

	user = User.query.filter_by(email=form.email.data).first()
 
'''