import calendar
from datetime import datetime
from markupsafe import Markup
from flask import flash, redirect, url_for, request, abort
from flask_login import current_user
from flask_admin import BaseView, expose
from flask_admin.contrib.sqla import filters
from flask_admin.contrib.sqla import ModelView
from flask_admin.model.form import InlineFormAdmin
from app.admin import db
from sqlalchemy import func
from itertools import chain
from wtforms.validators import DataRequired, Email
from wtforms.widgets import PasswordInput, HiddenInput
from ..email import send_email
from app.admin.forms import ReportForm
from app.models import (
    db,
    AgeGroup,
    Attraction,
    AttractionAgeGroup,
    AttractionCategory,
    AttractionGroup,
    AttractionTag,
    Badge,
    BadgeRequirement,
    Category,
    City,
    Comment,
    Friendship,
    GroupedAttraction,
    Tag,
    User,
    UserAchievement,
    UserAgeGroupPreference,
    UserCategoryPreference,
    UserTagPreference,
    UserBadge,
    UserRole,
    VisitedAttraction,
)


class AdminModelView(ModelView):
    """
    Base view for admin models.
    Provides common functionality and access control for admin views.
    """

    def is_accessible(self):
        """Checks db to see if current user is admin"""
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        """Redirects to login page if user is not admin"""
        return redirect(url_for("auth.login", next=request.url))

    def has_role(self, role):
        """Check current user's role against the given role parameter"""
        query = UserRole.query.filter(UserRole.title == role).first()
        if query and query.id == current_user.role:
            return True
        return False

    def _run_view(self, fn, *args, **kwargs):
        """Remove create and delete permissions if user doesnt have the Administrator role"""
        if self.has_role("Administrator"):
            self.can_delete = True
            self.can_create = True
        else:
            self.can_delete = False
            self.can_create = False
        return fn(self, *args, **kwargs)

    def url_formatter(view, context, model, name):
        url = model.image
        return Markup(f"<a href='{url}'>{url}</a>")


class UserView(AdminModelView):
    """
    View for managing users in the admin section.
    Provides functionality for exporting user data, editing user details, and deleting users.
    """

    column_labels = {"role_rel": "Role", "role_rel.title": "Role"}

    can_export = True
    column_export_list = (
        "username",
        "first_name",
        "last_name",
        "email",
        "country",
        "created_at",
        "list_of_badges",
        "list_of_visited_attractions",
    )

    def _export_csv(self, return_url):
        """
        Override the CSV export function to add a UTF-8 BOM (Byte Order Mark) at the beginning of the file.
        This ensures that the exported CSV file is properly encoded.
        """
        r = super(UserView, self)._export_csv(return_url)
        r.response = chain((b"\xef\xbb\xbf",), r.response)
        return r

    can_view_details = True
    column_details_list = [
        "username",
        "first_name",
        "last_name",
        "email",
        "country",
        "created_at",
        "badges_count",
        "list_of_badges",
        "visited_count",
        "list_of_visited_attractions",
    ]
    column_list = [
        "username",
        "email",
        "role_rel",
        "created_at",
        "visited_count",
        "badges_count",
    ]
    column_searchable_list = ["username", "email"]
    column_filters = ["email", "role_rel.title", "created_at"]

    form_create_rules = [
        "username",
        "email",
        "password",
        "first_name",
        "last_name",
        "country",
        "role_rel",
    ]
    form_edit_rules = [
        "username",
        "first_name",
        "last_name",
        "email",
        "country",
        "role_rel",
    ]
    form_args = {
        "username": {"validators": [DataRequired()]},
        "email": {"validators": [DataRequired(), Email()]},
        "password": {
            "validators": [DataRequired()],
            "widget": PasswordInput(hide_value=True),
        },
    }

    def edit_form(self, obj=None):
        """
        Override the edit form to disable the user role field if the current user doesn't have the Administrator role.
        """
        form = super().edit_form(obj=obj)
        if not self.has_role("Administrator"):
            form.role_rel.render_kw = {"disabled": "disabled"}
        return form

    @staticmethod
    def on_form_prefill(form, id):
        """
        Callback function called before pre-filling the edit form.
        Stores the original user object in the view class for later use.
        """
        UserView.changed_user = User.query.get(id)

    def on_model_change(self, form, model, is_created):
        """
        Callback function called when a user model is changed.
        Sends an email notification to the user if their username or email has been changed.
        """
        if "password" in form and form.password.data:
            model.set_password(form.password.data)
        if not is_created:
            changed_user = UserView.changed_user
            if (
                model.username != changed_user.username
                or model.email != changed_user.email
            ):
                send_email(
                    changed_user.email,
                    "Urgent: Admin made changes to your profile.",
                    "email/profile_updated",
                    user=changed_user,
                    email_change=changed_user.email,
                    username_change=changed_user.username,
                    new_email=model.email,
                    new_username=model.username,
                )

    def on_model_delete(self, model):
        """
        Callback function called when a user model is deleted.
        Handles cascading delete for related models.
        """
        if model.id == current_user.id:
            flash("Cannot delete currently logged in user.", "error")
            abort(403)
        self.session.flush()
        attraction_groups = AttractionGroup.query.filter_by(owner=model.id).all()
        for group in attraction_groups:
            GroupedAttraction.query.filter_by(group_id=group.id).delete()
        AttractionGroup.query.filter_by(owner=model.id).delete()
        Friendship.query.filter(
            (Friendship.user_1 == model.id) | (Friendship.user_2 == model.id)
        ).delete()
        UserAchievement.query.filter_by(user_id=model.id).delete()
        UserTagPreference.query.filter_by(user_id=model.id).delete()
        UserBadge.query.filter_by(user_id=model.id).delete()
        UserCategoryPreference.query.filter_by(user_id=model.id).delete()
        UserAgeGroupPreference.query.filter_by(user_id=model.id).delete()
        VisitedAttraction.query.filter_by(user_id=model.id).delete()
        Comment.query.filter_by(user_id=model.id).delete()
        db.session.commit()
        super(UserView, self).on_model_delete(model)

    def _show_missing_fields_warning(self, text):
        """
        Override the method to disable the warning message for missing fields.
        """
        pass


class CategoryView(AdminModelView):
    """
    View for managing categories in the admin section.
    Provides functionality for exporting category data and deleting categories.
    """

    can_export = True
    column_export_list = (
        "name",
        "attraction_count",
    )

    def _export_csv(self, return_url):
        """
        Override the CSV export function to add a UTF-8 BOM (Byte Order Mark) at the beginning of the file.
        This ensures that the exported CSV file is properly encoded.
        """
        r = super(CategoryView, self)._export_csv(return_url)
        r.response = chain((b"\xef\xbb\xbf",), r.response)
        return r

    form_columns = ["name"]
    column_list = ["name", "attraction_count"]

    def on_model_delete(self, model):
        """
        Callback function called when a category model is deleted.
        Handles cascading delete for related models.
        """
        self.session.flush()
        AttractionCategory.query.filter_by(category_id=model.id).delete()
        UserCategoryPreference.query.filter_by(category_id=model.id).delete()
        db.session.commit()
        super(CategoryView, self).on_model_delete(model)


class TagView(AdminModelView):
    """
    View for managing tags in the admin section.
    Provides functionality for exporting tag data and deleting tags.
    """

    can_export = True
    column_export_list = (
        "name",
        "attraction_count",
    )

    def _export_csv(self, return_url):
        """
        Override the CSV export function to add a UTF-8 BOM (Byte Order Mark) at the beginning of the file.
        This ensures that the exported CSV file is properly encoded.
        """
        r = super(TagView, self)._export_csv(return_url)
        r.response = chain((b"\xef\xbb\xbf",), r.response)
        return r

    form_columns = ["name"]
    column_list = ["name", "attraction_count"]

    def on_model_delete(self, model):
        """
        Callback function called when a tag model is deleted.
        Handles cascading delete for related models.
        """
        self.session.flush()
        AttractionTag.query.filter_by(tag_id=model.id).delete()
        UserTagPreference.query.filter_by(tag_id=model.id).delete()
        BadgeRequirement.query.filter_by(tag_id=model.id).delete()
        db.session.commit()
        super(TagView, self).on_model_delete(model)


class AgeGroupView(AdminModelView):
    """
    View for managing age groups in the admin section.
    Provides functionality for exporting age group data and deleting age groups.
    """

    can_export = True
    column_export_list = (
        "name",
        "attraction_count",
    )

    def _export_csv(self, return_url):
        """
        Override the CSV export function to add a UTF-8 BOM (Byte Order Mark) at the beginning of the file.
        This ensures that the exported CSV file is properly encoded.
        """
        r = super(AgeGroupView, self)._export_csv(return_url)
        r.response = chain((b"\xef\xbb\xbf",), r.response)
        return r

    form_columns = ["name"]
    column_list = ["name", "attraction_count"]

    def on_model_delete(self, model):
        """
        Callback function called when an age group model is deleted.
        Handles cascading delete for related models.
        """
        self.session.flush()
        AttractionAgeGroup.query.filter_by(age_group_id=model.id).delete()
        UserAgeGroupPreference.query.filter_by(age_group_id=model.id).delete()
        db.session.commit()
        super(AgeGroupView, self).on_model_delete(model)


class AttractionView(AdminModelView):
    """
    View for managing attractions in the admin section.
    Provides functionality for exporting attraction data and deleting attractions.
    """

    column_labels = {"city_rel": "City", "city_rel.name": "City"}

    can_export = True
    column_export_list = (
        "name",
        "city_rel",
        "location",
        "description",
        "image",
        "category",
        "age_groups",
        "tags",
        "points",
        "visit_count",
        "list_of_visitors",
    )

    def _export_csv(self, return_url):
        """
        Override the CSV export function to add a UTF-8 BOM (Byte Order Mark) at the beginning of the file.
        This ensures that the exported CSV file is properly encoded.
        """
        r = super(AttractionView, self)._export_csv(return_url)
        r.response = chain((b"\xef\xbb\xbf",), r.response)
        return r

    can_view_details = True
    column_details_list = [
        "name",
        "city_rel",
        "location",
        "description",
        "image",
        "category",
        "age_groups",
        "tags",
        "points",
        "visit_count",
        "list_of_visitors",
    ]

    form_columns = [
        "name",
        "city_rel",
        "location",
        "description",
        "image",
        "category",
        "age_groups",
        "tags",
        "points",
    ]
    column_list = [
        "name",
        "city_rel",
        "location",
        "category",
        "age_groups",
        "tags",
        "points",
        "visit_count",
    ]
    column_filters = [
        "name",
        "city_rel.name",
        "category",
        "age_groups",
        "tags",
        "points",
        "visit_count",
    ]

    column_formatters = {"image": AdminModelView.url_formatter}

    def on_model_delete(self, model):
        """Handle cascading delete"""
        self.session.flush()
        AttractionAgeGroup.query.filter_by(attraction_id=model.id).delete()
        AttractionCategory.query.filter_by(attraction_id=model.id).delete()
        AttractionTag.query.filter_by(attraction_id=model.id).delete()
        GroupedAttraction.query.filter_by(attraction_id=model.id).delete()
        VisitedAttraction.query.filter_by(attraction_id=model.id).delete()
        db.session.commit()
        super(AttractionView, self).on_model_delete(model)


class CitiesView(AdminModelView):
    """
    View class for managing cities in the admin panel.
    """

    can_export = True
    column_export_list = (
        "name",
        "description",
        "image",
        "country",
        "attractions_count",
    )

    def _export_csv(self, return_url):
        """
        Override the CSV export function to add a UTF-8 BOM (Byte Order Mark) at the beginning of the response.
        This ensures that the exported CSV file is correctly interpreted as UTF-8 encoded.
        """
        r = super(CitiesView, self)._export_csv(return_url)
        r.response = chain((b"\xef\xbb\xbf",), r.response)
        return r

    can_view_details = True
    column_details_list = [
        "name",
        "description",
        "image",
        "country",
        "attractions_count",
    ]

    form_columns = ["name", "description", "image", "country"]
    column_list = ["name", "country", "attractions_count"]
    column_formatters = {"image": AdminModelView.url_formatter}


class BadgeView(AdminModelView):
    """
    View class for managing badges in the admin panel.
    """

    inline_models = [
        (
            BadgeRequirement,
            {
                "form_label": "Requirements",
                "form_columns": ("id", "tag", "quantity_required"),
            },
        )
    ]

    can_export = True
    column_export_list = ("name", "description", "requirements", "achieved_count")

    def _export_csv(self, return_url):
        """
        Override the CSV export function to add a UTF-8 BOM (Byte Order Mark) at the beginning of the response.
        This ensures that the exported CSV file is correctly interpreted as UTF-8 encoded.
        """
        r = super(BadgeView, self)._export_csv(return_url)
        r.response = chain((b"\xef\xbb\xbf",), r.response)
        return r

    can_view_details = True
    column_details_list = [
        "name",
        "description",
        "requirements",
        "achieved_count",
        "list_of_achievers",
    ]

    form_columns = [
        "name",
        "description",
    ]
    column_list = ["name", "description", "requirements", "achieved_count"]
    column_filters = ["name", "description", "achieved_count"]


class BadgeRequirementInlineModelForm(InlineFormAdmin):
    """
    Form for managing badge requirements in the admin interface.

    This form is used to define the fields and behavior of the inline form for badge requirements.
    It specifies the columns to display, the arguments for each column, and the widget for the 'id' field.

    Attributes:
        form_columns (tuple): A tuple of column names to display in the form.
        form_args (dict): A dictionary of arguments for each form column.

    """

    form_columns = ("id", "tag", "quantity_required")
    form_args = {
        "id": {"widget": HiddenInput()},
        "tag": {"query_factory": lambda: Tag.query.all(), "allow_blank": False},
    }


class ReportView(BaseView):
    """
    View class for generating reports.

    This class provides functionality for generating reports based on user badges and visited attractions.
    It inherits from the BaseView class.

    Attributes:
        None

    Methods:
        is_accessible: Checks if the current user is authenticated and an admin.
        inaccessible_callback: Redirects the user to the login page if they are not an admin.
        index: Renders the report page and handles form submission.

    """

    def is_accessible(self):
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        flash("You must be an admin to access this page.", "error")
        return redirect(url_for("auth.login", next=request.url))

    @expose("/", methods=("GET", "POST"))
    def index(self):
        form = ReportForm(request.form)
        today = datetime.today()

        if request.method == "POST" and form.validate_on_submit():
            selected_year = int(form.year.data)
            selected_month = int(form.month.data)
        else:
            if request.method == "GET":
                form.year.data = str(today.year)
                form.month.data = str(today.month)
            selected_year = today.year
            selected_month = today.month

        month_name = calendar.month_name[selected_month]

        # Monthly Achievements
        badges_data = (
            db.session.query(
                Badge.name,
                db.func.count(
                    db.case(
                        (
                            db.and_(
                                db.extract("year", UserBadge.date_earned)
                                == selected_year,
                                db.extract("month", UserBadge.date_earned)
                                == selected_month,
                            ),
                            1,
                        )
                    )
                ).label("monthly_acquired"),
                db.func.sum(
                    db.case(
                        (
                            db.extract("year", UserBadge.date_earned) == selected_year,
                            1,
                        ),
                        else_=0,
                    )
                ).label("yearly_acquired"),
                db.func.count(UserBadge.badge_id).label("total_acquired"),
            )
            .join(UserBadge)
            .group_by(Badge.name)
            .all()
        )

        # Monthly Attractions
        attractions_data = (
            db.session.query(
                Attraction.name,
                db.func.count(
                    db.case(
                        (
                            db.and_(
                                db.extract("year", VisitedAttraction.time_visited)
                                == selected_year,
                                db.extract("month", VisitedAttraction.time_visited)
                                == selected_month,
                            ),
                            1,
                        )
                    )
                ).label("monthly_visits"),
                db.func.sum(
                    db.case(
                        (
                            db.extract("year", VisitedAttraction.time_visited)
                            == selected_year,
                            1,
                        ),
                        else_=0,
                    )
                ).label("yearly_visits"),
                db.func.count(VisitedAttraction.attraction_id).label("total_visits"),
            )
            .join(VisitedAttraction)
            .group_by(Attraction.name)
            .all()
        )

        return self.render(
            "admin/report.html",
            form=form,
            month_name=month_name,
            selected_year=selected_year,
            badges_data=badges_data,
            attractions_data=attractions_data,
        )
