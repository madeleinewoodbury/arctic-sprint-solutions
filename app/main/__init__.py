"""
Main Blueprint:
This blueprint contains routes and views for the main functionality of the application

Keyword arguments:
argument -- N/A
Return:
	main blueprint: The Blueprint object for main functionality.
"""

from flask import Blueprint

main = Blueprint('main', __name__, template_folder='templates')

from . import views, forms