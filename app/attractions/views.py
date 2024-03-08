from flask import render_template, abort, request
from . import attractions
from app.models import Attraction
from app import db


# Get all attractions
@attractions.route('/attractions', methods=['GET', 'POST'])
def get_attractions():
    search_query = request.form.get('search_query')

    # Search for attraction by name
    if search_query:
        attractions = Attraction.query.filter(Attraction.name.contains(search_query)).all()
        return render_template('attractions.html', attractions=attractions)

    attractions = db.session.query(Attraction).all()
    return render_template('attractions.html', attractions=attractions)


# Get single attraction
@attractions.route('/attractions/<int:attraction_id>', methods=['GET'])
def get_attraction(attraction_id):
    attraction = Attraction.query.get(attraction_id)

    if not attraction:
        abort(404)  # Raise a 404 error if not found

    return render_template('attraction.html', attraction=attraction)

