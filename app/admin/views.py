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
    UserAchievement,
    Achievement,
    Attraction,
    VisitedAttraction,
    AttractionCategory,
    AttractionTag,
    UserTagPreference, 
    UserCategoryPreference,
    BadgeRequirement,
    AttractionAgeGroup,
    UserAgeGroupPreference,
    GroupedAttraction,
    Friendship,
    AttractionGroup,
    UserBadge,
    Comment,
    Country,
    db,
    User,
    Category,
    Tag,
    AgeGroup,
    City,
    Badge,
    UserBadge,
    BadgeRequirement,
    UserRole
)


class AdminModelView(ModelView):

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
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(UserView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
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
        "visited_count",
        "badges_count",
    ]
    column_searchable_list = ["username", "email"]
    column_filters = ["created_at", "email"]
    
    form_create_rules = [
        "username",
        "email",
        "password",
        "first_name",
        "last_name",
        "country",
        "role_rel"
    ]
    form_edit_rules = [
        "username",
        "first_name",
        "last_name",
        "email",
        "country",
        "role_rel"
    ]
    form_args = {
        "username": {
            "validators": [DataRequired()]
        },
        "email": {
            "validators": [DataRequired(), Email()]
        },
        "password": {
            "validators": [DataRequired()],
            "widget": PasswordInput(hide_value=True)
        }
    }
    # Disable user role edit field when current user doesnt have Administrator role
    def edit_form(self, obj=None):
        form = super().edit_form(obj=obj)
        if not self.has_role("Administrator"):
            form.role_rel.render_kw = {'disabled': 'disabled'}
        return form
    
    @staticmethod
    def on_form_prefill(form, id):
        UserView.changed_user = User.query.get(id)
        
    def on_model_change(self, form, model, is_created):
        if 'password' in form and form.password.data:
            model.set_password(form.password.data)
        if not is_created:
            changed_user = UserView.changed_user
            if model.username != changed_user.username or model.email != changed_user.email:
                send_email(changed_user.email, 'Urgent: Admin made changes to your profile.', 'email/profile_updated',
                    user=changed_user, email_change=changed_user.email, username_change=changed_user.username,
                    new_email=model.email, new_username=model.username)
                
    def on_model_delete(self, model):
        """Handle cascading delete"""
        if model.id == current_user.id:
            flash("Cannot delete currently logged in user.", "error")
            abort(403)
        self.session.flush()
        attraction_groups = AttractionGroup.query.filter_by(owner=model.id).all()
        for group in attraction_groups:
            GroupedAttraction.query.filter_by(group_id=group.id).delete()
        AttractionGroup.query.filter_by(owner=model.id).delete()
        Friendship.query.filter((Friendship.user_1 == model.id) | (Friendship.user_2 == model.id)).delete()
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
        pass
    

class CategoryView(AdminModelView):
    can_export = True
    column_export_list = (
        "name",
        "attraction_count",
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(CategoryView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r
    form_columns = ["name"]
    column_list = ["name", "attraction_count"]

    def on_model_delete(self, model):
        """Handle cascading delete"""
        self.session.flush()
        AttractionCategory.query.filter_by(category_id=model.id).delete()
        UserCategoryPreference.query.filter_by(category_id=model.id).delete()
        db.session.commit()
        super(CategoryView, self).on_model_delete(model)


class TagView(AdminModelView):
    can_export = True
    column_export_list = (
        "name",
        "attraction_count",
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(TagView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r
    form_columns = ["name"]
    column_list = ["name", "attraction_count"]

    def on_model_delete(self, model):
        """Handle cascading delete"""
        self.session.flush()
        AttractionTag.query.filter_by(tag_id=model.id).delete()
        UserTagPreference.query.filter_by(tag_id=model.id).delete()
        BadgeRequirement.query.filter_by(tag_id=model.id).delete()
        db.session.commit()
        super(TagView, self).on_model_delete(model)


class AgeGroupView(AdminModelView):
    can_export = True
    column_export_list = (
        "name", 
        "attraction_count",
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(AgeGroupView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r
    form_columns = ["name"]
    column_list = ["name", "attraction_count"]

    def on_model_delete(self, model):
        """Handle cascading delete"""
        self.session.flush()
        AttractionAgeGroup.query.filter_by(age_group_id=model.id).delete()
        UserAgeGroupPreference.query.filter_by(age_group_id=model.id).delete()
        db.session.commit()
        super(AgeGroupView, self).on_model_delete(model)


class AttractionView(AdminModelView):
    column_labels = {
        "city_rel": "City",
        "city_rel.name": "City",
    }
    
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
        "list_of_visitors"
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(AttractionView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r

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
        "list_of_visitors"
    ]

    column_filters = [
        "name",
        "city_rel.name",
        "category",
        "age_groups",
        "tags",
        "points",
        "visit_count"
        ]
    
    column_formatters = {
        "image": AdminModelView.url_formatter
    }

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
    can_export = True
    column_export_list = (
        "name",
        "description",
        "image",
        "country",
        "attractions_count"
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(CitiesView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r
    
    form_columns = [
        "name",
        "description",
        "image",
        "country"
    ]
    column_list = [
        "name",
        "country",
        "attractions_count"
    ]
    can_view_details = True
    column_details_list = [
        "name",
        "description",
        "image",
        "country",
        "attractions_count"
    ]
    column_formatters = {
        "image": AdminModelView.url_formatter
    }


class BadgeView(AdminModelView):
    inline_models = [(BadgeRequirement, {
        'form_label': 'Requirements',
        'form_columns': ('id', 'tag', 'quantity_required')
    })]
    can_export = True
    column_export_list = (
        "name",
        "description",
        "requirements",
        "achieved_count"
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(AttractionView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r

    form_columns = [
        "name",
        "description",
    ]
    column_list = [
        "name",
        "description",
        "requirements",
        "achieved_count"
    ]
    column_filters = [
        "name",
        "description",
        "achieved_count"
    ]
    can_view_details = True
    column_details_list = [
        "name",
        "description",
        "requirements",
        "achieved_count",
        "list_of_achievers"
    ]
    

class BadgeRequirementInlineModelForm(InlineFormAdmin):
    form_columns = ('id', 'tag', 'quantity_required')
    form_args = {
        'id': {
            'widget': HiddenInput()
        },
        'tag': {
            'query_factory': lambda: Tag.query.all(),
            'allow_blank': False
        }
    }


class ReportView(BaseView):
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
                            db.extract("year", UserBadge.date_earned)
                            == selected_year,
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
    

