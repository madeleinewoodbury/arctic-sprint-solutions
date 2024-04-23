from flask_wtf import FlaskForm as Form
from wtforms import StringField, PasswordField, BooleanField, SubmitField, HiddenField, SelectMultipleField, SelectField, widgets
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError, Regexp, Email, Optional
from app.models import User
from flask_babel import lazy_gettext as _
from flask_login import current_user


class NewPasswordFields(Form):
    password = PasswordField('Password', validators=[
        DataRequired(), Regexp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{10,40}$', 
            message=_('Password must be at least 10 characters long while containing at least one uppercase letter, one lowercase letter, and one number.'))],
            render_kw={'autocomplete': 'new-password'})
    confirm_password = PasswordField('Confirm Password', validators=[
        DataRequired(), EqualTo('password')])

# Login and registration related forms:
class LoginForm(Form):
    email = StringField(_('Email'), validators=[
        DataRequired(), Email()], render_kw={"autocomplete": "username"})
    password = PasswordField(_('Password'), validators=[DataRequired()])
    remember_me = BooleanField(_('Remember me'))
    submit = SubmitField(_('Login'), render_kw={'class': 'btn btn-primary'})

class RegistrationForm(NewPasswordFields):
    country = SelectField(_('Country'), coerce=int)
    first_name = StringField(_('First Name'), validators=[DataRequired(), Length(max=50)])
    last_name = StringField(_('Last Name'), validators=[DataRequired(), Length(max=50)])
    username = StringField(_('Username'), validators=[DataRequired(), Length(min=6, max=20),
        Regexp('^[a-zA-Z0-9_]+$', message=_('Username must be at least 10 characters long and only contain letters, numbers, and underscores.'))])
    email = StringField(_('Email'), validators=[DataRequired(), Email(), Length(max=50)], render_kw={'autocomplete': 'username'})
    submit = SubmitField(_('Register'), render_kw={'class': 'btn btn-primary'})

    def validate_username(self, username):
        user = User.query.filter_by(username=username.data).first()
        if user is not None and current_user != user:
            raise ValidationError(_('This username is already taken.'))

    def validate_email(self, email):
        user = User.query.filter_by(email=email.data).first()
        if user is not None and current_user != user:
            raise ValidationError(_('This email is already taken.'))

class PasswordResetRequestForm(Form):
    email = StringField(_('Email'), validators=[DataRequired(), Length(max=50), Email()], render_kw={'autocomplete': 'username'})
    submit = SubmitField(_('Reset Password'), render_kw={'class': 'btn btn-primary'})

class PasswordResetForm(NewPasswordFields):
	submit = SubmitField(_('Update Password'), render_kw={'class': 'btn btn-primary'})


# Profile related forms:
class UpdateProfileForm(RegistrationForm):
    is_active = HiddenField(default='false')
    gravatar_url = HiddenField(_('Gravatar URL'))
    current_password = PasswordField('Confirm Current Password', validators=[DataRequired()], render_kw={'autocomplete': 'off'})
    update_profile = SubmitField(_('Update profile'), render_kw={'class': 'btn btn-primary'})
    cancel = SubmitField(_('Cancel'), render_kw={'class': 'btn btn-primary', 'formnovalidate': 'formnovalidate'})
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.password.label.text = "New Password"
        self.confirm_password.label.text = "Confirm New Password"
        self._make_password_fields_optional()

    def _make_password_fields_optional(self):
        is_empty = not any(field.data for field in [self.password, self.confirm_password])
        for field in [self.password, self.confirm_password]:
            if is_empty:
                field.validators = [Optional(strip_whitespace=True)]
            if field.render_kw is None:
                field.render_kw = {'placeholder': "leave blank to keep current password"}
            else:
                field.render_kw.setdefault('placeholder', "leave blank to keep current password")
    
    def validate_current_password(self, current_password):
        if not current_user.check_password(current_password.data):
            raise ValidationError(_('Incorrect current password. Please enter your current password to confirm your identity.'))

class MultiCheckboxField(SelectMultipleField):
    widget = widgets.ListWidget(html_tag='ul', prefix_label=False)
    option_widget = widgets.CheckboxInput()
    
class UpdatePreferencesForm(Form):
    is_active = HiddenField(default='false')
    category = MultiCheckboxField(_('Select Categories'), coerce=int)
    age_group = MultiCheckboxField(_('Select Age Groups'), coerce=int)
    tag = MultiCheckboxField(_('Select Tags'), coerce=int)
    update_preferences = SubmitField(_('Update preferences'), render_kw={'class': 'btn btn-primary'})
    cancel = SubmitField(_('Cancel'), render_kw={'class': 'btn btn-primary', 'formnovalidate': 'formnovalidate'})


# Friends related forms:
class SearchUsersForm(Form):
    search_text = StringField(_('Search users'), validators=[DataRequired()], render_kw={'placeholder': _('Search users')})
    search = SubmitField(_('Search'), render_kw={'class': 'btn btn-primary search-btn'})
    
class AddListForm(Form):
    name = StringField(_('List Name'), validators=[DataRequired(), Length(max=50)])
    visibility = SelectField(_('Visibility'), choices=[('public', _('Public')), ('private', _('Private'))], default='private')
    add_list = SubmitField(_('Save'), render_kw={'class': 'btn btn-primary'})