from flask import render_template, abort, request, jsonify
from flask_login import login_required, current_user
from . import attractions
from app.models import Attraction, VisitedAttraction
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


# Get single attraction
@attractions.route('/attractions/<int:attraction_id>', methods=['GET'])
def get_attraction(attraction_id):
    attraction = Attraction.query.get(attraction_id)

    if not attraction:
        abort(404)  # Raise a 404 error if not found

    visited = False

    if current_user.is_authenticated:
        # Check for users previous visits
        visited_record = VisitedAttraction.query.filter_by(user_id=current_user.id, attraction_id=attraction_id).first()
        visited = visited_record is not None

    return render_template('attraction.html', attraction=attraction, visited=visited)


# Function for marking an attraction as visited
@attractions.route('/attractions/<int:attraction_id>/mark_as_visited', methods=['POST'])
@login_required
def mark_as_visited(attraction_id):
    data = request.get_json()
    visited = data.get('visited', False)

    if visited:
        # Mark attraction as visited
        existing_record = VisitedAttraction.query.filter_by(user_id=current_user.id, attraction_id=attraction_id).first()
        if not existing_record:
            visited_attraction = VisitedAttraction(user_id=current_user.id, attraction_id=attraction_id)
            db.session.add(visited_attraction)
            db.session.commit()
            return jsonify({'status': 'success', 'message': 'Attraction marked as visited.'})
        
    else:
        # Legg til logikk for å fjerne merkingen
        existing_record = VisitedAttraction.query.filter_by(user_id=current_user.id, attraction_id=attraction_id).first()
        if existing_record:
            db.session.delete(existing_record)
            db.session.commit()
            return jsonify({'status': 'success', 'message': 'Attraction mark removed.'})

    return jsonify({'status': 'error', 'message': 'An error occurred.'})

