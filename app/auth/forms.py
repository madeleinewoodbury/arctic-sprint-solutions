from flask_wtf import FlaskForm as Form
from wtforms import (
    StringField,
    PasswordField,
    BooleanField,
    SubmitField,
    HiddenField,
    SelectMultipleField,
    SelectField,
    widgets,
)
from wtforms.validators import (
    DataRequired,
    Length,
    EqualTo,
    ValidationError,
    Regexp,
    Email,
    Optional,
)
from app.models import User
from flask_babel import lazy_gettext as _
from flask_login import current_user


class NewPasswordFields(Form):
    """
    Form class for handling new password fields.

    Attributes:
        password (PasswordField): Field for entering the new password.
        confirm_password (PasswordField): Field for confirming the new password.
    """

    password = PasswordField(
        "Password",
        validators=[
            DataRequired(),
            Regexp(
                "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{10,40}$",
                message=_(
                    "Password must be at least 10 characters long while containing at least one uppercase letter, one lowercase letter, and one number."
                ),
            ),
        ],
        render_kw={"autocomplete": "new-password"},
    )
    confirm_password = PasswordField(
        "Confirm Password", validators=[DataRequired(), EqualTo("password")]
    )


# Login and registration related forms:
class LoginForm(Form):
    """
    Represents a login form.

    Attributes:
        email (StringField): The email field for the login form.
        password (PasswordField): The password field for the login form.
        remember_me (BooleanField): The remember me checkbox for the login form.
        submit (SubmitField): The submit button for the login form.
    """

    email = StringField(
        _("Email"),
        validators=[DataRequired(), Email()],
        render_kw={"autocomplete": "username"},
    )
    password = PasswordField(_("Password"), validators=[DataRequired()])
    remember_me = BooleanField(_("Remember me"))
    submit = SubmitField(_("Login"), render_kw={"class": "btn btn-primary"})


class RegistrationForm(NewPasswordFields):
    """
    Form for user registration.

    Inherits from NewPasswordFields class.

    Attributes:
        country (SelectField): Field for selecting the country.
        first_name (StringField): Field for entering the first name.
        last_name (StringField): Field for entering the last name.
        username (StringField): Field for entering the username.
        email (StringField): Field for entering the email.
        submit (SubmitField): Button for submitting the form.

    Methods:
        validate_username: Validates the uniqueness of the username.
        validate_email: Validates the uniqueness of the email.
    """

    country = SelectField(_("Country"), coerce=int)
    first_name = StringField(
        _("First Name"), validators=[DataRequired(), Length(max=50)]
    )
    last_name = StringField(_("Last Name"), validators=[DataRequired(), Length(max=50)])
    username = StringField(
        _("Username"),
        validators=[
            DataRequired(),
            Length(min=6, max=20),
            Regexp(
                "^[a-zA-Z0-9_]+$",
                message=_(
                    "Username must be at least 10 characters long and only contain letters, numbers, and underscores."
                ),
            ),
        ],
    )
    email = StringField(
        _("Email"),
        validators=[DataRequired(), Email(), Length(max=50)],
        render_kw={"autocomplete": "username"},
    )
    submit = SubmitField(_("Register"), render_kw={"class": "btn btn-primary"})

    def validate_username(self, username):
        """
        Validates the uniqueness of the username.

        Args:
            username (str): The username to be validated.

        Raises:
            ValidationError: If the username is already taken.
        """
        user = User.query.filter_by(username=username.data).first()
        if user is not None and current_user != user:
            raise ValidationError(_("This username is already taken."))

    def validate_email(self, email):
        """
        Validates the uniqueness of the email.

        Args:
            email (str): The email to be validated.

        Raises:
            ValidationError: If the email is already taken.
        """
        user = User.query.filter_by(email=email.data).first()
        if user is not None and current_user != user:
            raise ValidationError(_("This email is already taken."))


class PasswordResetRequestForm(Form):
    """
    Form for requesting a password reset.

    Attributes:
        email (StringField): Field for entering the email address.
        submit (SubmitField): Button for submitting the form.
    """

    email = StringField(
        _("Email"),
        validators=[DataRequired(), Length(max=50), Email()],
        render_kw={"autocomplete": "username"},
    )
    submit = SubmitField(_("Reset Password"), render_kw={"class": "btn btn-primary"})


class PasswordResetForm(NewPasswordFields):
    """
    Form for resetting a user's password.

    Inherits from the `NewPasswordFields` class and adds a submit button.

    Attributes:
        submit (SubmitField): Button for updating the password.

    """

    submit = SubmitField(_("Update Password"), render_kw={"class": "btn btn-primary"})


# Profile related forms:
class UpdateProfileForm(RegistrationForm):
    """
    A form used for updating user profiles.

    Inherits from the `RegistrationForm` class.

    Attributes:
        is_active (HiddenField): A hidden field indicating whether the user is active.
        gravatar_url (HiddenField): A hidden field for the Gravatar URL.
        current_password (PasswordField): A password field for confirming the current password.
        update_profile (SubmitField): A submit button for updating the profile.
        cancel (SubmitField): A submit button for canceling the update.

    Methods:
        __init__: Initializes the form.
        _make_password_fields_optional: Makes the password fields optional if they are empty.
        validate_current_password: Validates the current password entered by the user.

    """

    is_active = HiddenField(default="false")
    gravatar_url = HiddenField(_("Gravatar URL"))
    current_password = PasswordField(
        "Confirm Current Password",
        validators=[DataRequired()],
        render_kw={"autocomplete": "off"},
    )
    update_profile = SubmitField(
        _("Update profile"), render_kw={"class": "btn btn-primary"}
    )
    cancel = SubmitField(
        _("Cancel"),
        render_kw={"class": "btn btn-danger", "formnovalidate": "formnovalidate"},
    )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.password.label.text = "New Password"
        self.confirm_password.label.text = "Confirm New Password"
        self._make_password_fields_optional()

    def _make_password_fields_optional(self):
        """
        Makes the password fields optional if they are empty.
        """
        is_empty = not any(
            field.data for field in [self.password, self.confirm_password]
        )
        for field in [self.password, self.confirm_password]:
            if is_empty:
                field.validators = [Optional(strip_whitespace=True)]
            if field.render_kw is None:
                field.render_kw = {
                    "placeholder": "leave blank to keep current password"
                }
            else:
                field.render_kw.setdefault(
                    "placeholder", "leave blank to keep current password"
                )

    def validate_current_password(self, current_password):
        """
        Validates the current password entered by the user.

        Args:
            current_password (PasswordField): The current password entered by the user.

        Raises:
            ValidationError: If the current password is incorrect.

        """
        if not current_user.check_password(current_password.data):
            raise ValidationError(
                _(
                    "Incorrect current password. Please enter your current password to confirm your identity."
                )
            )


class MultiCheckboxField(SelectMultipleField):
    """
    A custom form field that represents a multi-checkbox input.

    This field inherits from the `SelectMultipleField` class and provides a widget
    that renders a list of checkboxes. Each checkbox represents an option that can
    be selected by the user.

    Attributes:
        widget (Widget): The widget used to render the field. It is set to a `ListWidget`
            with an unordered list (`ul`) HTML tag and no prefix label.
        option_widget (Widget): The widget used to render each option. It is set to a
            `CheckboxInput` widget.

    Usage:
        To use this field in a form, simply instantiate it and pass it as a field in
        the form's `FieldList` or `FormField`:


        class MyForm(FlaskForm):
            my_field = MultiCheckboxField(choices=[('option1', 'Option 1'), ('option2', 'Option 2')])


        In the above example, `my_field` will render a list of checkboxes with two options:
        'Option 1' and 'Option 2'.
    """

    widget = widgets.ListWidget(html_tag="ul", prefix_label=False)
    option_widget = widgets.CheckboxInput()


class UpdatePreferencesForm(Form):
    """
    A form for updating user preferences.

    Attributes:
        is_active (HiddenField): A hidden field indicating if the form is active.
        category (MultiCheckboxField): A field for selecting categories.
        age_group (MultiCheckboxField): A field for selecting age groups.
        tag (MultiCheckboxField): A field for selecting tags.
        update_preferences (SubmitField): A button for updating preferences.
        cancel (SubmitField): A button for canceling the form.
    """

    is_active = HiddenField(default="false")
    category = MultiCheckboxField(_("Select Categories"), coerce=int)
    age_group = MultiCheckboxField(_("Select Age Groups"), coerce=int)
    tag = MultiCheckboxField(_("Select Tags"), coerce=int)
    update_preferences = SubmitField(
        _("Update preferences"), render_kw={"class": "btn btn-primary"}
    )
    cancel = SubmitField(
        _("Cancel"),
        render_kw={"class": "btn btn-danger", "formnovalidate": "formnovalidate"},
    )


# Friends related forms:
class SearchUsersForm(Form):
    """
    Form for searching users.

    Attributes:
        search_text (StringField): Field for entering the search text.
        search (SubmitField): Button for submitting the search.
    """

    search_text = StringField(
        _("Search users"),
        validators=[DataRequired()],
        render_kw={"placeholder": _("Search users")},
    )
    search = SubmitField(_("Search"), render_kw={"class": "btn btn-primary search-btn"})


class AddListForm(Form):
    """
    Form for adding a new list.

    Attributes:
        name (StringField): The name of the list.
        visibility (SelectField): The visibility of the list (public or private).
        add_list (SubmitField): The save button for the form.
    """

    name = StringField(_("List Name"), validators=[DataRequired(), Length(max=50)])
    visibility = SelectField(
        _("Visibility"),
        choices=[("public", _("Public")), ("private", _("Private"))],
        default="private",
    )
    add_list = SubmitField(_("Save"), render_kw={"class": "btn btn-primary"})


class EditListForm(Form):
    """
    Form for editing a list.

    Attributes:
        group_id (HiddenField): Hidden field for storing the group ID.
        name (StringField): Field for entering the list name.
        visibility (SelectField): Field for selecting the visibility of the list.
        edit_list (SubmitField): Button for updating the list.
    """

    group_id = HiddenField()
    name = StringField(_("List Name"), validators=[DataRequired(), Length(max=50)])
    visibility = SelectField(
        _("Visibility"),
        choices=[("public", _("Public")), ("private", _("Private"))],
        default="private",
    )
    edit_list = SubmitField(_("Update"), render_kw={"class": "btn btn-primary"})
