from . import auth
from .forms import LoginForm, RegistrationForm, ProfileForm, SearchUsersForm
from .. import db
from ..models import User, Tag, UserTagPreference, Friendship
from flask import render_template, request, redirect, url_for, session, flash
from flask_login import login_user, logout_user, login_required, current_user



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


#@auth.route('/profile', methods=['GET', 'POST'])
#def profile() -> 'html':
#	form = ProfileForm()
#	tags = Tag.query.all()
#	return render_template('profile.html', form=form, tags=tags)


@auth.route('/profile', methods=['GET', 'POST'])
@login_required
def profile():
    form = ProfileForm()
    tags = Tag.query.all()
    form.tag.choices = [(tag.id, tag.name) for tag in tags]

    if form.validate_on_submit():
        # Get the user based on the provided email
        user = User.query.filter_by(email=form.email.data).first()

        # Update user preferences if user is found
        if user:
            selected_tag_ids = form.tag.data

            # Delete existing user preferences
            UserTagPreference.query.filter_by(user_id=user.id).delete()

            # Create new user preferences
            for tag_id in selected_tag_ids:
                user_preference = UserTagPreference(user_id=user.id, tag_id=tag_id)
                db.session.add(user_preference)

            db.session.commit()
            flash('Your preferences have been updated!', 'success')
            return redirect(url_for('auth.profile'))  # Redirect to avoid form resubmission
        else:
            flash('User with provided email does not exist', 'error')

    # Fetch the user preferences from the database
    user_tag_preferences = UserTagPreference.query.filter_by(user_id=current_user.id).all()
    user_preferences = [Tag.query.get(preference.tag_id).name for preference in user_tag_preferences]



    return render_template('profile.html', form=form, tags=tags, user_preferences=user_preferences)







'''
FRIENDSHIP STUFF
'''

@auth.route('/friends', methods=['GET', 'POST'])
@login_required
def friends():
    form = SearchUsersForm()
    search_text = form.search_text.data
    if form.validate_on_submit() and search_text:
        users = User.query.filter(User.username.contains(search_text)).all()
        return render_template('friends.html', form=form, users=users)
    return render_template('friends.html', form=form)



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
    return redirect('auth.friends')

