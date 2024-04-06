from . import auth
from .forms import LoginForm, RegistrationForm, ProfileForm, SearchUsersForm
from .. import db
from ..models import User, Tag, UserTagPreference, Friendship, VisitedAttraction, Attraction, Badge, BadgeRequirement, UserBadge, AttractionTag
from flask import render_template, request, redirect, url_for, session, flash, abort
from flask_login import login_user, logout_user, login_required, current_user
from flask_babel import _
from datetime import datetime

@auth.route('/register', methods=['GET', 'POST'])
def register() -> 'html':
	form = RegistrationForm()
	if form.validate_on_submit():
		user = User(
            username = form.username.data,
            first_name = form.first_name.data,
            last_name = form.last_name.data,
            email = form.email.data
		)
		user.set_password(form.password.data)
		db.session.add(user)
		db.session.commit()
		flash(_('User has been registrated.'))
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


def update_user_preferences(preferences_form, activeTab):
    # Get the user based on the provided email
    user = User.query.filter_by(email=preferences_form.email.data).first()

    # Update user preferences if user is found
    if user:
        selected_tag_ids = preferences_form.tag.data

        # Delete existing user preferences
        UserTagPreference.query.filter_by(user_id=user.id).delete()

        # Create new user preferences
        for tag_id in selected_tag_ids:
            user_preference = UserTagPreference(user_id=user.id, tag_id=tag_id)
            db.session.add(user_preference)

        db.session.commit()
        flash(_('Your preferences have been updated!'), 'success')
        return redirect(url_for('auth.profile', current_tab=activeTab))  # Redirect to avoid form resubmission
    else:
        flash(_('User with provided email does not exist'), 'error')


def get_user_preferences():
    user_tag_preferences = UserTagPreference.query.filter_by(user_id=current_user.id).all()
    user_preferences = [Tag.query.get(preference.tag_id).name for preference in user_tag_preferences]
    
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
                       (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
                       Friendship.status == 'accepted') \
                   .union(
                       User.query.join(User.received_friendships) \
                           .filter(
                               (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
                               Friendship.status == 'accepted') \
                           ).filter(User.id != current_user.id).all()
    
    
    friends = []
    # Get attraction info from friend
    for user in users:
        friend = {
               'user': user,
               'visited': get_visited_attractions(user.id)
         }  
        friend['points'] = sum(item['attraction'].points for item in friend['visited'])
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
        requirements = BadgeRequirement.query.filter_by(badge_id=badge.id).all()
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
    user_progress = sorted(user_progression, key=lambda x: x['total_visited_count'], reverse=True)

    return user_progress


@auth.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    current_tab = request.args.get('current_tab')
    activeTab = current_tab if current_tab else 0

    # Visited Attractions Tab
    visited_attractions = get_visited_attractions(current_user.id)
    points = sum(item['attraction'].points for item in visited_attractions)

    # Profile Tab
    preferences_form = ProfileForm()
    tags = Tag.query.all()
    preferences_form.tag.choices = [(tag.id, tag.name) for tag in tags]
    
    if preferences_form.validate_on_submit():
        activeTab = 1
        update_user_preferences(preferences_form, activeTab)

    # Fetch the user preferences from the database
    user_preferences = get_user_preferences()

    # Friends Tab
    friends_form = SearchUsersForm()
    search_text = friends_form.search_text.data
    users = None

    if friends_form.validate_on_submit() and search_text:
        users = search_users(search_text)
        activeTab = 2

    users_requesting = get_users_requesting()
    users_awaiting = get_users_awaiting()
    friends = get_firends()

    # Badges tab
    # Calculating badge progress for all badges.
    badge_progress = get_user_badge_progress(current_user.id)

    # Tabs for profile page sections, only one section should be active
    tabs = ['Visited Attractions', 'Profile', 'Friends', 'Badges']

    return render_template(
        'profile.html',
        preferences_form=preferences_form,
        tags=tags,
        user_preferences=user_preferences,
        visited_attractions=visited_attractions,
        number_of_visited_attractions=len(visited_attractions),
        points=points,
        tabs=tabs,
        friends_form=friends_form,
        users=users,
        users_requesting=users_requesting, 
        users_awaiting=users_awaiting,
        friends=friends,
        badge_progress=badge_progress,
        activeTab=activeTab
    )

@auth.route('/friends/send-request/<int:user_id>', methods=['POST'])
@login_required
def send_friend_request(user_id):
    
    friendship = Friendship(
        user_1 = current_user.id,
        user_2 = user_id,
        status = 'pending'
        )
    
    db.session.add(friendship)
    db.session.commit()
    flash(_('The friend request has been sent.'))
    return redirect(url_for('auth.profile', current_tab=2))


@auth.route('/friends/accept-request/<int:user_id>', methods=['POST'])
@login_required
def accept_friend_request(user_id):
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
        Friendship.status == 'pending'
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted

    friendship.status = 'accepted'
    db.session.commit()
    flash(_('The friend request has been accepted.'))
    return redirect(url_for('auth.profile', current_tab=2))


@auth.route('/friends/remove-request/<int:user_id>', methods=['POST'])
@login_required
def remove_friend_request(user_id):
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
        Friendship.status == 'pending'
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted
    
    db.session.delete(friendship) 
    db.session.commit()
    flash(_('The friend request has been ended.'))
    return redirect(url_for('auth.profile', current_tab=2))


@auth.route('/friends/remove-friend/<int:user_id>', methods=['POST'])
@login_required
def remove_friend(user_id):
    friendship = Friendship.query.filter(
        (Friendship.user_1 == user_id) | (Friendship.user_2 == user_id),
        (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
        Friendship.status == 'accepted'
    ).first()

    if friendship is None:
        abort(404)  # Friendship request not found or already accepted
    
    db.session.delete(friendship) 
    db.session.commit()
    flash(_('The friend has been removed.'))
    return redirect(url_for('auth.profile', current_tab=2))

@auth.route('/friend/profile/<int:user_id>', methods=['GET'])
@login_required
def friend_profile(user_id):
    friend = User.query.get(user_id)

    if friend is None:
        abort(404)

    visited_attractions = get_visited_attractions(user_id)
    points = sum(item['attraction'].points for item in visited_attractions)

    return render_template(
         'friendProfile.html', 
         friend=friend, 
         visited_attractions=visited_attractions, 
         number_of_visited_attractions=len(visited_attractions),
         points=points)