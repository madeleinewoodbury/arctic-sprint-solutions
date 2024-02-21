from flask import render_template
from . import attractions
from app.models import Attraction
from app import db


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
