from flask import render_template
from flask_login import login_required
from . import admin
from ..models import User


@admin.route('/users')
@login_required
def list_users():
    """
    List all registered users
    """
    users = User.query.all()
    return render_template('admin/users.html', users=users)
