from flask import render_template
from app import app
from app.models import Attraction

@app.route('/attractions')
def show_attractions():
    attractions = Attraction.query.all()
    return render_template('attractions.html', attractions=attractions)