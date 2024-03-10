from flask import render_template, abort, request, jsonify
from .forms import SearchForm, FilterAttractionsForm
from . import attractions
from app.models import Attraction, AttractionCategory
from app import db


# Get all attractions
@attractions.route('/attractions', methods=['GET', 'POST'])
def get_attractions():
    searchform = SearchForm()
    search_text = searchform.data.get('search_text')
    #TODO: Add category, tags, age groups select

    if search_text:
        attractions = Attraction.query.filter(Attraction.name.contains(search_text)).all()
        return render_template('attractions.html', attractions=attractions, form=searchform)
    
    filterForm = FilterAttractionsForm()
    selected_categories = form.categories.data    
    if filterForm.validate_on_submit() and selected_categories:
        attractions = Attraction.query.filter(
            Attraction.category.any(AttractionCategory.category_id.in_(selected_categories))).all()
    else:
        attractions = Attraction.query.all()
    
    # Generate a dictionary to count the total number of attractions in each category
    category_counts = {}
    for attraction in attractions:
        for category in attraction.category:
            category_counts[category.id] = category_counts.get(category.id, 0) + 1
    
    # Update the category form labels with the category counts.
    updated_choices = []
    for choice in filterForm.categories.choices:
        if choice[0] in category_counts:
            updated_label = f'{choice[1]} ({category_counts[choice[0]]})'
            updated_choices.append((choice[0], updated_label))
        else:
            updated_label = f'{choice[1]} (0)'
            updated_choices.append((choice[0], updated_label))
    filterForm.categories.choices = updated_choices
    
    return render_template('attractions_main.html', form=filterForm, attractions=attractions)


# Get single attraction
@attractions.route('/attractions/<int:attraction_id>', methods=['GET'])
def get_attraction(attraction_id):
    attraction = Attraction.query.get(attraction_id)

    if not attraction:
        abort(404)  # Raise a 404 error if not found

    return render_template('attraction.html', attraction=attraction)




# Filter and refresh attractions content by category with AJAX
@attractions.route('/attractions/filter', methods=['POST'])
def filter_attractions():
    # Get selected category IDs from the AJAX request
    selected_categories = [int(x) for x in request.json.get('categories', [])]

    # Filter attractions based on selected categories
    if selected_categories:
        attractions = Attraction.query.filter(
            Attraction.category.any(AttractionCategory.category_id.in_(selected_categories))).all()
    else:
        attractions = Attraction.query.all()
    
    # Prepare html data
    attractions_html = []
    for attraction in attractions:
        attractions_html.append(render_template('attractions_items.html', attraction=attraction.to_dict()))
        
    return jsonify({'attractions' : attractions_html})
