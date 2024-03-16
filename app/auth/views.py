from . import auth
from .forms import LoginForm, RegistrationForm, ProfileForm
from .. import db
from ..models import User, Tag, UserTagPreference
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

    user_tag_preferences = UserTagPreference.query.filter_by(user_id=current_user.id).all()
    selected_tag_ids = [preference.tag_id for preference in user_tag_preferences]
    form.tag_preferences.choices = [(tag.id, tag.name) for tag in tags if tag.id in selected_tag_ids]

    selected_tags = [tag.name for tag in tags if tag.id in selected_tag_ids]

    if form.validate_on_submit():
        current_user.email = form.email.data
        db.session.commit()
        flash('Your profile has been updated!', 'success')
        return redirect(url_for('auth.profile'))

    form.email.data = current_user.email
    return render_template('profile.html', form=form, tags=tags, selected_tags=selected_tags)
