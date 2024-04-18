from flask import render_template, abort, request, jsonify, session
from flask_login import login_required, current_user
from .forms import SearchForm, FilterAttractionsForm, SelectCityForm
from . import attractions
from app.models import (
    Attraction,
    AttractionAgeGroup,
    AttractionCategory,
    AttractionTag,
    Category,
    AgeGroup,
    Tag,
    User,
    UserAgeGroupPreference,
    UserCategoryPreference,
    UserTagPreference,
    VisitedAttraction,
    City,
    AttractionGroup,
)
from app import db
from sqlalchemy import and_, distinct, func, or_

@attractions.route('/select_city', methods=['POST'])
def select_city():
    form = SelectCityForm(request.form)
    if form.validate_on_submit():
        selected_city = form.city.data
        session['selected_city'] = selected_city
        return jsonify({'success': True}), 200
    else:
        errors = form.errors
        return jsonify({'success': False, 'errors': errors}), 400

# Get all attractions.
@attractions.route("/attractions", methods=["GET", "POST"])
def get_attractions():
    if 'selected_city' in session:
        selected_city = session['selected_city']
    else:
        session['selected_city'] = 1
        selected_city = session['selected_city']

    city = City.query.get(selected_city)
    attractions_list = city.attractions
    search_form = SearchForm()
    filter_form = FilterAttractionsForm()

    search_text = search_form.data.get('search_text')
    if search_text:
        # Filter attractions based on search text
        attractions_list = (
            Attraction.query
            .filter(Attraction.name.contains(search_text))
            .filter(Attraction.id.in_([attraction.id for attraction in city.attractions]))
            .all()
        )

    attraction_ids = [attraction.id for attraction in attractions_list]

    suggested_attractions = []
    suggested_ids = set()
    if current_user.is_authenticated:
        suggested_attractions = suggest_attractions_for_user(current_user.id)
        suggested_ids = [attr["attraction_id"] for attr in suggested_attractions]
        attractions_list = sorted(
            attractions_list,
            key=lambda x: (
                x.id not in suggested_ids,
                suggested_ids.index(x.id) if x.id in suggested_ids else float("inf"),
            ),
        )

    # Get IDs and Names of categories relevant to current attractions.
    categories_choices_query = (
        db.session.query(Category.id, Category.name)
        .join(AttractionCategory, AttractionCategory.category_id == Category.id)
        .filter(AttractionCategory.attraction_id.in_(attraction_ids))
        .distinct(Category.id)
        .order_by(Category.name)
        .all()
    )

    # Get IDs and Names of age groups relevant to current attractions.
    age_groups_choices_query = (
        db.session.query(AgeGroup.id, AgeGroup.name)
        .join(AttractionAgeGroup, AttractionAgeGroup.age_group_id == AgeGroup.id)
        .filter(AttractionAgeGroup.attraction_id.in_(attraction_ids))
        .distinct(AgeGroup.id)
        .order_by(AgeGroup.id)
        .all()
    )

    # Get IDs and Names of tags relevant to current attractions.
    tags_choices_query = (
        db.session.query(Tag.id, Tag.name)
        .join(AttractionTag, AttractionTag.tag_id == Tag.id)
        .filter(AttractionTag.attraction_id.in_(attraction_ids))
        .distinct(Tag.id)
        .order_by(Tag.name)
        .all()
    )

    # Populate filter form with queried choices
    filter_form.categories.choices = [
        (category.id, category.name) for category in categories_choices_query
    ]
    filter_form.age_groups.choices = [
        (age_group.id, age_group.name) for age_group in age_groups_choices_query
    ]
    filter_form.tags.choices = [(tag.id, tag.name) for tag in tags_choices_query]

    return render_template(
        "attractions_main.html",
        attractions=attractions_list,
        search_form=search_form,
        filter_form=filter_form,
        suggested_ids=list(suggested_ids),
        city=city
    )


# Get single attraction.
@attractions.route("/attractions/<int:attraction_id>", methods=["GET"])
def get_attraction(attraction_id):
    attraction = Attraction.query.get(attraction_id)

    if not attraction:
        abort(404)  # Raise a 404 error if not found.

    visited = False
    wishlist = False

    if current_user.is_authenticated:
        # Check for users previous visits
        visited_record = VisitedAttraction.query.filter_by(
            user_id=current_user.id, attraction_id=attraction_id
        ).first()
        visited = visited_record is not None

        for group in attraction.groups:
            if group.owner == current_user.id:
                wishlist = True

    return render_template(
        "attraction.html", attraction=attraction, visited=visited, wishlist=wishlist
    )


# Function for marking an attraction as visited
@attractions.route("/attractions/<int:attraction_id>/mark_as_visited", methods=["POST"])
@login_required
def mark_as_visited(attraction_id):
    data = request.get_json()
    visited = data.get("visited", False)

    if visited:
        # Mark attraction as visited
        existing_record = VisitedAttraction.query.filter_by(
            user_id=current_user.id, attraction_id=attraction_id
        ).first()
        if not existing_record:
            visited_attraction = VisitedAttraction(
                user_id=current_user.id, attraction_id=attraction_id
            )
            db.session.add(visited_attraction)
            db.session.commit()
            return jsonify(
                {"status": "success", "message": "Attraction marked as visited."}
            )

    else:
        existing_record = VisitedAttraction.query.filter_by(
            user_id=current_user.id, attraction_id=attraction_id
        ).first()
        if existing_record:
            db.session.delete(existing_record)
            db.session.commit()
            return jsonify({"status": "success", "message": "Attraction mark removed."})

    return jsonify({"status": "error", "message": "An error occurred."})


# Function for marking an attraction as wishlist
@attractions.route("/attractions/<int:attraction_id>/add_to_wishlist", methods=["POST"])
@login_required
def mark_as_wishlist(attraction_id):
    data = request.get_json()
    wishlist = data.get("wishlist", False)

    if wishlist:
        # Mark attraction as wishlist
        existing_record = AttractionGroup.query.filter_by(owner=current_user.id).first()
        if existing_record:
            # Add to wishlist
            existing_record.grouped_attractions.append(
                Attraction.query.get(attraction_id)
            )
            db.session.commit()
            return jsonify(
                {"status": "success", "message": "Attraction marked as wishlist."}
            )
        if not existing_record:
            # Create new wishlist
            new_group = AttractionGroup(
                owner=current_user.id, title="Wishlist", visibility="private"
            )
            # Add to new wishlist
            new_group.grouped_attractions.append(Attraction.query.get(attraction_id))
            db.session.add(new_group)
            db.session.commit()
            return jsonify(
                {"status": "success", "message": "Attraction marked as wishlist."}
            )

    else:
        existing_record = AttractionGroup.query.filter_by(owner=current_user.id).first()
        if existing_record:
            # Remove from wishlist
            existing_record.grouped_attractions.remove(
                Attraction.query.get(attraction_id)
            )
            db.session.commit()
            return jsonify({"status": "success", "message": "Attraction wish removed."})

    return jsonify({"status": "error", "message": "An error occurred."})


# Filter and refresh attractions content with AJAX.
@attractions.route("/attractions/filter", methods=["POST"])
def filter_attractions():
    if 'selected_city' in session:
        selected_city = session['selected_city']
    else:
        session['selected_city'] = 1
        selected_city = session['selected_city']

    city = City.query.get(selected_city)

    # Get the selected filtering options from the AJAX request.
    selected_categories = request.json.get("selectedCategories", [])
    selected_age_groups = request.json.get("selectedAgeGroups", [])
    selected_tags = request.json.get("selectedTags", [])
    search_text = request.json.get("searchText", "")
    filter_priority = request.json.get("filterPriority", [])

    # Construct dynamic filter based on selected options
    filters = [Attraction.city == city.id]
    if selected_categories:
        filters.append(
            Attraction.category.any(
                AttractionCategory.category_id.in_(selected_categories)
            )
        )
    if selected_age_groups:
        filters.append(
            Attraction.age_groups.any(
                AttractionAgeGroup.age_group_id.in_(selected_age_groups)
            )
        )
    if selected_tags:
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(selected_tags)))
    if search_text:
        filters.append(Attraction.name.contains(search_text))

    # Apply filters or get all attractions if no filters are selected
    if filters:
        attractions = Attraction.query.filter(and_(*filters)).all()
    else:
        attractions = Attraction.query.all()

    # Get IDs of categories, age groups and tags that are still relevant to the current attractions.
    if filter_priority and filter_priority[0] == "categories":
        category_ids, primary_attraction_ids = get_primary_filter_ids(
            "categories", selected_categories
        )
        age_group_ids = get_secondary_filter_ids("age_groups", primary_attraction_ids)
        tag_ids = get_secondary_filter_ids("tags", primary_attraction_ids)
        if len(filter_priority) > 1:
            if filter_priority[1] == "age_groups":
                tag_ids = get_tertiary_filter_ids(
                    "tags", selected_categories, selected_age_groups, selected_tags
                )
            elif filter_priority[1] == "tags":
                age_group_ids = get_tertiary_filter_ids(
                    "age_groups",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                )

    elif filter_priority and filter_priority[0] == "age_groups":
        age_group_ids, primary_attraction_ids = get_primary_filter_ids(
            "age_groups", selected_age_groups
        )
        category_ids = get_secondary_filter_ids("categories", primary_attraction_ids)
        tag_ids = get_secondary_filter_ids("tags", primary_attraction_ids)
        if len(filter_priority) > 1:
            if filter_priority[1] == "categories":
                tag_ids = get_tertiary_filter_ids(
                    "tags", selected_categories, selected_age_groups, selected_tags
                )
            elif filter_priority[1] == "tags":
                category_ids = get_tertiary_filter_ids(
                    "categories",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                )

    elif filter_priority and filter_priority[0] == "tags":
        tag_ids, primary_attraction_ids = get_primary_filter_ids("tags", selected_tags)
        category_ids = get_secondary_filter_ids("categories", primary_attraction_ids)
        age_group_ids = get_secondary_filter_ids("age_groups", primary_attraction_ids)
        if len(filter_priority) > 1:
            if filter_priority[1] == "categories":
                age_group_ids = get_tertiary_filter_ids(
                    "age_groups",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                )
            elif filter_priority[1] == "age_groups":
                category_ids = get_tertiary_filter_ids(
                    "categories",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                )

    else:
        category_ids = (
            db.session.query(AttractionCategory.category_id)
            .distinct(AttractionCategory.category_id)
            .all()
        )
        age_group_ids = (
            db.session.query(AttractionAgeGroup.age_group_id)
            .distinct(AttractionAgeGroup.age_group_id)
            .all()
        )
        tag_ids = (
            db.session.query(AttractionTag.tag_id).distinct(AttractionTag.tag_id).all()
        )

    # Prepare AJAX response data.
    attractions_html = [
        render_template("attractions_items.html", attraction=attraction.to_dict())
        for attraction in attractions
    ]
    category_json = [str(category_id) for (category_id,) in category_ids]
    age_group_json = [str(age_group_id) for (age_group_id,) in age_group_ids]
    tag_json = [str(tag_id) for (tag_id,) in tag_ids]

    return jsonify(
        {
            "attractions": attractions_html,
            "categoryIDs": category_json,
            "ageGroupIDs": age_group_json,
            "tagIDs": tag_json,
        }
    )


def get_primary_filter_ids(filter_type, selected_filter_type_ids):
    if filter_type == "categories":
        relationship = AttractionCategory.category_id
        attribute = Attraction.category
    elif filter_type == "age_groups":
        relationship = AttractionAgeGroup.age_group_id
        attribute = Attraction.age_groups
    elif filter_type == "tags":
        relationship = AttractionTag.tag_id
        attribute = Attraction.tags

    primary_attraction_ids_query = (
        db.session.query(Attraction.id)
        .filter(attribute.any(relationship.in_(selected_filter_type_ids)))
        .all()
    )
    primary_attraction_ids = [
        attraction_id for (attraction_id,) in primary_attraction_ids_query
    ]

    primary_filter_ids = db.session.query(relationship).distinct(relationship).all()

    return primary_filter_ids, primary_attraction_ids


def get_secondary_filter_ids(filter_type, primary_attraction_ids):
    if filter_type == "categories":
        model = AttractionCategory
        relationship = AttractionCategory.category_id
    elif filter_type == "age_groups":
        model = AttractionAgeGroup
        relationship = AttractionAgeGroup.age_group_id
    elif filter_type == "tags":
        model = AttractionTag
        relationship = AttractionTag.tag_id

    secondary_filter_ids = (
        db.session.query(relationship)
        .filter((model.attraction_id.in_(primary_attraction_ids)))
        .distinct(relationship)
        .all()
    )

    return secondary_filter_ids


def get_tertiary_filter_ids(
    filter_type, selected_categories, selected_age_groups, selected_tags
):
    filters = []
    if filter_type == "categories":
        model = AttractionCategory
        relationship = AttractionCategory.category_id
        filters.append(
            Attraction.age_groups.any(
                AttractionAgeGroup.age_group_id.in_(selected_age_groups)
            )
        )
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(selected_tags)))

    elif filter_type == "age_groups":
        model = AttractionAgeGroup
        relationship = AttractionAgeGroup.age_group_id
        filters.append(
            Attraction.category.any(
                AttractionCategory.category_id.in_(selected_categories)
            )
        )
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(selected_tags)))

    elif filter_type == "tags":
        model = AttractionTag
        relationship = AttractionTag.tag_id
        filters.append(
            Attraction.category.any(
                AttractionCategory.category_id.in_(selected_categories)
            )
        )
        filters.append(
            Attraction.age_groups.any(
                AttractionAgeGroup.age_group_id.in_(selected_age_groups)
            )
        )

    secondary_attraction_ids_query = (
        db.session.query(Attraction.id).filter(and_(*filters)).all()
    )
    secondary_attraction_ids = [
        attraction_id for (attraction_id,) in secondary_attraction_ids_query
    ]

    tertiary_filter_ids = (
        db.session.query(relationship)
        .filter((model.attraction_id.in_(secondary_attraction_ids)))
        .distinct(relationship)
        .all()
    )

    return tertiary_filter_ids


from sqlalchemy import select


def suggest_attractions_for_user(user_id):
    user_tag_ids = select(UserTagPreference.tag_id).filter_by(user_id=user_id)
    user_age_group_ids = select(UserAgeGroupPreference.age_group_id).filter_by(
        user_id=user_id
    )
    user_category_ids = select(UserCategoryPreference.category_id).filter_by(
        user_id=user_id
    )

    visited_attraction_ids = select(VisitedAttraction.attraction_id).filter_by(
        user_id=user_id
    )

    attractions_query = (
        db.session.query(
            Attraction.id,
            Attraction.name,
            func.count(distinct(AttractionTag.tag_id)).label("matched_tag_count"),
            func.count(distinct(AttractionAgeGroup.age_group_id)).label(
                "matched_age_group_count"
            ),
            func.count(distinct(AttractionCategory.category_id)).label(
                "matched_category_count"
            ),
        )
        .select_from(Attraction)
        .outerjoin(
            AttractionTag,
            and_(
                AttractionTag.attraction_id == Attraction.id,
                AttractionTag.tag_id.in_(user_tag_ids),
            ),
        )
        .outerjoin(
            AttractionAgeGroup,
            and_(
                AttractionAgeGroup.attraction_id == Attraction.id,
                AttractionAgeGroup.age_group_id.in_(user_age_group_ids),
            ),
        )
        .outerjoin(
            AttractionCategory,
            and_(
                AttractionCategory.attraction_id == Attraction.id,
                AttractionCategory.category_id.in_(user_category_ids),
            ),
        )
        .filter(Attraction.id.notin_(visited_attraction_ids))
        .group_by(Attraction.id)
        .having(
            or_(
                func.count(distinct(AttractionTag.tag_id)) > 0,
                func.count(distinct(AttractionAgeGroup.age_group_id)) > 0,
                func.count(distinct(AttractionCategory.category_id)) > 0,
            )
        )
    )

    attractions_with_scores = [
        {
            "attraction_id": attr.id,
            "attraction_name": attr.name,
            "score": attr.matched_tag_count
            + attr.matched_age_group_count
            + attr.matched_category_count,
        }
        for attr in attractions_query.all()
    ]

    sorted_attractions = sorted(
        attractions_with_scores, key=lambda x: x["score"], reverse=True
    )[:10]
    return sorted_attractions
