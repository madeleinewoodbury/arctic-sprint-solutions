import html
import math
import json
from . import auth
from .forms import (
    LoginForm,
    RegistrationForm,
    SearchUsersForm,
    PasswordResetRequestForm,
    PasswordResetForm,
    UpdateProfileForm,
    UpdatePreferencesForm,
    AddListForm,
    EditListForm,
)
from .. import db
from ..models import *
from flask import (
    render_template,
    request,
    redirect,
    url_for,
    session,
    flash,
    abort,
    jsonify,
)
from flask_login import login_user, logout_user, login_required, current_user
from flask_babel import _
from datetime import datetime
from ..email import send_email
from sqlalchemy import func


@auth.route("/register", methods=["GET", "POST"])
def register() -> "html":
    """
    Register a new user.

    If the current user is already authenticated, redirect to the attractions page.
    Otherwise, display the registration form and handle form submission.

    Returns:
        html: The rendered HTML template for the registration page.
    """
    if current_user.is_authenticated:
        return redirect(url_for("attractions.get_attractions"))
    form = RegistrationForm()
    form.country.choices = [
        (country.id, country.name) for country in Country.query.all()
    ]

    if form.validate_on_submit():
        user = User(
            username=form.username.data,
            first_name=form.first_name.data,
            last_name=form.last_name.data,
            email=form.email.data,
            country_id=form.country.data,
        )
        user.set_password(form.password.data)
        db.session.add(user)
        db.session.commit()
        flash(_("User has been registered."), "success")
        return redirect(url_for("auth.login"))

    return render_template("register.html", form=form)


@auth.route("/login", methods=["GET", "POST"])
def login() -> "html":
    """
    Renders the login page and handles the login functionality.

    Returns:
        html: The rendered login page.
    """
    if current_user.is_authenticated:
        return redirect(url_for("attractions.get_attractions"))
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user is not None and user.check_password(form.password.data):
            login_user(user, form.remember_me.data)
            return redirect(url_for("attractions.get_attractions"))
        flash(_("Invalid username or password."), "error")
    return render_template("login.html", form=form)


@auth.route("/logout")
@login_required
def logout():
    """
    Log out the current user.

    This function logs out the current user by calling the `logout_user` function,
    displays a success message using the `flash` function, and redirects the user
    to the index page using the `redirect` function.

    Returns:
        A redirect response to the index page.
    """
    logout_user()
    flash(_("You have been logged out."), "success")
    return redirect(url_for("main.index"))


@auth.route("/reset", methods=["GET", "POST"])
def password_reset_request():
    """
    Handle password reset request.

    If the user is already authenticated, redirect to the attractions page.
    Otherwise, display the password reset request form.
    If the form is submitted and valid, generate a reset token for the user,
    send an email with instructions to reset the password, and display a success message.
    Finally, redirect to the login page.

    Returns:
        A redirect response or a rendered template.
    """
    if current_user.is_authenticated:
        return redirect(url_for("attractions.get_attractions"))
    form = PasswordResetRequestForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user:
            token = user.generate_reset_token()
            send_email(
                user.email,
                "Reset your password",
                "email/reset_password",
                user=user,
                token=token,
            )
        flash(
            _(
                "An email with instructions to reset your password has been sent to you."
            ),
            "success",
        )
        return redirect(url_for("auth.login"))
    return render_template("reset_password_request.html", form=form)


@auth.route("/reset/<token>", methods=["GET", "POST"])
def password_reset(token):
    """
    Reset the user's password using the provided token.

    Args:
        token (str): The token used for password reset.

    Returns:
        A redirect to the login page if the password is successfully reset,
        otherwise a redirect to the login page.

    """
    if current_user.is_authenticated:
        return redirect(url_for("attractions.get_attractions"))
    form = PasswordResetForm()
    if form.validate_on_submit():
        if User.reset_password(token, form.password.data):
            db.session.commit()
            flash("Your password has been updated.", "success")
            return redirect(url_for("auth.login"))
        else:
            return redirect(url_for("auth.login"))
    return render_template("reset_password.html", form=form)


def update_user_profile(profile_form, activeTab):
    """
    Update the user profile with the provided form data.

    Args:
        profile_form (Form): The form containing the user profile data.
        activeTab (str): The active tab in the user profile page.

    Returns:
        redirect: A redirect response to the user profile page.

    Raises:
        None

    """
    # Update user profile
    email_change = False
    username_change = False
    user = User.query.filter_by(id=current_user.id).first()
    user.first_name = profile_form.first_name.data
    user.last_name = profile_form.last_name.data
    user.country_id = profile_form.country.data

    # Also update password if filled
    if profile_form.password.data:
        user.set_password(profile_form.password.data)

    # Send email notification if email or username has changed
    if user.email != profile_form.email.data:
        email_change = True

    if user.username != profile_form.username.data:
        username_change = True

    if email_change or username_change:
        send_email(
            user.email,
            "Changes has been done to your profile.",
            "email/profile_updated",
            user=user,
            email_change=email_change,
            username_change=username_change,
            new_email=profile_form.email.data,
            new_username=profile_form.username.data,
        )

    user.email = profile_form.email.data
    user.username = profile_form.username.data

    db.session.commit()
    profile_form.is_active.data = "false"
    flash(_("Your profile has been updated!"), "success")
    return redirect(
        url_for("auth.profile", current_tab=activeTab)
    )  # Redirect to avoid form resubmission


def update_user_preferences(preferences_form, activeTab):
    """
    Update the user's preferences based on the selected options in the preferences form.

    Args:
        preferences_form (Form): The form containing the user's preferences.
        activeTab (str): The active tab in the user's profile.

    Returns:
        redirect: A redirect to the user's profile page.

    Raises:
        Exception: If there is an error updating the user's preferences.

    """
    selected_category_ids = preferences_form.category.data
    selected_age_group_ids = preferences_form.age_group.data
    selected_tag_ids = preferences_form.tag.data

    # Ensure transactional integrity
    try:
        UserTagPreference.query.filter_by(user_id=current_user.id).delete()
        UserCategoryPreference.query.filter_by(user_id=current_user.id).delete()
        UserAgeGroupPreference.query.filter_by(user_id=current_user.id).delete()
        db.session.flush()

        for tag_id in selected_tag_ids:
            user_preference = UserTagPreference(user_id=current_user.id, tag_id=tag_id)
            db.session.add(user_preference)

        for category_id in selected_category_ids:
            user_preference = UserCategoryPreference(
                user_id=current_user.id, category_id=category_id
            )
            db.session.add(user_preference)

        for age_group_id in selected_age_group_ids:
            user_preference = UserAgeGroupPreference(
                user_id=current_user.id, age_group_id=age_group_id
            )
            db.session.add(user_preference)

        db.session.commit()
        flash(_("Your preferences have been updated!"), "success")

    except Exception as e:
        db.session.rollback()
        flash(_("Error updating user preferences: ") + str(e), "error")

    finally:
        preferences_form.is_active.data = "false"
        return redirect(url_for("auth.profile", current_tab=activeTab))


def get_user_preferences():
    """
    Fetches the user's preferences for tags, categories, and age groups.

    Returns:
        dict: A dictionary containing the user's preferences.
            The dictionary has the following structure:
            {
                'tags': [str]: A list of tag names representing the user's tag preferences,
                'categories': [str]: A list of category names representing the user's category preferences,
                'age_groups': [str]: A list of age group names representing the user's age group preferences
            }
    """
    # Fetch user's tag preferences
    user_tag_preferences = UserTagPreference.query.filter_by(
        user_id=current_user.id
    ).all()
    tag_preferences = [
        Tag.query.get(preference.tag_id).name for preference in user_tag_preferences
    ]

    # Fetch user's category preferences
    user_category_preferences = UserCategoryPreference.query.filter_by(
        user_id=current_user.id
    ).all()
    category_preferences = [
        Category.query.get(preference.category_id).name
        for preference in user_category_preferences
    ]

    # Fetch user's age group preferences
    user_age_group_preferences = UserAgeGroupPreference.query.filter_by(
        user_id=current_user.id
    ).all()
    age_group_preferences = [
        AgeGroup.query.get(preference.age_group_id).name
        for preference in user_age_group_preferences
    ]

    user_preferences = {
        "tags": tag_preferences,
        "categories": category_preferences,
        "age_groups": age_group_preferences,
    }

    return user_preferences


def search_users(search_text):
    """
    Search for users whose username contains the given search text.

    Args:
        search_text (str): The text to search for in the usernames.

    Returns:
        list: A list of User objects that match the search criteria.
    """
    users = (
        User.query.filter(User.username.contains(search_text))
        .filter(User.id != current_user.id)
        .all()
    )

    return users


def get_friendships(user):
    """
    Retrieves the friendships of a given user.

    Args:
        user: The user object for which to retrieve friendships.

    Returns:
        A dictionary containing the user's friendships, categorized into different lists:
        - 'friends': A list of friends (users who have accepted the friendship request).
        - 'friends_id': A list of friend IDs.
        - 'initiated': A list of users who have received a friendship request from the given user.
        - 'received': A list of users who have initiated a friendship request to the given user.
    """
    friendships = {"friends": [], "friends_id": [], "initiated": [], "received": []}
    for friendship in user.initiated_friendships:
        if friendship.status == "accepted":
            friendships["friends"].append(friendship.receiver)
            friendships["friends_id"].append(friendship.receiver.id)
        elif friendship.status == "pending":
            friendships["initiated"].append(friendship.receiver)
    for friendship in user.received_friendships:
        if friendship.status == "accepted":
            friendships["friends"].append(friendship.initiator)
            friendships["friends_id"].append(friendship.initiator.id)
        elif friendship.status == "pending":
            friendships["received"].append(friendship.initiator)

    friends_data = []
    # Get attraction info from every friend
    for user in friendships["friends"]:
        friend = {"user": user, "visited": get_visited_attractions(user.id)}
        friend["points"] = sum(item["attraction"].points for item in friend["visited"])
        friend["level"] = friend["user"].level.get("current_level")
        friends_data.append(friend)

    friends_data = sorted(friends_data, key=lambda x: x["points"], reverse=True)
    friendships["friends"] = sorted(
        friends_data, key=lambda x: x["points"], reverse=True
    )

    return friendships


def get_visited_attractions(user_id):
    """
    Retrieve a list of visited attractions for a given user.

    Args:
        user_id (int): The ID of the user.

    Returns:
        list: A list of dictionaries containing information about visited attractions.
              Each dictionary contains the 'attraction' object and the 'time_visited'
              formatted as "%d-%m-%Y".
    """
    visited_attractions = [
        {
            "attraction": Attraction.query.get(attraction.attraction_id),
            "time_visited": attraction.time_visited.strftime("%d-%m-%Y"),
        }
        for attraction in VisitedAttraction.query.filter_by(user_id=user_id).all()
    ]

    return visited_attractions


def get_user_badge_progress(user_id):
    """
    Retrieves the badge progress for a given user.

    Args:
        user_id (int): The ID of the user.

    Returns:
        tuple: A tuple containing two lists:
            - unlocked_progression: A list of dictionaries representing the badges that have been unlocked by the user.
            - in_progress_badges: A list of dictionaries representing the badges that are still in progress for the user.
    """
    badges = Badge.query.all()
    unlocked_progression = []
    in_progress_badges = []

    user_achieved_badges = {
        ub.badge_id for ub in UserBadge.query.filter_by(user_id=user_id)
    }

    for badge in badges:
        requirements = BadgeRequirement.query.filter_by(badge_id=badge.id).all()
        badge_progress = {
            "badge_name": badge.name,
            "description": badge.description,
            "tags_progress": [],
            "unlocked": badge.id in user_achieved_badges,
        }

        total_required = sum(req.quantity_required for req in requirements)
        total_visited = 0

        for req in requirements:
            tag = Tag.query.get(req.tag_id)
            visited_count = (
                db.session.query(db.func.count(VisitedAttraction.attraction_id))
                .join(
                    AttractionTag,
                    VisitedAttraction.attraction_id == AttractionTag.attraction_id,
                )
                .filter(
                    VisitedAttraction.user_id == user_id,
                    AttractionTag.tag_id == req.tag_id,
                )
                .scalar()
                or 0
            )

            total_visited += visited_count

            badge_progress["tags_progress"].append(
                {
                    "tag_name": tag.name,
                    "visited_count": visited_count,
                    "required_count": req.quantity_required,
                }
            )

        if total_visited >= total_required:
            if badge.id not in user_achieved_badges:
                new_user_badge = UserBadge(
                    user_id=user_id, badge_id=badge.id, date_earned=datetime.now()
                )
                db.session.add(new_user_badge)
                db.session.commit()
            badge_progress["unlocked"] = True
            unlocked_progression.append(badge_progress)
        else:
            in_progress_badges.append(badge_progress)

    # Sort badges by progress
    in_progress_badges.sort(
        key=lambda x: sum(item["visited_count"] for item in x["tags_progress"]),
        reverse=True,
    )

    return unlocked_progression, in_progress_badges


@auth.route("/profile", methods=["GET", "POST"])
@login_required
def profile():
    """
    Renders the profile page with various tabs and forms.

    Returns:
        A rendered template of the profile page with the necessary data.
    """
    current_tab = request.args.get("current_tab")
    activeTab = current_tab if current_tab else 0

    # Visited Attractions Tab
    visited_attractions = get_visited_attractions(current_user.id)
    points = sum(item["attraction"].points for item in visited_attractions)

    # Profile Tab
    profile_form = UpdateProfileForm()
    preferences_form = UpdatePreferencesForm()
    profile_form.country.choices = [
        (country.id, country.name) for country in Country.query.all()
    ]
    preferences_form.category.choices = [
        (category.id, category.name) for category in Category.query.all()
    ]
    preferences_form.age_group.choices = [
        (age_group.id, age_group.name) for age_group in AgeGroup.query.all()
    ]
    preferences_form.tag.choices = [(tag.id, tag.name) for tag in Tag.query.all()]

    profile_form.is_active.data = "false"
    preferences_form.is_active.data = "false"

    if preferences_form.update_preferences.data:
        activeTab = 1
        preferences_form.is_active.data = "true"
        if preferences_form.validate_on_submit():
            update_user_preferences(preferences_form, activeTab)

    else:
        # Prepopulate preferences form fields
        preferences_form.category.data = [
            category.category_id for category in current_user.category_preferences
        ]
        preferences_form.age_group.data = [
            age_group.age_group_id for age_group in current_user.age_group_preferences
        ]
        preferences_form.tag.data = [tag.tag_id for tag in current_user.tag_preferences]

    if profile_form.update_profile.data:
        activeTab = 1
        profile_form.is_active.data = "true"
        if profile_form.validate_on_submit():
            update_user_profile(profile_form, activeTab)

    else:
        # Prepopulate profile form fields
        profile_form.username.data = current_user.username
        profile_form.first_name.data = current_user.first_name
        profile_form.last_name.data = current_user.last_name
        profile_form.email.data = current_user.email
        profile_form.country.data = current_user.country_id

    # Fetch the user preferences from the database
    user_preferences = get_user_preferences()

    # Friends Tab
    friendships = get_friendships(current_user)
    friends_form = SearchUsersForm()
    search_text = friends_form.search_text.data
    users = None

    if friends_form.validate_on_submit():
        users = search_users(search_text)
        activeTab = 3

    # Badges tab
    # Calculating badge progress for all badges.
    unlocked_progression, in_progress_badges = get_user_badge_progress(current_user.id)

    # List Tab
    list_form = AddListForm()
    edit_list_form = EditListForm()
    user_groups = json.dumps(
        [
            group.to_dict()
            for group in AttractionGroup.query.filter_by(owner=current_user.id).all()
        ]
    )

    # Tabs for profile page sections, only one section should be active
    tabs = ["Visited Attractions", "Profile", "Lists", "Friends", "Badges"]

    return render_template(
        "profile.html",
        profile_form=profile_form,
        preferences_form=preferences_form,
        user_preferences=user_preferences,
        visited_attractions=visited_attractions,
        number_of_visited_attractions=len(visited_attractions),
        user_groups=user_groups,
        points=points,
        tabs=tabs,
        friends_form=friends_form,
        list_form=list_form,
        edit_list_form=edit_list_form,
        users=users,
        friendships=friendships,
        unlocked_progress=unlocked_progression,
        in_progress_badges=in_progress_badges,
        activeTab=activeTab,
    )


@auth.route("/friends/send-request/<int:user_id>", methods=["POST"])
@login_required
def send_friend_request(user_id):
    """
    Sends a friend request to the specified user.

    Args:
        user_id (int): The ID of the user to send the friend request to.

    Returns:
        redirect: A redirect to the user's profile page with the current tab set to 3.
    """
    friendship = Friendship(user_1=current_user.id, user_2=user_id, status="pending")

    db.session.add(friendship)
    db.session.commit()
    flash(_("The friend request has been sent."), "success")
    return redirect(url_for("auth.profile", current_tab=3))


@auth.route("/friends/accept-request/<int:user_id>", methods=["POST"])
@login_required
def accept_friend_request(user_id):
    """
    Accepts a friend request for the given user.

    Args:
        user_id (int): The ID of the user whose friend request is being accepted.

    Returns:
        redirect: A redirect response to the user's profile page.

    Raises:
        404: If the friend request is not found or has already been accepted.
    """
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
        Friendship.status == "pending",
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted

    friendship.status = "accepted"
    db.session.commit()
    flash(_("The friend request has been accepted."), "success")
    return redirect(url_for("auth.profile", current_tab=3))


@auth.route("/friends/remove-request/<int:user_id>", methods=["POST"])
@login_required
def remove_friend_request(user_id):
    """
    Remove a friend request.

    This function removes a friend request from the database based on the provided user_id.
    If the friend request is not found or has already been accepted, a 404 error is raised.

    Args:
        user_id (int): The ID of the user associated with the friend request.

    Returns:
        redirect: A redirect response to the user's profile page.

    Raises:
        404: If the friend request is not found or has already been accepted.
    """
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
        Friendship.status == "pending",
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted

    db.session.delete(friendship)
    db.session.commit()
    flash(_("The friend request has been ended."), "success")
    return redirect(url_for("auth.profile", current_tab=3))


@auth.route("/friends/remove-friend/<int:user_id>", methods=["POST"])
@login_required
def remove_friend(user_id):
    """
    Remove a friend from the user's friend list.

    Args:
        user_id (int): The ID of the friend to be removed.

    Returns:
        redirect: A redirect to the user's profile page.

    Raises:
        404: If the friendship request is not found or already accepted.
    """
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
        Friendship.status == "accepted",
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted

    db.session.delete(friendship)
    db.session.commit()
    flash(_("The friend has been removed."), "success")
    return redirect(url_for("auth.profile", current_tab=3))


@auth.route("/friend/profile/<int:user_id>", methods=["GET"])
@login_required
def friend_profile(user_id):
    """
    Render the friend profile page.

    Args:
        user_id (int): The ID of the friend.

    Returns:
        flask.Response: The rendered friend profile page.

    Raises:
        werkzeug.exceptions.NotFound: If the friend with the given ID does not exist.
    """
    current_tab = request.args.get("current_tab")
    activeTab = current_tab if current_tab else 0
    friend = User.query.get(user_id)

    if friend is None:
        abort(404)

    # groups = AttractionGroup.query.filter_by(owner=user_id, visibility='public').all()
    groups = json.dumps(
        [
            group.to_dict()
            for group in AttractionGroup.query.filter_by(
                owner=user_id, visibility="public"
            ).all()
        ]
    )
    visited_attractions = get_visited_attractions(user_id)
    points = sum(item["attraction"].points for item in visited_attractions)
    unlocked_progression, in_progress_badges = get_user_badge_progress(user_id)

    tabs = ["Visited Attractions", "Badges", "Lists"]

    return render_template(
        "friendProfile.html",
        friend=friend,
        groups=groups,
        visited_attractions=visited_attractions,
        number_of_visited_attractions=len(visited_attractions),
        points=points,
        tabs=tabs,
        activeTab=activeTab,
        unlocked_progress=unlocked_progression,
    )


# Function to check if password is correct from javascript
@auth.route("/delete-user-request", methods=["POST"])
def delete_user_request():
    """
    Process a request to delete a user.

    This function handles the logic for deleting a user account. It checks the provided delete password
    against the current user's password, generates a delete token, and sends an email to the user with
    instructions on how to delete their account.

    Returns:
        A JSON response indicating the success or failure of the delete request.

    """
    data = request.get_json()
    password = data.get("delete_password")

    if current_user.check_password(password):
        user = User.query.filter_by(email=current_user.email).first()
        if user:
            if user.is_admin:
                return jsonify({"success": False, "admin": True})
            token = user.generate_delete_token()
            send_email(
                user.email,
                "Delete your user",
                "email/delete_user",
                user=user,
                token=token,
            )
            return jsonify({"success": True})
        else:
            return jsonify({"success": False})
    else:
        return jsonify({"success": False})


# Confirm delete_user
@auth.route("/delete_user/<token>", methods=["GET", "POST"])
def delete_user(token):
    """
    Deletes a user from the system.

    Args:
        token (str): The user's authentication token.

    Returns:
        A redirect response to the login page.

    Raises:
        None.
    """
    if User.delete_user(token):
        logout_user()
        db.session.commit()
        flash("Your user has been deleted.", "success")
        return redirect(url_for("auth.login"))
    else:
        flash("Your user has NOT been deleted.", "error")
        return redirect(url_for("auth.login"))


@auth.route("/add-list", methods=["POST"])
@login_required
def add_list():
    """
    Add a new list to the database.

    This function creates a new list in the database based on the data submitted through the `AddListForm`.
    If the form is valid, a new `AttractionGroup` object is created with the owner, title, and visibility
    specified in the form. The new list is then added to the database and committed. A success message is
    flashed to the user, and they are redirected to the profile page with the current tab set to 2.

    Returns:
        redirect: A redirect response to the profile page.

    """
    form = AddListForm()

    if form.validate_on_submit():
        new_list = AttractionGroup(
            owner=current_user.id, title=form.name.data, visibility=form.visibility.data
        )
        db.session.add(new_list)
        db.session.commit()
        flash(_("The list has been created."), "success")
    return redirect(url_for("auth.profile", current_tab=2))


@auth.route("/delete-group", methods=["POST"])
@login_required
def delete_group():
    """
    Delete a group.

    This function deletes a group from the database based on the provided group ID.
    Only the owner of the group can delete it. If the current user is not the owner,
    a 403 Forbidden error is raised.

    Returns:
        A redirect response to the user's profile page with the current tab set to 2.

    Raises:
        403 Forbidden: If the current user is not the owner of the group.
    """
    data = request.get_json()
    group_id = data["groupId"]

    group = AttractionGroup.query.get(group_id)
    if group.owner != current_user.id:
        abort(403)

    db.session.delete(group)
    db.session.commit()

    # TODO: Fix the flash message
    flash(_("The list has been deleted."), "success")
    return redirect(url_for("auth.profile", current_tab=2))


@auth.route("/edit-group", methods=["POST"])
@login_required
def edit_group():
    """
    Edit a group's details.

    This function handles the editing of a group's details based on the form data submitted.
    It retrieves the group based on the provided group ID, checks if the current user is the owner of the group,
    and updates the group's title and visibility in the database.

    Returns:
        A redirect to the user's profile page with the updated group details.

    Raises:
        403: If the current user is not the owner of the group or if the group does not exist.
    """
    form = EditListForm()

    if form.validate_on_submit():
        group_id = form.group_id.data
        group = AttractionGroup.query.get(group_id)

    if (group.owner != current_user.id) or group is None:
        abort(403)

    group.title = form.name.data
    group.visibility = form.visibility.data
    db.session.commit()

    flash(_("The list has been updated."), "success")
    return redirect(url_for("auth.profile", current_tab=2))


@auth.route("/group-attractions/<group_id>", methods=["GET"])
@login_required
def get_group_attractions(group_id):
    """
    Retrieve the attractions associated with a specific attraction group.

    Args:
        group_id (int): The ID of the attraction group.

    Returns:
        flask.Response: A JSON response containing the attractions associated with the group.

    Raises:
        werkzeug.exceptions.NotFound: If the attraction group with the given ID does not exist.
    """
    group = AttractionGroup.query.get(group_id)
    if group is None:
        abort(404)

    return jsonify([attraction.to_dict() for attraction in group.grouped_attractions])
