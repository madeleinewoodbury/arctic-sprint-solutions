from app import db, admin_manager
from flask import redirect, url_for, request
from flask_admin.contrib.sqla import ModelView
from app.models import (
    User,
    Category,
    Tag,
    AgeGroup,
    Attraction,
    Achievement,
    UserAchievement,
)
from flask_login import current_user


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


admin_manager.add_view(UserView(User, db.session, category="Edit Database"))
admin_manager.add_view(
    CategoryView(Category, db.session, category="Edit Database"),
)
admin_manager.add_view(TagView(Tag, db.session, category="Edit Database"))
admin_manager.add_view(AgeGroupView(AgeGroup, db.session, category="Edit Database"))
admin_manager.add_view(AttractionView(Attraction, db.session, category="Edit Database"))
admin_manager.add_view(
    AchievementsView(Achievement, db.session, category="Edit Database")
)
