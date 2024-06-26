"""Blueprint for authentication related routes/forms

Keyword arguments:
argument -- N/A
Return:
	auth blueprint: The Blueprint object for authentication.
"""

from flask import Blueprint

auth = Blueprint('auth', __name__, template_folder='templates')

from . import views, forms