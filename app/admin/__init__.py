from app import db, admin_manager
from flask import redirect, url_for, request
from flask_admin.contrib.sqla import ModelView
from app.models import User, Category, Tag, AgeGroup, Attraction
from flask_login import current_user


class AdminModelView(ModelView):

    def is_accessible(self):
        """Checks db to see if current user is admin"""
        return current_user.is_authenticated and current_user.is_admin

    def inaccessible_callback(self, name, **kwargs):
        """Redirects to login page if user is not admin"""
        return redirect(url_for('auth.login', next=request.url))


class UserView(AdminModelView):
    form_columns = ['username', 'first_name', 'last_name',
                    'email', 'password', 'created_at', 'role_rel']
    column_list = ['id', 'username', 'first_name', 'last_name',
                   'email', 'password', 'created_at', 'role_rel']


class CategoryView(AdminModelView):
    form_columns = ['name']
    column_list = ['id', 'name']


class TagView(AdminModelView):
    form_columns = ['name']
    column_list = ['id', 'name']


class AgeGroupView(AdminModelView):
    form_columns = ['name']
    column_list = ['id', 'name']


class AttractionView(AdminModelView):
    form_columns = ['name', 'city', 'location',
                    'description', 'image', 'points']
    column_list = ['id', 'name', 'city', 'location',
                   'description', 'image', 'points']


admin_manager.add_view(UserView(User, db.session, category="Edit Database"))
admin_manager.add_view(CategoryView(
    Category, db.session, category="Edit Database"),)
admin_manager.add_view(TagView(Tag, db.session, category="Edit Database"))
admin_manager.add_view(AgeGroupView(
    AgeGroup, db.session, category="Edit Database"))
admin_manager.add_view(AttractionView(
    Attraction, db.session, category="Edit Database"))
