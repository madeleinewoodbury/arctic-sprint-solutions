from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from app import db


class Achievement(db.Model):
    __tablename__ = 'Achievement'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text)
    points_needed = db.Column(db.Integer, nullable=False)


class AgeGroup(db.Model):
    __tablename__ = 'AgeGroup'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)


class Attraction(db.Model):
    __tablename__ = 'Attraction'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    city = db.Column(db.Integer, db.ForeignKey('City.id'), nullable=False)
    location = db.Column(db.String(255))
    description = db.Column(db.Text)
    image = db.Column(db.String(255))
    points = db.Column(db.Integer)

    city_rel = db.relationship(
        'City', backref=db.backref('attractions', lazy=True))


class AttractionAgeGroup(db.Model):
    __tablename__ = 'AttractionAgeGroup'
    attraction_id = db.Column(db.Integer, db.ForeignKey(
        'Attraction.id'), primary_key=True)
    age_group_id = db.Column(db.Integer, db.ForeignKey(
        'AgeGroup.id'), primary_key=True)


class AttractionCategory(db.Model):
    __tablename__ = 'AttractionCategory'
    category_id = db.Column(db.Integer, db.ForeignKey(
        'Category.id'), primary_key=True)
    attraction_id = db.Column(db.Integer, db.ForeignKey(
        'Attraction.id'), primary_key=True)


class AttractionGroup(db.Model):
    __tablename__ = 'AttractionGroup'
    id = db.Column(db.Integer, primary_key=True)
    owner = db.Column(db.Integer, db.ForeignKey('User.id'), nullable=False)
    title = db.Column(db.String(50), nullable=False)
    visibility = db.Column(db.String(50), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)


class AttractionTag(db.Model):
    __tablename__ = 'AttractionTag'
    tag_id = db.Column(db.Integer, db.ForeignKey('Tag.id'), primary_key=True)
    attraction_id = db.Column(db.Integer, db.ForeignKey(
        'Attraction.id'), primary_key=True)


class Category(db.Model):
    __tablename__ = 'Category'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)


class City(db.Model):
    __tablename__ = 'City'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text)
    image = db.Column(db.String(255))


class Friendship(db.Model):
    __tablename__ = 'Friendship'
    user_1 = db.Column(db.Integer, db.ForeignKey('User.id'), primary_key=True)
    user_2 = db.Column(db.Integer, db.ForeignKey('User.id'), primary_key=True)
    status = db.Column(db.String(50))


class GroupedAttraction(db.Model):
    __tablename__ = 'GroupedAttraction'
    group_id = db.Column(db.Integer, db.ForeignKey(
        'AttractionGroup.id'), primary_key=True)
    attraction_id = db.Column(db.Integer, db.ForeignKey(
        'Attraction.id'), primary_key=True)


class Language(db.Model):
    __tablename__ = 'Language'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))


class Tag(db.Model):
    __tablename__ = 'Tag'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)


class User(db.Model):
    __tablename__ = 'User'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    first_name = db.Column(db.String(50))
    last_name = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(255), nullable=False)
    role = db.Column(db.Integer, db.ForeignKey('UserRole.id'))
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    role_rel = db.relationship(
        'UserRole', backref=db.backref('users', lazy=True))


class UserAchievement(db.Model):
    __tablename__ = 'UserAchievement'
    achievement_id = db.Column(db.Integer, db.ForeignKey(
        'Achievement.id'), primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('User.id'), primary_key=True)
    time_achieved = db.Column(db.DateTime, default=datetime.utcnow)


class UserRole(db.Model):
    __tablename__ = 'UserRole'
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30))
    is_admin = db.Column(db.Boolean, default=False)


class VisitedAttraction(db.Model):
    __tablename__ = 'VisitedAttraction'
    user_id = db.Column(db.Integer, db.ForeignKey('User.id'), primary_key=True)
    attraction_id = db.Column(db.Integer, db.ForeignKey(
        'Attraction.id'), primary_key=True)
    time_visited = db.Column(db.DateTime, default=datetime.utcnow)
