import calendar
from datetime import datetime
from flask import flash, redirect, url_for, request, abort
from flask_login import current_user
from flask_admin import BaseView, expose
from flask_admin.contrib.sqla import filters
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
)
from flask_admin.contrib.sqla import ModelView
from app.admin import db
from sqlalchemy import func
from itertools import chain
from ..email import send_email


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
        # "list_of_achievements", - Ikke i bruk
        "list_of_visited_attractions",
        "email",
        "created_at",
        "country",
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
    
    @staticmethod
    def on_form_prefill(form, id):
        UserView.changed_user = User.query.get(id)
        
    def on_model_change(self, form, model, is_created):
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
    )
    # Oppdaterer CSV export funksjonen.
    # https://blog.est.im/2022/stdout-05
    def _export_csv(self, return_url):
          r = super(TagView, self)._export_csv(return_url)
          r.response = chain((b'\xef\xbb\xbf',), r.response)
          return r
    form_columns = ["name"]
    column_list = ["name"]

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
        "tags",
        "points",
        "age_groups",
        "visit_count",
    ]

    column_filters = ["tags", "age_groups", "visit_count"]

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
            # achievements_data=achievements_data,
            attractions_data=attractions_data,
        )
    

