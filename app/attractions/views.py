from flask import render_template, abort, request
from . import attractions
from app.models import Attraction
from app import db


# Get attractions in plural
@attractions.route('/attractions', methods=['GET'])
def get_attractions():
    attractions = db.session.query(Attraction).all()
    attraction_list = []
    for attraction in attractions:
        attraction_data = {
            'id': attraction.id,
            'name': attraction.name,
            'description': attraction.description,
            'location': attraction.location,
            'image': attraction.image,
            'points': attraction.points
        }
        attraction_list.append(attraction_data)
    return render_template('attractions.html', attractions=attraction_list)



# Get single attraction
@attractions.route('/attractions/<int:attraction_id>', methods=['GET'])
def get_attraction(attraction_id):
    attraction = Attraction.query.get(attraction_id)

    if not attraction:
        abort(404)  # Raise a 404 error if not found

    return render_template('attraction.html', attraction=attraction)