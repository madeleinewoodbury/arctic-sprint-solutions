from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from app import db, login_manager
from flask_login import UserMixin, AnonymousUserMixin, current_user
from werkzeug.security import check_password_hash, generate_password_hash


class Achievement(db.Model):
	__tablename__ = 'achievement'
	id = db.Column(db.Integer, primary_key=True)
	title = db.Column(db.String(50), nullable=False)
	description = db.Column(db.Text)
	points_needed = db.Column(db.Integer, nullable=False)


class AgeGroup(db.Model):
	__tablename__ = 'ageGroup'
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(50), nullable=False)


class Attraction(db.Model):
	__tablename__ = 'attraction'
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(50), nullable=False)
	city = db.Column(db.Integer, db.ForeignKey('city.id'), nullable=False)
	location = db.Column(db.String(255))
	description = db.Column(db.Text)
	image = db.Column(db.String(255))
	points = db.Column(db.Integer)

	city_rel = db.relationship(
		'City', backref=db.backref('attractions', lazy=True))


class AttractionAgeGroup(db.Model):
	__tablename__ = 'attractionAgeGroup'
	attraction_id = db.Column(db.Integer, db.ForeignKey(
		'Attraction.id'), primary_key=True)
	age_group_id = db.Column(db.Integer, db.ForeignKey(
		'AgeGroup.id'), primary_key=True)


class AttractionCategory(db.Model):
	__tablename__ = 'attractionCategory'
	category_id = db.Column(db.Integer, db.ForeignKey(
		'category.id'), primary_key=True)
	attraction_id = db.Column(db.Integer, db.ForeignKey(
		'attraction.id'), primary_key=True)


class AttractionGroup(db.Model):
	__tablename__ = 'attractionGroup'
	id = db.Column(db.Integer, primary_key=True)
	owner = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
	title = db.Column(db.String(50), nullable=False)
	visibility = db.Column(db.String(50), nullable=False)
	created_at = db.Column(db.DateTime, default=datetime.utcnow)


class AttractionTag(db.Model):
	__tablename__ = 'attractionTag'
	tag_id = db.Column(db.Integer, db.ForeignKey('tag.id'), primary_key=True)
	attraction_id = db.Column(db.Integer, db.ForeignKey(
		'attraction.id'), primary_key=True)


class Category(db.Model):
	__tablename__ = 'category'
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(50), nullable=False)


class City(db.Model):
	__tablename__ = 'city'
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(50), nullable=False)
	description = db.Column(db.Text)
	image = db.Column(db.String(255))


class Friendship(db.Model):
	__tablename__ = 'friendship'
	user_1 = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
	user_2 = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
	status = db.Column(db.String(50))


class GroupedAttraction(db.Model):
	__tablename__ = 'groupedAttraction'
	group_id = db.Column(db.Integer, db.ForeignKey(
		'attractionGroup.id'), primary_key=True)
	attraction_id = db.Column(db.Integer, db.ForeignKey(
		'attraction.id'), primary_key=True)


class Language(db.Model):
	__tablename__ = 'language'
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(50))


class Tag(db.Model):
	__tablename__ = 'tag'
	id = db.Column(db.Integer, primary_key=True)
	name = db.Column(db.String(50), nullable=False)


class User(UserMixin, db.Model):
	__tablename__ = 'user'
	id = db.Column(db.Integer, primary_key=True)
	username = db.Column(db.String(50))
	first_name = db.Column(db.String(50))
	last_name = db.Column(db.String(50))
	email = db.Column(db.String(50), unique=True)
	password = db.Column(db.String(255), nullable=False)
	role = db.Column(db.Integer, db.ForeignKey('userRole.id'))
	created_at = db.Column(db.DateTime, default=datetime.utcnow)

	role_rel = db.relationship(
		'UserRole', backref=db.backref('users', lazy=True))
	
	def __init__(self, **kwargs):
		super(User, self).__init__(**kwargs)

	def __repr__(self):
		return '<User {}>'.format(self.username)

	def set_password(self, password):
		self.password = generate_password_hash(password)

	def check_password(self, password):
		return check_password_hash(self.password, password)

	
class Anonymous(AnonymousUserMixin):
    def __init__(self):
        self.id = None


@login_manager.user_loader
def load_user(user_id):
	return User.query.get(int(user_id))


class UserAchievement(db.Model):
	__tablename__ = 'userAchievement'
	achievement_id = db.Column(db.Integer, db.ForeignKey(
		'achievement.id'), primary_key=True)
	user_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
	time_achieved = db.Column(db.DateTime, default=datetime.utcnow)


class UserRole(db.Model):
	__tablename__ = 'userRole'
	id = db.Column(db.Integer, primary_key=True)
	title = db.Column(db.String(30))
	is_admin = db.Column(db.Boolean, default=False)


class VisitedAttraction(db.Model):
	__tablename__ = 'visitedAttraction'
	user_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
	attraction_id = db.Column(db.Integer, db.ForeignKey(
		'attraction.id'), primary_key=True)
	time_visited = db.Column(db.DateTime, default=datetime.utcnow)
