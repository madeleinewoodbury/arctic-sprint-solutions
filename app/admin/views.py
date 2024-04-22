import calendar
from datetime import datetime
from flask import flash, redirect, url_for, request
from flask_login import current_user
from flask_admin import BaseView, expose
from flask_admin.contrib.sqla import filters
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
)
from flask_admin.contrib.sqla import ModelView
from app.admin import db
from sqlalchemy import func


class AdminModelView(ModelView):

    def is_accessible(self):
        """Checks db to see if current user is admin"""
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        """Redirects to login page if user is not admin"""
        return redirect(url_for("auth.login", next=request.url))


class UserView(AdminModelView):

    can_view_details = True
    column_details_list = [
        "username",
        "first_name",
        "last_name",
        "list_of_achievements",
        "list_of_visited_attractions",
        "email",
        "created_at",
    ]
    form_columns = [
        "username",
        "email",
        "role_rel",
        "country",
    ]
    column_searchable_list = ["username", "email"]
    column_filters = ["created_at", "email"]
    column_list = [
        "username",
        "email",
        "role_rel",
        "number_of_achievements",
        # "#attractions"
    ]


class AchievementsView(AdminModelView):
    form_columns = ["title", "description"]
    column_list = ["title", "description", "user_count"]


class CategoryView(AdminModelView):
    form_columns = ["name"]
    column_list = ["name", "attraction_count"]


class TagView(AdminModelView):
    form_columns = ["name"]
    column_list = ["name"]


class AgeGroupView(AdminModelView):
    form_columns = ["name"]
    column_list = ["name", "attraction_count"]


class AttractionView(AdminModelView):

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
        achievements_data = (
            db.session.query(
                Achievement.title,
                db.func.count(
                    db.case(
                        (
                            db.and_(
                                db.extract("year", UserAchievement.time_achieved)
                                == selected_year,
                                db.extract("month", UserAchievement.time_achieved)
                                == selected_month,
                            ),
                            1,
                        )
                    )
                ).label("monthly_acquired"),
                db.func.sum(
                    db.case(
                        (
                            db.extract("year", UserAchievement.time_achieved)
                            == selected_year,
                            1,
                        ),
                        else_=0,
                    )
                ).label("yearly_acquired"),
                db.func.count(UserAchievement.achievement_id).label("total_acquired"),
            )
            .join(UserAchievement)
            .group_by(Achievement.title)
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
            achievements_data=achievements_data,
            attractions_data=attractions_data,
        )
