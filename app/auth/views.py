from . import auth
from .forms import LoginForm, RegistrationForm, ProfileForm, SearchUsersForm
from .. import db
from ..models import User, Tag, UserTagPreference, Friendship, VisitedAttraction, Attraction, GroupedAttraction, AttractionGroup
from flask import render_template, request, redirect, url_for, session, flash, abort
from flask_login import login_user, logout_user, login_required, current_user
import json



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
		flash('User has been registrated.')
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
		flash('Invalid username or password.')
	return render_template('login.html', form=form)


@auth.route('/logout')
@login_required
def logout():
	logout_user()
	flash('You have been logged out.')
	return redirect(url_for('main.index'))





@auth.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    form = ProfileForm()
    tags = Tag.query.all()
    groupedattraction = GroupedAttraction.query.all()
    form.tag.choices = [(tag.id, tag.name) for tag in tags]

    if form.validate_on_submit():

        user = User.query.filter_by(email=form.email.data).first()


        if user:
            selected_tag_ids = form.tag.data


            UserTagPreference.query.filter_by(user_id=user.id).delete()

            for tag_id in selected_tag_ids:
                user_preference = UserTagPreference(user_id=user.id, tag_id=tag_id)
                db.session.add(user_preference)

            db.session.commit()
            flash('Your preferences have been updated!', 'success')
            return redirect(url_for('auth.profile'))  
        else:
            flash('User with provided email does not exist', 'error')

    
    user_tag_preferences = UserTagPreference.query.filter_by(user_id=current_user.id).all()
    user_preferences = [Tag.query.get(preference.tag_id).name for preference in user_tag_preferences]



    visited_attractions = [
        {
            'attraction': Attraction.query.get(attraction.attraction_id),
            'time_visited': attraction.time_visited
        }
        for attraction in VisitedAttraction.query.filter_by(user_id=current_user.id).all()
    ]


    user_groups = AttractionGroup.query.filter_by(owner=current_user.id).all()
    wishlist_attractions = [
        {
            'attraction': Attraction.query.get(attraction.id),
        }
        # looper gjennom attraction_group med index 0 (vil nok gi en error her om det er ingen grupper)
        for attraction in user_groups[0].grouped_attractions
    ]



    # points = sum(attraction['points'] for attraction in visited_attractions)
    points = sum(item['attraction'].points for item in visited_attractions)

    # Tabs for profile page sections, only one section should be active
    tabs = ['Wishlist Attractions', 'Visited Attractions', 'Profile']
    
    return render_template(
        'profile.html',
        form=form,
        tags=tags,
        user_preferences=user_preferences,
        wishlist_attractions=wishlist_attractions,
        visited_attractions=visited_attractions,
        number_of_wishlist_attractions=len(wishlist_attractions),
        number_of_visited_attractions=len(visited_attractions),
        points=points,
        tabs=tabs
)








'''
Friendship related routes
'''
@auth.route('/friends', methods=['GET', 'POST'])
@login_required
def friends():
    form = SearchUsersForm()
    search_text = form.search_text.data
    if form.validate_on_submit() and search_text:
        users = User.query.filter(User.username.contains(search_text)) \
            .filter(User.id != current_user.id).all()
    else:
        users = None
    
    users_requesting = User.query.join(User.initiated_friendships) \
                             .filter(Friendship.user_2 == current_user.id,
                                     Friendship.status == 'pending') \
                             .all()
    
    users_awaiting = User.query.join(User.received_friendships) \
                             .filter(Friendship.user_1 == current_user.id,
                                     Friendship.status == 'pending') \
                             .all()
                             
    friends = User.query.join(User.initiated_friendships) \
                   .filter(
                       (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
                       Friendship.status == 'accepted') \
                   .union(
                       User.query.join(User.received_friendships) \
                           .filter(
                               (Friendship.user_1 == current_user.id) | (Friendship.user_2 == current_user.id),
                               Friendship.status == 'accepted') \
                           ).filter(User.id != current_user.id).all()
                             
    return render_template('friends.html', form=form,
                           users=users,
                           users_requesting=users_requesting, 
                           users_awaiting=users_awaiting,
                           friends=friends)


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
    flash('The friend request has been sent.')
    return redirect(url_for('auth.friends'))


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
    flash('The friend request has been accepted.')
    return redirect(url_for('auth.friends'))


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
    flash('The friend request has been ended.')
    return redirect(url_for('auth.friends'))


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
    flash('The friend has been removed.')
    return redirect(url_for('auth.friends'))
