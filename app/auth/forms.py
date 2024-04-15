from flask_wtf import FlaskForm as Form
from wtforms import StringField, PasswordField, BooleanField, SubmitField, HiddenField, SelectMultipleField, SelectField
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError, Regexp, Email
from app.models import User
from flask_babel import lazy_gettext as _

class LoginForm(Form):
	email = StringField(_('Email'), validators=[DataRequired(), Email()], render_kw={"autocomplete": "username"})
	password = PasswordField(_('Password'), validators=[DataRequired()])
	remember_me = BooleanField(_('Remember me'))
	submit = SubmitField(_('Login'), render_kw={'class': 'btn btn-primary'})

class RegistrationForm(Form):
	country= SelectField(_('Country'))
	first_name = StringField(_('First Name'), validators=[DataRequired(), Length(max=50)])
	last_name = StringField(_('Last Name'), validators=[DataRequired(), Length(max=50)])
	username = StringField(_('Username'), validators=[
    	DataRequired(), Length(min=6, max=20), 
     	Regexp('^[a-zA-Z0-9_]+$', 
            message=_('Username must be at least 10 characters long and only contain letters, numbers, and underscores.'))])
	email = StringField(_('Email'), validators=[DataRequired(), Email(), Length(max=50)], render_kw={"autocomplete": "username"})
	password = PasswordField('Password', validators=[
    	DataRequired(), Length(min=10, max=40), 
      	Regexp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{10,40}$', 
            message=_('Password must be at least 10 characters long while containing at least one uppercase letter, one lowercase letter, and one number.'))])
	confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), Length(min=10, max=40), EqualTo('password')])
	submit = SubmitField(_('Register'), render_kw={'class': 'btn btn-primary'})
 
	def validate_username(self, username):
		user = User.query.filter_by(username=username.data).first()
		if user is not None:
			raise ValidationError(_('This username is already taken.'))

	def validate_email(self, email):
		user = User.query.filter_by(email=email.data).first()
		if user is not None:
			raise ValidationError(_('This email is already taken.'))
		
class PasswordResetRequestForm(Form):
	email = StringField(_('Email'), validators=[DataRequired(), Length(1,64), Email()])
	submit = SubmitField(_('Reset Password'), render_kw={'class': 'btn btn-primary'})


class PasswordResetForm(Form):
	password = PasswordField('Password', validators=[
    	DataRequired(), Length(min=10, max=40), 
      	Regexp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{10,40}$', 
            message=_('Password must be at least 10 characters long while containing at least one uppercase letter, one lowercase letter, and one number.'))])
	confirm_password = PasswordField('Confirm Password', validators=[DataRequired(), Length(min=10, max=40), EqualTo('password')])
	submit = SubmitField(_('Reset Password'), render_kw={'class': 'btn btn-primary'})


class ProfileForm(Form):
    gravatar_url = HiddenField(_('Gravatar URL'))
    username = StringField(_('Username'), validators=[
    	DataRequired(), Length(min=6, max=20), 
     	Regexp('^[a-zA-Z0-9_]+$', 
            message=_('Username must be at least 10 characters long and only contain letters, numbers, and underscores.'))])
    country = SelectField(_('Country'), choices=[], coerce=int)
    first_name = StringField(_('First Name'), validators=[DataRequired(), Length(max=50)])
    last_name = StringField(_('Last Name'), validators=[DataRequired(), Length(max=50)])
    email = StringField(_('Email'), validators=[DataRequired(), Email(), Length(max=50)], render_kw={"autocomplete": "username"})
    
    #categories
    #age_groups
    tag = SelectMultipleField(_('Select Tags'), coerce=int)
    
    cancel = SubmitField(_('Cancel'), render_kw={'class': 'btn btn-primary'})
    submit = SubmitField(_('Update profile'), render_kw={'class': 'btn btn-primary'})



class SearchUsersForm(Form):
    search_text = StringField(_('Search users'), render_kw={'placeholder': _('Search users')})
    submit = SubmitField(_('Search'), render_kw={'class': 'btn btn-primary search-btn'})
    
    
class FriendRequestForm(Form):
    search_text = StringField(_('Search users'), render_kw={'placeholder': _('Search users')})
    submit = SubmitField(_('Search'), render_kw={'class': 'search-btn'})
    