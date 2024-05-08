import calendar
from datetime import datetime
from flask import flash, redirect, url_for, request
from flask_login import current_user
from flask_admin import BaseView, expose
from flask_admin.contrib.sqla import filters
from flask_admin.contrib.sqla import ModelView
from app.admin import db
from sqlalchemy import func
from itertools import chain
from wtforms.validators import DataRequired, Email
from wtforms.widgets import PasswordInput
from ..email import send_email
from app.admin.forms import ReportForm
from app.models import (
    UserAchievement,
    Achievement,
    Attraction,
    VisitedAttraction,
    Country,
    db,
    User,
    Category,
    Tag,
    AgeGroup,
    City,
    Badge,
    UserBadge
)


class AdminModelView(ModelView):

    def is_accessible(self):
        """Checks db to see if current user is admin"""
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        """Redirects to login page if user is not admin"""
        return redirect(url_for("auth.login", next=request.url))


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
        "list_of_badges",
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
        "username", "email", "password", "first_name", "last_name", "country", "role_rel"
    ]
    form_edit_rules = [
        "username", "first_name", "last_name", "email", "country", "role_rel"
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
    
    def _show_missing_fields_warning(self, text):
        pass
    

class AchievementsView(AdminModelView):
    can_export = True
    column_export_list = (
        "title",
        "description",
        "user_count",
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(AchievementsView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r

    form_columns = ["title", "description"]
    column_list = ["title", "description", "user_count"]


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


class AttractionView(AdminModelView):
    can_export = True
    column_export_list = (
        "name",
        "city_rel",
        "location",
        "description",
        "image",
        "tags",
        "points",
        "age_groups",
        "visit_count",
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
        "tags",
        "points",
        "age_groups",
    ]
    column_list = [
        "name",
        "city_rel",
        "location",
        "description",
        "image",
        "tags",
        "points",
        "age_groups",
        "visit_count",
    ]

    column_filters = ["tags", "age_groups", "visit_count"]


class CitiesView(AdminModelView):
    can_export = True
    column_export_list = (
        "name",
        "country",
        "image",
        "description",
        "attractions_count",
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(CitiesView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r
    
    form_columns = [
        "name",
        "country",
        "image",
        "description",
    ]
    column_list = [
        "name",
        "country",
        "image",
        "description",
        "attractions_count",
    ]


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
    

