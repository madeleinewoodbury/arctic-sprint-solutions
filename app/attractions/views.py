from flask import render_template, abort, request, jsonify, session, redirect, url_for
from flask_login import login_required, current_user
from .forms import SearchForm, FilterAttractionsForm, SelectCityForm
from . import attractions
from app import db
from sqlalchemy import and_, distinct, func, or_, select
import json
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



@attractions.route("/select_city", methods=["POST"])
def select_city():
    form = SelectCityForm(request.form)
    if form.validate_on_submit():
        selected_city = form.city.data
        session["selected_city"] = selected_city
        return jsonify({"success": True}), 200
    else:
        errors = form.errors
        return jsonify({"success": False, "errors": errors}), 400


# Get attractions based on search text.
@attractions.route("/attractions/search", methods=["GET", "POST"])
def search_attractions():
    if "selected_city" in session:
        selected_city = session["selected_city"]
    else:
        session["selected_city"] = 1
        selected_city = session["selected_city"]
    city = City.query.get(selected_city)
    
    # Parse URL parameters for filtering
    search_text = request.args.get('q', '')
    filter_priority = request.args.get('filterPriority')
    filter_priority_list = filter_priority.split(',') if filter_priority else []
    categories = request.args.get('categories', '')
    category = [int(x) for x in categories.split(',') if x.isdigit()] if categories else []
    age_groups = request.args.get('age_groups', '')
    age_group = [int(x) for x in age_groups.split(',') if x.isdigit()] if age_groups else []
    tags = request.args.get('tags', '')
    tag = [int(x) for x in tags.split(',') if x.isdigit()] if tags else []
    page = request.args.get("page", default=1, type=int)
    per_page = 6
        
    # Setup forms
    search_form = SearchForm()
    search_form.search_text.data = search_text
    filter_form = FilterAttractionsForm()
    filter_form.categories.data = category
    filter_form.age_groups.data = age_group
    filter_form.tags.data = tag
    
    # Setup query filters
    filters = [Attraction.city == city.id]
    filters.append(Attraction.name.contains(search_text)) 
    base_attraction_ids = [(attraction.id) for attraction in Attraction.query.filter(and_(*filters)).all()] 
    if category:
        filters.append(Attraction.category.any(AttractionCategory.category_id.in_(category)))
    if age_group:
        filters.append(Attraction.age_groups.any(AttractionAgeGroup.age_group_id.in_(age_group)))
    if tag:
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(tag)))
    
    # Paginate the queried attractions
    attractions_pagination = Attraction.query.filter(and_(*filters)).paginate(page=page, per_page=per_page)

    # Prepare data for rendering HTML template
    attractions = attractions_pagination.items
    total_pages = attractions_pagination.pages
    current_page = attractions_pagination.page

    ca, ag, ta = get_filter_ids(filter_priority_list, category, age_group, tag)
    update_filter_form_choices(filter_form, base_attraction_ids, ca, ag, ta)
    
    # Render HTML template with attractions and pagination information
    return render_template(
        "attractions_main.html",
        attractions=attractions,
        search_form=search_form,
        filter_form=filter_form,
        total_pages=total_pages,
        current_page=current_page,
        city=city
    )

# Get all attractions.
@attractions.route("/attractions", methods=["GET", "POST"])
def get_attractions():
    if "selected_city" in session:
        selected_city = session["selected_city"]
    else:
        session["selected_city"] = 1
        selected_city = session["selected_city"]
    city = City.query.get(selected_city)
    
    # Parse URL parameters for filtering
    filter_priority = request.args.get('filterPriority')
    filter_priority_list = filter_priority.split(',') if filter_priority else []
    categories = request.args.get('categories', '')
    category = [int(x) for x in categories.split(',') if x.isdigit()] if categories else []
    age_groups = request.args.get('age_groups', '')
    age_group = [int(x) for x in age_groups.split(',') if x.isdigit()] if age_groups else []
    tags = request.args.get('tags', '')
    tag = [int(x) for x in tags.split(',') if x.isdigit()] if tags else []
    page = request.args.get("page", default=1, type=int)
    per_page = 6
    MAX_NUM_OF_SUGGESTIONS = 3
    
    # Setup forms
    search_form = SearchForm()
    filter_form = FilterAttractionsForm()
    filter_form.categories.data = category
    filter_form.age_groups.data = age_group
    filter_form.tags.data = tag
    
    # Setup query filters
    filters = [Attraction.city == city.id]
    if category:
        filters.append(Attraction.category.any(AttractionCategory.category_id.in_(category)))
    if age_group:
        filters.append(Attraction.age_groups.any(AttractionAgeGroup.age_group_id.in_(age_group)))
    if tag:
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(tag)))
    
    base_attraction_ids = [(attraction.id) for attraction in Attraction.query.filter(Attraction.city == city.id).all()] 
    attraction_ids = [(attraction.id) for attraction in Attraction.query.filter(and_(*filters)).all()]

    # Prioritise fitting suggestions if logged in
    suggested_ids = set()
    if current_user.is_authenticated:
        suggested_attractions = suggest_attractions_for_user(current_user.id)
        visited_attractions = {
            va.attraction_id for va in VisitedAttraction.query.filter_by(user_id=current_user.id).all()
        }
        suggested_attractions = [
            attr for attr in suggested_attractions if attr["attraction_id"] not in visited_attractions
        ]
        suggested_attractions = sorted(
            suggested_attractions, key=lambda x: x["score"], reverse=True
            )[:MAX_NUM_OF_SUGGESTIONS]
        suggested_ids = [attr["attraction_id"] for attr in suggested_attractions]
        attraction_ids = sorted(
            attraction_ids,
            key=lambda x: (
                x not in suggested_ids,
                suggested_ids.index(x) if x in suggested_ids else float("inf")
            )
        )

    # Paginate the queried attractions
    attractions_pagination = (Attraction.query.filter(Attraction.id.in_(attraction_ids))
                           .order_by(func.field(Attraction.id, *attraction_ids))
                           .paginate(page=page, per_page=per_page)
                           )
    
    # Prepare data for rendering HTML template
    attractions = attractions_pagination.items
    total_pages = attractions_pagination.pages
    current_page = attractions_pagination.page
    
    ca, ag, ta = get_filter_ids(filter_priority_list, category, age_group, tag)
    update_filter_form_choices(filter_form, base_attraction_ids, ca, ag, ta)
    
    # Render HTML template with attractions and pagination information
    return render_template(
        "attractions_main.html",
        attractions=attractions,
        suggested_ids=suggested_ids,
        search_form=search_form,
        filter_form=filter_form,
        total_pages=total_pages,
        current_page=current_page,
        city=city
    )


# Get single attraction.
@attractions.route("/attractions/<int:attraction_id>", methods=["GET"])
def get_attraction(attraction_id):
    attraction = Attraction.query.get(attraction_id)

    if not attraction:
        abort(404)  # Raise a 404 error if not found.

    visited = False
    groups = []

    if current_user.is_authenticated:
        # Check for users previous visits
        visited_record = VisitedAttraction.query.filter_by(
            user_id=current_user.id, attraction_id=attraction_id
        ).first()
        visited = visited_record is not None

        user_groups = AttractionGroup.query.filter_by(owner=current_user.id).all()

        for group in user_groups:
            list_info = {
                "id": group.id,
                "title": group.title,
                "visibility": group.visibility,
                "visited": attraction in group.grouped_attractions
            }
            groups.append(list_info)

        groups = json.dumps(groups)

    return render_template(
        "attraction.html", attraction=attraction, visited=visited, groups=groups
    )

# Function for marking an attraction as visited
@attractions.route("/attractions/<int:attraction_id>/mark_as_visited", methods=["POST"])
@login_required
def mark_as_visited(attraction_id):
    data = request.get_json()
    visited = data.get("visited", False)
    existing_record = VisitedAttraction.query.filter_by(
        user_id=current_user.id, attraction_id=attraction_id
        ).first()
    
    # Mark attraction as visited
    if visited and not existing_record:
        visited_attraction = VisitedAttraction(
            user_id=current_user.id, attraction_id=attraction_id)
        db.session.add(visited_attraction)
        db.session.commit()
        level = current_user.level
        return jsonify({"status": "success", 
                        "message": "Attraction mark removed.",
                        "current_level": level['current_level'],
                        "points_required": level['points_required'],
                        "points_missing": level['points_missing'],
                        "progress": level['progress']
                        })
    
    # Unmark attraction as visited
    elif not visited and existing_record:
        db.session.delete(existing_record)
        db.session.commit()
        level = current_user.level
        return jsonify({"status": "success", 
                        "message": "Attraction mark removed.",
                        "current_level": level['current_level'],
                        "points_required": level['points_required'],
                        "points_missing": level['points_missing'],
                        "progress": level['progress']
                        })

    return jsonify({"status": "error", "message": "An error occurred."})


@attractions.route("/attractions/add_to_group", methods=["POST"])
@login_required
def add_to_group():
    data = request.get_json()
    attraction_id = data['attractionId']
    group_id = data.get('groupId')

    if attraction_id and group_id:
        group = AttractionGroup.query.get(group_id)
        attraction = Attraction.query.get(attraction_id)

        if group and attraction:
            group.grouped_attractions.append(attraction)
            db.session.commit()
            return jsonify(
                {"status": "success", "message": "Attraction added to group."}
            )
    
    if attraction_id:
        attraction = Attraction.query.get(attraction_id)
        if attraction:
            new_group = AttractionGroup(
                owner=current_user.id, title="Wishlist", visibility="private"
            )
            new_group.grouped_attractions.append(attraction)
            db.session.add(new_group)
            db.session.commit()
            return jsonify(
                {"status": "success", "message": "Attraction added to new group."}
            )

    return jsonify({"status": "error", "message": "An error occurred."})


@attractions.route("/attractions/remove_from_group", methods=["POST"])
@login_required
def remove_from_group():
    data = request.get_json()
    attraction_id = data['attractionId']
    group_id = data['groupId']

    if attraction_id and group_id:
        group = AttractionGroup.query.get(group_id)
        attraction = Attraction.query.get(attraction_id)

        if group and attraction:
            group.grouped_attractions.remove(attraction)
            db.session.commit()
            return jsonify(
                {"status": "success", "message": "Attraction removed from group."}
            )

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
    if "selected_city" in session:
        selected_city = session["selected_city"]
    else:
        session["selected_city"] = 1
        selected_city = session["selected_city"]

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
        attractions_list = Attraction.query.filter(and_(*filters)).all()
    else:
        attractions_list = Attraction.query.all()

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
    
    # Prepare AJAX response data.
    attractions_html = [
        render_template("attractions_items.html", attraction=attraction.to_dict(), suggested_ids=suggested_ids)
        for attraction in attractions_list
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




def suggest_attractions_for_user(user_id):
    user_tag_ids = select(UserTagPreference.tag_id).filter_by(user_id=user_id)
    user_age_group_ids = select(UserAgeGroupPreference.age_group_id).filter_by(
        user_id=user_id
    )
    user_category_ids = select(UserCategoryPreference.category_id).filter_by(
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

    return attractions_with_scores


@attractions.route("/attractions/suggested", methods=["GET", "POST"])
@login_required
def suggested_attractions():
    if "selected_city" in session:
        selected_city = session["selected_city"]
    else:
        session["selected_city"] = 1
        selected_city = session["selected_city"]
    city = City.query.get(selected_city)
    
    filter_priority = request.args.get('filterPriority')
    filter_priority_list = filter_priority.split(',') if filter_priority else []
    categories = request.args.get('categories', '')
    category = [int(x) for x in categories.split(',') if x.isdigit()] if categories else []
    age_groups = request.args.get('age_groups', '')
    age_group = [int(x) for x in age_groups.split(',') if x.isdigit()] if age_groups else []
    tags = request.args.get('tags', '')
    tag = [int(x) for x in tags.split(',') if x.isdigit()] if tags else []
    page = request.args.get("page", default=1, type=int)
    per_page = 6 
    MAX_NUM_OF_SUGGESTIONS = 12
    
    # Find suggested attractions
    suggested_attractions = []
    suggested_attractions = suggest_attractions_for_user(current_user.id)
    visited_attractions = {
        va.attraction_id
        for va in VisitedAttraction.query.filter_by(user_id=current_user.id).all()
        }

    suggested_attractions = [
        attr for attr in suggested_attractions if attr["attraction_id"] not in visited_attractions
        ]

    suggested_attractions = sorted(
        suggested_attractions, key=lambda x: x["score"], reverse=True
        )[:MAX_NUM_OF_SUGGESTIONS]

    suggested_ids = [attr["attraction_id"] for attr in suggested_attractions]
    
    # Setup forms
    search_form = SearchForm()
    filter_form = FilterAttractionsForm()
    filter_form.categories.data = category
    filter_form.age_groups.data = age_group
    filter_form.tags.data = tag
    
    # Setup query filters
    filters = [Attraction.city == city.id]
    filters.append(Attraction.id.in_(suggested_ids))
    if category:
        filters.append(Attraction.category.any(AttractionCategory.category_id.in_(category)))
    if age_group:
        filters.append(Attraction.age_groups.any(AttractionAgeGroup.age_group_id.in_(age_group)))
    if tag:
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(tag)))
        
    # Paginate the queried attractions
    attractions_pagination = Attraction.query.filter(and_(*filters)).paginate(page=page, per_page=per_page)

    # Prepare data for rendering HTML template
    attractions = attractions_pagination.items
    total_pages = attractions_pagination.pages
    current_page = attractions_pagination.page
    
    ca, ag, ta = get_filter_ids(filter_priority_list, category, age_group, tag)
    update_filter_form_choices(filter_form, suggested_ids, ca, ag, ta)
    
    return render_template(
        "attractions_main.html",
        attractions=attractions,
        suggested_ids=suggested_ids,
        search_form=search_form,
        filter_form=filter_form,
        current_page=current_page,
        total_pages=total_pages,
        city=city,
    )


def update_filter_form_choices(filter_form, attraction_ids, category_ids=[], age_group_ids=[], tag_ids=[]):
    categories = (
        db.session.query(Category.id, Category.name)
        .join(AttractionCategory)
        .filter(and_(AttractionCategory.attraction_id.in_(attraction_ids),
                    AttractionCategory.category_id.in_(category_ids)))
        .distinct()
        .order_by(Category.name)
        .all()
    )
        
    age_groups = (
        db.session.query(AgeGroup.id, AgeGroup.name)
        .join(AttractionAgeGroup)
        .filter(and_(AttractionAgeGroup.attraction_id.in_(attraction_ids),
                    AttractionAgeGroup.age_group_id.in_(age_group_ids)))
        .distinct()
        .order_by(AgeGroup.name)
        .all()
    )

    tags = (
        db.session.query(Tag.id, Tag.name)
        .join(AttractionTag)
        .filter(and_(AttractionTag.attraction_id.in_(attraction_ids),
                    AttractionTag.tag_id.in_(tag_ids)))
        .distinct()
        .order_by(Tag.name)
        .all()
    )
    
    if not category_ids and not age_group_ids and not tag_ids:
        categories = (
            db.session.query(Category.id, Category.name)
            .join(AttractionCategory)
            .filter(AttractionCategory.attraction_id.in_(attraction_ids))
            .distinct()
            .order_by(Category.name)
            .all()
        )
        age_groups = (
            db.session.query(AgeGroup.id, AgeGroup.name)
            .join(AttractionAgeGroup)
            .filter(AttractionAgeGroup.attraction_id.in_(attraction_ids))
            .distinct()
            .order_by(AgeGroup.name)
            .all()
        )
        tags = (
            db.session.query(Tag.id, Tag.name)
            .join(AttractionTag)
            .filter(AttractionTag.attraction_id.in_(attraction_ids))
            .distinct()
            .order_by(Tag.name)
            .all()
        )

    filter_form.categories.choices = [(cat.id, cat.name) for cat in categories]
    filter_form.age_groups.choices = [(age.id, age.name) for age in age_groups]
    filter_form.tags.choices = [(tag.id, tag.name) for tag in tags]


def get_filter_ids(filter_priority, selected_categories, selected_age_groups, selected_tags):
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
        category_ids = []
        age_group_ids = []
        tag_ids = []
    
    category_ids = [int(category_id) for (category_id,) in category_ids]
    age_group_ids = [int(age_group_id) for (age_group_id,) in age_group_ids]
    tag_ids = [int(tag_id) for (tag_id,) in tag_ids]
    
    return category_ids, age_group_ids, tag_ids

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








def update_filter_form_choices_OLD(attraction_ids, filter_form):
    if attraction_ids:
        categories = (
            db.session.query(Category.id, Category.name)
            .join(AttractionCategory)
            .filter(AttractionCategory.attraction_id.in_(attraction_ids))
            .distinct()
            .order_by(Category.name)
            .all()
        )

        age_groups = (
            db.session.query(AgeGroup.id, AgeGroup.name)
            .join(AttractionAgeGroup)
            .filter(AttractionAgeGroup.attraction_id.in_(attraction_ids))
            .distinct()
            .order_by(AgeGroup.name)
            .all()
        )

        tags = (
            db.session.query(Tag.id, Tag.name)
            .join(AttractionTag)
            .filter(AttractionTag.attraction_id.in_(attraction_ids))
            .distinct()
            .order_by(Tag.name)
            .all()
        )
    else:
        categories, age_groups, tags = [], [], []

    filter_form.categories.choices = [(c.id, c.name) for c in categories]
    filter_form.age_groups.choices = [(ag.id, ag.name) for ag in age_groups]
    filter_form.tags.choices = [(t.id, t.name) for t in tags]
