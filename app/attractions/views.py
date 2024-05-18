from datetime import datetime
from flask import render_template, abort, request, jsonify, session, redirect, url_for
from flask_login import login_required, current_user
from flask_paginate import Pagination, get_page_args
from .forms import SearchForm, FilterAttractionsForm, SelectCityForm, CommentForm
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
    Comment,
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
    """
    Handle the POST request for selecting a city.

    This function receives a POST request with data from the SelectCityForm.
    If the form data is valid, the selected city is stored in the session.
    If the form data is invalid, a JSON response with the validation errors is returned.

    Returns:
        A JSON response with a success status and, if applicable, validation errors.

    """
    form = SelectCityForm(request.form)
    if form.validate_on_submit():
        selected_city = form.city.data
        session["selected_city"] = selected_city
        return jsonify({"success": True}), 200
    else:
        errors = form.errors
        return jsonify({"success": False, "errors": errors}), 400


@attractions.route("/attractions/<int:attraction_id>", methods=["GET", "POST"])
def get_attraction(attraction_id):
    """
    Retrieve an attraction by its ID and render the attraction page.

    Args:
        attraction_id (int): The ID of the attraction to retrieve.

    Returns:
        flask.Response: The rendered attraction page.

    Raises:
        werkzeug.exceptions.NotFound: If the attraction with the given ID is not found.
    """
    attraction = Attraction.query.get(attraction_id)

    if not attraction:
        abort(404)  # Raise a 404 error if not found.

    visited = False
    groups = []

    # Finner kommentarer
    search = False
    q = request.args.get("q")
    if q:
        search = True

    page, per_page, offset = get_page_args(
        page_parameter="page", per_page_parameter="per_page"
    )
    comments = Comment.query.filter_by(attraction_id=attraction_id).order_by(
        Comment.created_at.desc()
    )

    pagination = Pagination(
        page=page,
        total=comments.count(),
        search=search,
        record_name="comments",
        css_framework="semantic",
    )

    comment_list = comments.offset(offset).limit(per_page).all()

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
                "visited": attraction in group.grouped_attractions,
            }
            groups.append(list_info)

        groups = json.dumps(groups)

    comment_form = CommentForm()

    if comment_form.validate_on_submit():
        comment = Comment(
            comment_text=comment_form.comment.data,
            user_id=current_user.id,
            attraction_id=attraction_id,
        )
        db.session.add(comment)
        db.session.commit()
        return redirect(
            url_for("attractions.get_attraction", attraction_id=attraction_id)
        )

    return render_template(
        "attraction.html",
        attraction=attraction,
        visited=visited,
        groups=groups,
        comments=comment_list,
        pagination=pagination,
        comment_form=comment_form,
    )


@attractions.route("/attractions/comment/<comment_id>", methods=["GET"])
def get_comment(comment_id):
    """
    Retrieve a comment by its ID.

    Args:
        comment_id (int): The ID of the comment to retrieve.

    Returns:
        dict: A JSON object containing the comment's text, edited_at timestamp, and editor's username (if available).
    """
    comment_data = Comment.query.filter_by(id=comment_id).first()
    if comment_data:
        return jsonify(
            {
                "text": comment_data.comment_text,
                "edited_at": comment_data.edited_at if comment_data.edited_at else None,
                "editor_id": (
                    comment_data.editor.username if comment_data.editor else None
                ),
            }
        )


@attractions.route("/attractions/comment/<comment_id>", methods=["POST"])
def post_comment(comment_id):
    """
    Update the comment with the given comment_id.

    Args:
        comment_id (int): The ID of the comment to be updated.

    Returns:
        dict: A JSON response indicating the success of the update.

    Raises:
        None

    """
    try:
        data = request.get_json()
        edit_text = data.get("edit_text")

        comment = Comment.query.filter_by(id=comment_id).first()

        if (
            (current_user == comment.user)
            or (current_user.role_rel.title == "Moderator")
            or current_user.role_rel.title == "Administrator"
        ):
            comment.editor_id = current_user.id
            comment.edited_at = datetime.utcnow()
            comment.comment_text = edit_text

            db.session.add(comment)
            db.session.commit()

            return jsonify({"success": True})
        else:
            return jsonify({"success": False})
    except:
        return jsonify({"success": False})


@attractions.route("/attractions/comment/delete", methods=["POST"])
def post_delete_comment():
    """
    Deletes a comment from the database.

    Returns:
        A JSON response indicating the success of the operation.
    """
    try:
        data = request.get_json()
        comment_id = data.get("comment_id")

        comment = Comment.query.filter_by(id=comment_id).first()

        if (
            (current_user == comment.user)
            or (current_user.role_rel.title == "Moderator")
            or (current_user.role_rel.title == "Administrator")
        ):
            db.session.delete(comment)
            db.session.commit()

            return jsonify({"success": True})
        else:
            return jsonify({"success": False})
    except:
        return jsonify({"success": False})


@attractions.route("/attractions", methods=["GET", "POST"])
def get_attractions():
    """
    Retrieve attractions based on the selected city and filter parameters.

    Returns:
        A rendered HTML template with attractions, pagination information, and forms.
    """
    if "selected_city" in session:
        selected_city = session["selected_city"]
    else:
        session["selected_city"] = 1
        selected_city = session["selected_city"]
    city = City.query.get(selected_city)

    # Parse URL parameters for filtering
    search_text = request.args.get("search", "")
    filter_priority = request.args.get("filterPriority")
    filter_priority_list = filter_priority.split(",") if filter_priority else []
    categories = request.args.get("categories", "")
    category = (
        [int(x) for x in categories.split(",") if x.isdigit()] if categories else []
    )
    age_groups = request.args.get("age_groups", "")
    age_group = (
        [int(x) for x in age_groups.split(",") if x.isdigit()] if age_groups else []
    )
    tags = request.args.get("tags", "")
    tag = [int(x) for x in tags.split(",") if x.isdigit()] if tags else []
    page = request.args.get("page", default=1, type=int)
    MAX_NUM_OF_SUGGESTIONS = 3

    # Setup query filters
    filters = [Attraction.city == city.id]
    if search_text:
        filters.append(Attraction.name.contains(search_text))
    base_attraction_ids = [
        (attraction.id) for attraction in Attraction.query.filter(and_(*filters)).all()
    ]
    if category:
        filters.append(
            Attraction.category.any(AttractionCategory.category_id.in_(category))
        )
    if age_group:
        filters.append(
            Attraction.age_groups.any(AttractionAgeGroup.age_group_id.in_(age_group))
        )
    if tag:
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(tag)))
    attraction_ids = [
        (attraction.id) for attraction in Attraction.query.filter(and_(*filters)).all()
    ]

    # Prioritise fitting suggestions if logged in
    suggested_ids = set()
    if current_user.is_authenticated:
        suggested_attractions = suggest_attractions_for_user(current_user.id)
        visited_attractions = {
            va.attraction_id
            for va in VisitedAttraction.query.filter_by(user_id=current_user.id).all()
        }
        suggested_attractions = [
            attr
            for attr in suggested_attractions
            if attr["attraction_id"] not in visited_attractions
        ]
        suggested_attractions = sorted(
            suggested_attractions, key=lambda x: x["score"], reverse=True
        )[:MAX_NUM_OF_SUGGESTIONS]
        suggested_ids = [attr["attraction_id"] for attr in suggested_attractions]
        attraction_ids = sorted(
            attraction_ids,
            key=lambda x: (
                x not in suggested_ids,
                suggested_ids.index(x) if x in suggested_ids else float("inf"),
            ),
        )

    # Paginate the queried attractions
    if attraction_ids:
        query = Attraction.query.filter(Attraction.id.in_(attraction_ids)).order_by(
            func.field(Attraction.id, *attraction_ids)
        )
    else:
        query = Attraction.query.filter(Attraction.id.in_([]))

    per_page = 6
    attractions_pagination = query.paginate(page=page, per_page=per_page)
    attractions = attractions_pagination.items
    total_pages = attractions_pagination.pages
    current_page = attractions_pagination.page

    # Setup forms
    search_form = SearchForm()
    search_form.search_text.data = search_text
    filter_form = FilterAttractionsForm()
    filter_form.categories.data = category
    filter_form.age_groups.data = age_group
    filter_form.tags.data = tag
    cat_ids, age_ids, tag_ids = get_filter_ids(
        filter_priority_list, category, age_group, tag, base_attraction_ids
    )
    update_filter_form_choices(filter_form, cat_ids, age_ids, tag_ids)

    # Render HTML template with attractions and pagination information
    return render_template(
        "attractions_main.html",
        attractions=attractions,
        suggested_ids=suggested_ids,
        search_form=search_form,
        filter_form=filter_form,
        total_pages=total_pages,
        current_page=current_page,
        city=city,
    )


@attractions.route("/attractions/suggested", methods=["GET", "POST"])
@login_required
def suggested_attractions():
    """
    Retrieve and display suggested attractions based on user preferences and filters.

    Returns:
        A rendered template with the suggested attractions, search form, filter form,
        current page, total pages, and city information.
    """
    if "selected_city" in session:
        selected_city = session["selected_city"]
    else:
        session["selected_city"] = 1
        selected_city = session["selected_city"]
    city = City.query.get(selected_city)

    # Parse URL parameters for filtering
    filter_priority = request.args.get("filterPriority")
    filter_priority_list = filter_priority.split(",") if filter_priority else []
    categories = request.args.get("categories", "")
    category = (
        [int(x) for x in categories.split(",") if x.isdigit()] if categories else []
    )
    age_groups = request.args.get("age_groups", "")
    age_group = (
        [int(x) for x in age_groups.split(",") if x.isdigit()] if age_groups else []
    )
    tags = request.args.get("tags", "")
    tag = [int(x) for x in tags.split(",") if x.isdigit()] if tags else []
    page = request.args.get("page", default=1, type=int)
    MAX_NUM_OF_SUGGESTIONS = 12

    # Find suggested attractions
    suggested_attractions = suggest_attractions_for_user(current_user.id)
    visited_attractions = {
        va.attraction_id
        for va in VisitedAttraction.query.filter_by(user_id=current_user.id).all()
    }

    suggested_attractions = [
        attr
        for attr in suggested_attractions
        if attr["attraction_id"] not in visited_attractions
    ]

    suggested_attractions = sorted(
        suggested_attractions, key=lambda x: x["score"], reverse=True
    )[:MAX_NUM_OF_SUGGESTIONS]

    suggested_ids = [attr["attraction_id"] for attr in suggested_attractions]

    # Setup query filters
    filters = [Attraction.city == city.id]
    filters.append(Attraction.id.in_(suggested_ids))
    base_attraction_ids = [
        (attraction.id) for attraction in Attraction.query.filter(and_(*filters)).all()
    ]
    if category:
        filters.append(
            Attraction.category.any(AttractionCategory.category_id.in_(category))
        )
    if age_group:
        filters.append(
            Attraction.age_groups.any(AttractionAgeGroup.age_group_id.in_(age_group))
        )
    if tag:
        filters.append(Attraction.tags.any(AttractionTag.tag_id.in_(tag)))

    # Paginate the queried attractions
    per_page = 6
    attractions_pagination = Attraction.query.filter(and_(*filters)).paginate(
        page=page, per_page=per_page
    )
    attractions = attractions_pagination.items
    total_pages = attractions_pagination.pages
    current_page = attractions_pagination.page

    # Setup forms
    search_form = SearchForm()
    filter_form = FilterAttractionsForm()
    filter_form.categories.data = category
    filter_form.age_groups.data = age_group
    filter_form.tags.data = tag
    cat_ids, age_ids, tag_ids = get_filter_ids(
        filter_priority_list, category, age_group, tag, base_attraction_ids
    )
    update_filter_form_choices(filter_form, cat_ids, age_ids, tag_ids)

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


@attractions.route("/attractions/<int:attraction_id>/mark_as_visited", methods=["POST"])
@login_required
def mark_as_visited(attraction_id):
    """
    Marks or unmarks an attraction as visited for the current user.

    Args:
        attraction_id (int): The ID of the attraction to mark/unmark.

    Returns:
        dict: A JSON response containing the status and message of the operation,
              as well as the current level information for the user.

    Raises:
        None
    """
    data = request.get_json()
    visited = data.get("visited", False)
    existing_record = VisitedAttraction.query.filter_by(
        user_id=current_user.id, attraction_id=attraction_id
    ).first()

    # Mark attraction as visited
    if visited and not existing_record:
        visited_attraction = VisitedAttraction(
            user_id=current_user.id, attraction_id=attraction_id
        )
        db.session.add(visited_attraction)
        db.session.commit()
        level = current_user.level
        return jsonify(
            {
                "status": "success",
                "message": "Attraction marked as visited.",
                "current_level": level["current_level"],
                "points_required": level["points_required"],
                "points_missing": level["points_missing"],
                "progress": level["progress"],
            }
        )

    # Unmark attraction as visited
    elif not visited and existing_record:
        db.session.delete(existing_record)
        db.session.commit()
        level = current_user.level
        return jsonify(
            {
                "status": "success",
                "message": "Attraction mark removed.",
                "current_level": level["current_level"],
                "points_required": level["points_required"],
                "points_missing": level["points_missing"],
                "progress": level["progress"],
            }
        )

    return jsonify({"status": "error", "message": "An error occurred."})


@attractions.route("/attractions/add_to_group", methods=["POST"])
@login_required
def add_to_group():
    """
    Adds an attraction to a group or creates a new group and adds the attraction to it.

    Returns:
        A JSON response containing the status and message.

    Example:
        {
            "status": "success",
            "message": "Attraction added to group."
        }
    """
    data = request.get_json()
    attraction_id = data["attractionId"]
    group_id = data.get("groupId")

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
    """
    Remove an attraction from a group.

    This function receives a JSON payload containing the `attractionId` and `groupId` of the attraction and group
    respectively. It then attempts to retrieve the corresponding `Attraction` and `AttractionGroup` objects from the
    database. If both objects exist, the attraction is removed from the group and the changes are committed to the
    database. Finally, a JSON response is returned indicating the status of the operation.

    Returns:
        A JSON response with the following structure:
        {
            "status": "success" or "error",
            "message": "Attraction removed from group." or "An error occurred."
        }
    """
    data = request.get_json()
    attraction_id = data["attractionId"]
    group_id = data["groupId"]

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


@attractions.route("/attractions/<int:attraction_id>/add_to_wishlist", methods=["POST"])
@login_required
def mark_as_wishlist(attraction_id):
    """
    Marks an attraction as a wishlist item for the current user.

    Args:
        attraction_id (int): The ID of the attraction to mark as wishlist.

    Returns:
        dict: A JSON response containing the status and message.

    Raises:
        None
    """
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


def suggest_attractions_for_user(user_id):
    """
    Suggests attractions for a given user based on their preferences.

    Args:
        user_id (int): The ID of the user.

    Returns:
        list: A list of dictionaries containing the suggested attractions with their IDs, names, and scores.
    """
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


def get_filter_ids(
    filter_priority,
    selected_categories,
    selected_age_groups,
    selected_tags,
    base_attractions_ids,
):
    """
    Get the filter IDs based on the given filter priority and selected filters.

    Args:
        filter_priority (list): The priority order of the filters.
        selected_categories (list): The selected category filters.
        selected_age_groups (list): The selected age group filters.
        selected_tags (list): The selected tag filters.
        base_attractions_ids (list): The base attraction IDs.

    Returns:
        tuple: A tuple containing the filtered category IDs, age group IDs, and tag IDs.

    """
    if filter_priority and filter_priority[0] == "categories":
        category_ids, primary_attraction_ids = get_primary_filter_ids(
            "categories", selected_categories, base_attractions_ids
        )
        age_group_ids = get_secondary_filter_ids(
            "age_groups", primary_attraction_ids, base_attractions_ids
        )
        tag_ids = get_secondary_filter_ids(
            "tags", primary_attraction_ids, base_attractions_ids
        )
        if len(filter_priority) > 1:
            if filter_priority[1] == "age_groups":
                tag_ids = get_tertiary_filter_ids(
                    "tags",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                    base_attractions_ids,
                )
            elif filter_priority[1] == "tags":
                age_group_ids = get_tertiary_filter_ids(
                    "age_groups",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                    base_attractions_ids,
                )

    elif filter_priority and filter_priority[0] == "age_groups":
        age_group_ids, primary_attraction_ids = get_primary_filter_ids(
            "age_groups", selected_age_groups, base_attractions_ids
        )
        category_ids = get_secondary_filter_ids(
            "categories", primary_attraction_ids, base_attractions_ids
        )
        tag_ids = get_secondary_filter_ids(
            "tags", primary_attraction_ids, base_attractions_ids
        )
        if len(filter_priority) > 1:
            if filter_priority[1] == "categories":
                tag_ids = get_tertiary_filter_ids(
                    "tags",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                    base_attractions_ids,
                )
            elif filter_priority[1] == "tags":
                category_ids = get_tertiary_filter_ids(
                    "categories",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                    base_attractions_ids,
                )

    elif filter_priority and filter_priority[0] == "tags":
        tag_ids, primary_attraction_ids = get_primary_filter_ids(
            "tags", selected_tags, base_attractions_ids
        )
        category_ids = get_secondary_filter_ids(
            "categories", primary_attraction_ids, base_attractions_ids
        )
        age_group_ids = get_secondary_filter_ids(
            "age_groups", primary_attraction_ids, base_attractions_ids
        )
        if len(filter_priority) > 1:
            if filter_priority[1] == "categories":
                age_group_ids = get_tertiary_filter_ids(
                    "age_groups",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                    base_attractions_ids,
                )
            elif filter_priority[1] == "age_groups":
                category_ids = get_tertiary_filter_ids(
                    "categories",
                    selected_categories,
                    selected_age_groups,
                    selected_tags,
                    base_attractions_ids,
                )
    else:
        category_ids = (
            db.session.query(AttractionCategory.category_id)
            .filter(AttractionCategory.attraction_id.in_(base_attractions_ids))
            .distinct(AttractionCategory.category_id)
            .all()
        )
        age_group_ids = (
            db.session.query(AttractionAgeGroup.age_group_id)
            .filter(AttractionAgeGroup.attraction_id.in_(base_attractions_ids))
            .distinct(AttractionAgeGroup.age_group_id)
            .all()
        )
        tag_ids = (
            db.session.query(AttractionTag.tag_id)
            .filter(AttractionTag.attraction_id.in_(base_attractions_ids))
            .distinct(AttractionTag.tag_id)
            .all()
        )

    category_ids_flat = [cat_id[0] for cat_id in category_ids]
    age_group_ids_flat = [age_id[0] for age_id in age_group_ids]
    tags_ids_flat = [tag_id[0] for tag_id in tag_ids]

    return category_ids_flat, age_group_ids_flat, tags_ids_flat


def get_primary_filter_ids(filter_type, selected_filter_type_ids, base_attractions_ids):
    """
    Retrieve the primary filter IDs and primary attraction IDs based on the given filter type, selected filter type IDs,
    and base attraction IDs.

    Args:
        filter_type (str): The type of filter to apply. Possible values are "categories", "age_groups", or "tags".
        selected_filter_type_ids (list): The list of selected filter type IDs.
        base_attractions_ids (list): The list of base attraction IDs.

    Returns:
        tuple: A tuple containing two lists. The first list contains the primary filter IDs, and the second list contains
        the primary attraction IDs.
    """
    if filter_type == "categories":
        relationship = AttractionCategory.category_id
        attribute = Attraction.category
        filter = AttractionCategory.attraction_id.in_(base_attractions_ids)
    elif filter_type == "age_groups":
        relationship = AttractionAgeGroup.age_group_id
        attribute = Attraction.age_groups
        filter = AttractionAgeGroup.attraction_id.in_(base_attractions_ids)
    elif filter_type == "tags":
        relationship = AttractionTag.tag_id
        attribute = Attraction.tags
        filter = AttractionTag.attraction_id.in_(base_attractions_ids)

    primary_attraction_ids_query = (
        db.session.query(Attraction.id)
        .filter(attribute.any(relationship.in_(selected_filter_type_ids)))
        .all()
    )
    primary_attraction_ids = [
        attraction_id for (attraction_id,) in primary_attraction_ids_query
    ]
    primary_filter_ids = (
        db.session.query(relationship).filter(filter).distinct(relationship).all()
    )
    return primary_filter_ids, primary_attraction_ids


def get_secondary_filter_ids(filter_type, primary_attraction_ids, base_attractions_ids):
    """
    Retrieve the secondary filter IDs based on the given filter type, primary attraction IDs, and base attraction IDs.

    Args:
        filter_type (str): The type of filter to apply. Possible values are "categories", "age_groups", or "tags".
        primary_attraction_ids (list): The list of primary attraction IDs.
        base_attractions_ids (list): The list of base attraction IDs.

    Returns:
        list: The list of secondary filter IDs.

    Raises:
        None

    """
    if filter_type == "categories":
        model = AttractionCategory
        relationship = AttractionCategory.category_id
        filters = [AttractionCategory.attraction_id.in_(base_attractions_ids)]
    elif filter_type == "age_groups":
        model = AttractionAgeGroup
        relationship = AttractionAgeGroup.age_group_id
        filters = [AttractionAgeGroup.attraction_id.in_(base_attractions_ids)]
    elif filter_type == "tags":
        model = AttractionTag
        relationship = AttractionTag.tag_id
        filters = [AttractionTag.attraction_id.in_(base_attractions_ids)]

    filters.append(model.attraction_id.in_(primary_attraction_ids))
    secondary_filter_ids = (
        db.session.query(relationship)
        .filter(and_(*filters))
        .distinct(relationship)
        .all()
    )
    return secondary_filter_ids


def get_tertiary_filter_ids(
    filter_type,
    selected_categories,
    selected_age_groups,
    selected_tags,
    base_attractions_ids,
):
    """
    Retrieves the tertiary filter IDs based on the given filter type and selected criteria.

    Args:
        filter_type (str): The type of filter to apply. Possible values are "categories", "age_groups", or "tags".
        selected_categories (list): The list of selected category IDs.
        selected_age_groups (list): The list of selected age group IDs.
        selected_tags (list): The list of selected tag IDs.
        base_attractions_ids (list): The list of base attraction IDs.

    Returns:
        list: The list of tertiary filter IDs.

    """
    filters = [Attraction.id.in_(base_attractions_ids)]
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


def update_filter_form_choices(filter_form, category_ids, age_group_ids, tag_ids):
    """
    Update the choices of the filter form fields based on the given category, age group, and tag IDs.

    Args:
        filter_form (Form): The filter form object to update.
        category_ids (list): A list of category IDs.
        age_group_ids (list): A list of age group IDs.
        tag_ids (list): A list of tag IDs.
    """
    categories = (
        Category.query.filter(Category.id.in_(category_ids))
        .order_by(Category.name)
        .all()
    )
    age_groups = (
        AgeGroup.query.filter(AgeGroup.id.in_(age_group_ids))
        .order_by(AgeGroup.id)
        .all()
    )
    tags = Tag.query.filter(Tag.id.in_(tag_ids)).order_by(Tag.name).all()

    filter_form.categories.choices = [(cat.id, cat.name) for cat in categories]
    filter_form.age_groups.choices = [(age.id, age.name) for age in age_groups]
    filter_form.tags.choices = [(tag.id, tag.name) for tag in tags]
