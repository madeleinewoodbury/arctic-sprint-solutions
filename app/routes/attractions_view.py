from flask import Blueprint, render_template
from app.models import Attraction

attractions = Blueprint('attractions', __name__)

@attractions.route('/attractions')
def show_attractions():
    attractions = Attraction.query.all()
    return render_template('attractions.html', attractions=attractions)