import math
from . import auth
from .forms import LoginForm, RegistrationForm, SearchUsersForm, PasswordResetRequestForm, PasswordResetForm, UpdateProfileForm, UpdatePasswordForm, UpdatePreferencesForm
from .. import db
from ..models import *
from flask import render_template, request, redirect, url_for, session, flash, abort
from flask_login import login_user, logout_user, login_required, current_user
from flask_babel import _
from datetime import datetime
from ..email import send_email


@auth.route('/register', methods=['GET', 'POST'])
def register() -> 'html':
    form = RegistrationForm()
    form.country.choices = [(country.id, country.name)
                            for country in Country.query.all()]

    if form.validate_on_submit():
        user = User(
            username=form.username.data,
            first_name=form.first_name.data,
            last_name=form.last_name.data,
            email=form.email.data,
            country_id=form.country.data
        )
        user.set_password(form.password.data)
        db.session.add(user)
        db.session.commit()
        flash(_('User has been registered.'))
        return redirect(url_for('auth.login'))

    return render_template('register.html', form=form)


@auth.route('/login', methods=['GET', 'POST'])
def login() -> 'html':
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user is not None and user.check_password(form.password.data):
            login_user(user, form.remember_me.data)
            return redirect(url_for('attractions.get_attractions'))
        flash(_('Invalid username or password.'))
    return render_template('login.html', form=form)


@auth.route('/logout')
@login_required
def logout():
    logout_user()
    flash(_('You have been logged out.'))
    return redirect(url_for('main.index'))


@auth.route('/reset', methods=['GET', 'POST'])
def password_reset_request():
    if current_user.is_authenticated:
        return redirect(url_for('attractions.get_attractions'))
    form = PasswordResetRequestForm()
    if request.method == 'POST':
        user = User.query.filter_by(email=form.email.data).first()
        if user:
            token = user.generate_reset_token()
            send_email(user.email, 'Reset your password', 'email/reset_password',
                       user=user, token=token)
            flash(
                _("An email with instructions to reset your password has been sent to you."))
            return (redirect(url_for('auth.login')))
    return render_template('reset_password_request.html', form=form)


@auth.route('/reset/<token>', methods=['GET', 'POST'])
def password_reset(token):
    if current_user.is_authenticated:
        return redirect(url_for('attractions.get_attractions'))
    form = PasswordResetForm()
    if form.validate_on_submit():
        if User.reset_password(token, form.password.data):
            db.session.commit()
            flash('Your password has been updated.')
            return redirect(url_for('auth.login'))
        else:
            return (redirect(url_for('auth.login')))
    return render_template('reset_password.html', form=form)

def update_user_profile_OLD(profile_form, activeTab):
    # Get the user based on the provided email
    user = User.query.filter_by(email=profile_form.email.data).first()

    if user:
        selected_tag_ids = profile_form.tag.data
        selected_category_ids = profile_form.category.data
        selected_age_group_ids = profile_form.age_group.data

        # Ensure transactional integrity
        try:
            UserTagPreference.query.filter_by(user_id=user.id).delete()
            UserCategoryPreference.query.filter_by(user_id=user.id).delete()
            UserAgeGroupPreference.query.filter_by(user_id=user.id).delete()

            db.session.flush()

            for tag_id in selected_tag_ids:
                user_preference = UserTagPreference(
                    user_id=user.id, tag_id=tag_id)
                db.session.add(user_preference)

            for category_id in selected_category_ids:
                user_preference = UserCategoryPreference(
                    user_id=user.id, category_id=category_id)
                db.session.add(user_preference)

            for age_group_id in selected_age_group_ids:
                user_preference = UserAgeGroupPreference(
                    user_id=user.id, age_group_id=age_group_id)
                db.session.add(user_preference)

            user.country_id = profile_form.country.data

            db.session.commit()
            flash(_('Your preferences have been updated!'), 'success')
            return redirect(url_for('auth.profile', current_tab=activeTab))
        except Exception as e:
            db.session.rollback()
            flash(_('Error updating user preferences: ') + str(e), 'error')
    else:
        flash(_('User with provided email does not exist'), 'error')
        
        
def update_user_profile(profile_form, activeTab):
    # Update user profile
    user = User.query.filter_by(id=current_user.id).first()
    user.username = profile_form.username.data
    user.first_name = profile_form.first_name.data
    user.last_name = profile_form.last_name.data
    user.email = profile_form.email.data
    user.country_id = profile_form.country.data
    
    db.session.commit()
    profile_form.is_active.data = 'false'
    flash(_('Your profile has been updated!'), 'success')
    return redirect(url_for('auth.profile', current_tab=activeTab))  # Redirect to avoid form resubmission


def update_user_password(password_form, activeTab):
    user = User.query.filter_by(id=current_user.id).first()
    user.set_password(password_form.password.data)
    db.session.commit()
    password_form.is_active.data = 'false'
    flash(_('Your password has been updated!'), 'success')
    return redirect(url_for('auth.profile', current_tab=activeTab))  # Redirect to avoid form resubmission


def update_user_preferences(preferences_form, activeTab):
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
            user_preference = UserTagPreference(
                user_id=current_user.id, tag_id=tag_id)
            db.session.add(user_preference)
            
        for category_id in selected_category_ids:
            user_preference = UserCategoryPreference(
                user_id=current_user.id, category_id=category_id)
            db.session.add(user_preference)
            
        for age_group_id in selected_age_group_ids:
            user_preference = UserAgeGroupPreference(
                user_id=current_user.id, age_group_id=age_group_id)
            db.session.add(user_preference)

        db.session.commit()
        flash(_('Your preferences have been updated!'), 'success')
  
    except Exception as e:
        db.session.rollback()
        flash(_('Error updating user preferences: ') + str(e), 'error')
    
    finally:
        preferences_form.is_active.data = 'false'
        return redirect(url_for('auth.profile', current_tab=activeTab))

    
def get_user_preferences():
    # Fetch user's tag preferences
    user_tag_preferences = UserTagPreference.query.filter_by(
        user_id=current_user.id).all()
    tag_preferences = [Tag.query.get(
        preference.tag_id).name for preference in user_tag_preferences]

    # Fetch user's category preferences
    user_category_preferences = UserCategoryPreference.query.filter_by(
        user_id=current_user.id).all()
    category_preferences = [Category.query.get(
        preference.category_id).name for preference in user_category_preferences]

    # Fetch user's age group preferences
    user_age_group_preferences = UserAgeGroupPreference.query.filter_by(
        user_id=current_user.id).all()
    age_group_preferences = [AgeGroup.query.get(
        preference.age_group_id).name for preference in user_age_group_preferences]

    user_preferences = {
        'tags': tag_preferences,
        'categories': category_preferences,
        'age_groups': age_group_preferences
    }

    return user_preferences


def search_users(search_text):
    users = User.query.filter(User.username.contains(search_text)) \
        .filter(User.id != current_user.id).all()

    return users


def get_users_requesting():
    users_requesting = User.query.join(User.initiated_friendships) \
        .filter(Friendship.user_2 == current_user.id,
                Friendship.status == 'pending') \
        .all()

    return users_requesting


def get_users_awaiting():
    users_awaiting = User.query.join(User.received_friendships) \
        .filter(Friendship.user_1 == current_user.id,
                Friendship.status == 'pending') \
        .all()

    return users_awaiting


def get_firends():
    users = User.query.join(User.initiated_friendships) \
        .filter(
        (Friendship.user_1 == current_user.id) | (
            Friendship.user_2 == current_user.id),
        Friendship.status == 'accepted') \
        .union(
        User.query.join(User.received_friendships)
        .filter(
            (Friendship.user_1 == current_user.id) | (
                Friendship.user_2 == current_user.id),
            Friendship.status == 'accepted')
    ).filter(User.id != current_user.id).all()

    friends = []
    # Get attraction info from friend
    for user in users:
        friend = {
            'user': user,
            'visited': get_visited_attractions(user.id),
            #    'country': Country.query.get(user.country_id)
        }
        friend['points'] = sum(
            item['attraction'].points for item in friend['visited'])
        friend['level'] = get_user_level(friend['points']).get('current_level')
        friends.append(friend)

    friends = sorted(friends, key=lambda x: x['points'], reverse=True)
    return friends


def get_visited_attractions(user_id):
    visited_attractions = [
        {
            'attraction': Attraction.query.get(attraction.attraction_id),
            'time_visited': attraction.time_visited.strftime("%d-%m-%Y")
        }
        for attraction in VisitedAttraction.query.filter_by(user_id=user_id).all()
    ]

    return visited_attractions


def get_user_badge_progress(user_id):
    badges = Badge.query.all()
    user_progression = []

    for badge in badges:
        # Hent nødvendige tags for denne badgen
        total_visited_count = 0
        requirements = BadgeRequirement.query.filter_by(
            badge_id=badge.id).all()
        badge_progress = {
            'badge_name': badge.name,
            'tags_progress': [],
            'description': badge.description,
            'total_visited_count': 0
        }

        for req in requirements:
            # Finn navnet på taggen
            tag = Tag.query.get(req.tag_id)
            tag_name = tag.name if tag else 'Unknown Tag'

            # Telle antall besøkte attraksjoner som matcher denne taggen
            visited_count = db.session.query(db.func.count(VisitedAttraction.attraction_id)
                                             ).join(AttractionTag, VisitedAttraction.attraction_id == AttractionTag.attraction_id
                                                    ).filter(VisitedAttraction.user_id == user_id, AttractionTag.tag_id == req.tag_id
                                                             ).scalar() or 0

            # Oppdaterer total_visited_count
            total_visited_count += visited_count

            badge_progress['tags_progress'].append({
                'tag_name': tag_name,
                'visited_count': visited_count,
                'required_count': req.quantity_required
            })

        badge_progress['total_visited_count'] = total_visited_count
        user_progression.append(badge_progress)

    # Sorterer basert på total_visited_count, fra høyeste til laveste slik at badgen man har høyest progresjon på vises først
    user_progress = sorted(
        user_progression, key=lambda x: x['total_visited_count'], reverse=True)

    return user_progress


def get_user_level(points):
    BASE_POINTS = 42
    GROWTH_RATE = 1.05

    current_level = 1
    points_required = BASE_POINTS
    points_remaining = points

    while points_remaining >= points_required:
        points_remaining -= points_required
        current_level += 1
        points_required = int((points_required + BASE_POINTS)
                              * GROWTH_RATE - points_required)

    points_missing = points_required - points_remaining

    level = {
        "current_level": current_level,
        "points_required": points_required,
        "points_missing": points_missing,
        "progress": points_remaining
    }

    return level


@auth.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    current_tab = request.args.get('current_tab')
    activeTab = current_tab if current_tab else 0

    # Visited Attractions Tab
    visited_attractions = get_visited_attractions(current_user.id)
    points = sum(item['attraction'].points for item in visited_attractions)
    level = get_user_level(points)

    # Profile Tab
    profile_form = UpdateProfileForm()
    password_form = UpdatePasswordForm()
    preferences_form = UpdatePreferencesForm()
    profile_form.country.choices = [(country.id, country.name) for country in Country.query.all()]
    preferences_form.category.choices = [(category.id, category.name) for category in Category.query.all()]
    preferences_form.age_group.choices = [(age_group.id, age_group.name) for age_group in AgeGroup.query.all()]
    preferences_form.tag.choices = [(tag.id, tag.name) for tag in Tag.query.all()]
    
    profile_form.is_active.data = 'false'
    password_form.is_active.data = 'false'
    preferences_form.is_active.data = 'false'
    
    if password_form.update_password.data:
        activeTab = 1
        password_form.is_active.data = 'true'
        if password_form.validate_on_submit():
            print("PASSWORD FORM SUCCESS")
            update_user_password(password_form, activeTab)
        
    if preferences_form.update_preferences.data:
        activeTab = 1
        preferences_form.is_active.data = 'true'
        if preferences_form.validate_on_submit():
            print("PREFERENCES FORM SUCCESS")
            update_user_preferences(preferences_form, activeTab)
 
    if profile_form.update_profile.data:
        activeTab = 1
        profile_form.is_active.data = 'true'
        if profile_form.validate_on_submit():
            print("PROFILE FORM SUCCESS")
            update_user_profile(profile_form, activeTab)
    
    else:
        # set current user preferences
        preferences_form.category.data = [category.category_id for category in current_user.category_preferences]
        preferences_form.age_group.data = [age_group.age_group_id for age_group in current_user.age_group_preferences]
        preferences_form.tag.data = [tag.tag_id for tag in current_user.tag_preferences]   

        # Prepopulate profile form fields
        profile_form.username.data = current_user.username
        profile_form.first_name.data = current_user.first_name
        profile_form.last_name.data = current_user.last_name
        profile_form.email.data = current_user.email
        profile_form.country.data = current_user.country_id
        
    print(f'PROFILE: {profile_form.is_active.data}')
    print(f'PASSWORD: {password_form.is_active.data}')
    print(f'PREFERENCES: {preferences_form.is_active.data}')
        
    # Fetch the user preferences from the database
    user_preferences = get_user_preferences()

    # Friends Tab
    friends_form = SearchUsersForm()
    search_text = friends_form.search_text.data
    users = None

    if friends_form.validate_on_submit():
        users = search_users(search_text)
        activeTab = 3

    users_requesting = get_users_requesting()
    users_awaiting = get_users_awaiting()
    friends = get_firends()

    # Badges tab
    # Calculating badge progress for all badges.
    badge_progress = get_user_badge_progress(current_user.id)

    # Wishlist Tab
    user_wishlist = AttractionGroup.query.filter_by(
        owner=current_user.id).first()
    wishlist_attractions = []

    if user_wishlist:
        wishlist_attractions = [
            {
                'attraction': Attraction.query.get(attraction.id)
            }
            for attraction in user_wishlist.grouped_attractions
        ]

    # Tabs for profile page sections, only one section should be active
    tabs = ['Visited Attractions', 'Profile', 'Wishlist', 'Friends', 'Badges']

    return render_template(
        'profile.html',
        profile_form=profile_form,
        password_form=password_form,
        preferences_form=preferences_form,
        user_preferences=user_preferences,
        visited_attractions=visited_attractions,
        wishlist_attractions=wishlist_attractions,
        number_of_visited_attractions=len(visited_attractions),
        number_of_wishlist_attractions=len(wishlist_attractions),
        points=points,
        tabs=tabs,
        friends_form=friends_form,
        users=users,
        users_requesting=users_requesting,
        users_awaiting=users_awaiting,
        friends=friends,
        badge_progress=badge_progress,
        activeTab=activeTab,
        level=level
    )


@auth.route('/friends/send-request/<int:user_id>', methods=['POST'])
@login_required
def send_friend_request(user_id):

    friendship = Friendship(
        user_1=current_user.id,
        user_2=user_id,
        status='pending'
    )

    db.session.add(friendship)
    db.session.commit()
    flash(_('The friend request has been sent.'))
    return redirect(url_for('auth.profile', current_tab=3))


@auth.route('/friends/accept-request/<int:user_id>', methods=['POST'])
@login_required
def accept_friend_request(user_id):
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (
            Friendship.user_2 == current_user.id),
        Friendship.status == 'pending'
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted

    friendship.status = 'accepted'
    db.session.commit()
    flash(_('The friend request has been accepted.'))
    return redirect(url_for('auth.profile', current_tab=3))


@auth.route('/friends/remove-request/<int:user_id>', methods=['POST'])
@login_required
def remove_friend_request(user_id):
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (
            Friendship.user_2 == current_user.id),
        Friendship.status == 'pending'
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted

    db.session.delete(friendship)
    db.session.commit()
    flash(_('The friend request has been ended.'))
    return redirect(url_for('auth.profile', current_tab=3))


@auth.route('/friends/remove-friend/<int:user_id>', methods=['POST'])
@login_required
def remove_friend(user_id):
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (
            Friendship.user_2 == current_user.id),
        Friendship.status == 'accepted'
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted

    db.session.delete(friendship)
    db.session.commit()
    flash(_('The friend has been removed.'))
    return redirect(url_for('auth.profile', current_tab=3))


@auth.route('/friend/profile/<int:user_id>', methods=['GET'])
@login_required
def friend_profile(user_id):
    friend = User.query.get(user_id)

    if friend is None:
        abort(404)

    visited_attractions = get_visited_attractions(user_id)
    points = sum(item['attraction'].points for item in visited_attractions)
    level = get_user_level(points)

    return render_template(
        'friendProfile.html',
        friend=friend,
        visited_attractions=visited_attractions,
        number_of_visited_attractions=len(visited_attractions),
        points=points,
        level=level
    )
