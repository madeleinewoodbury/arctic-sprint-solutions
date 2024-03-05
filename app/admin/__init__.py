from app import db, admin_manager
from flask_admin.contrib.sqla import ModelView
from app.models import User
from flask_login import current_user


class AdminModelView(ModelView):

    def is_accessible(self):
        """Checks db to see if current user is admin"""
        return current_user.is_authenticated and current_user.is_admin


admin_manager.add_view(AdminModelView(User, db.session))
