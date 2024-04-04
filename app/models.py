import hashlib
from flask import request
from flask_sqlalchemy import SQLAlchemy
from flask import request
from datetime import datetime
from app import db, login_manager
from flask_login import UserMixin, AnonymousUserMixin, current_user
from werkzeug.security import check_password_hash, generate_password_hash


class Achievement(db.Model):
    __tablename__ = "achievement"
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text)
    points_needed = db.Column(db.Integer, nullable=False)


class AgeGroup(db.Model):
    __tablename__ = "ageGroup"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)

    @property
    def attraction_count(self):
        return Attraction.query.filter(
            Attraction.age_groups.any(AgeGroup.id == self.id)
        ).count()

    def __repr__(self) -> str:
        return self.name


class Attraction(db.Model):
    __tablename__ = "attraction"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    city = db.Column(db.Integer, db.ForeignKey("city.id"), nullable=False)
    location = db.Column(db.String(255))
    description = db.Column(db.Text)
    image = db.Column(db.String(255))
    points = db.Column(db.Integer)
    city_rel = db.relationship("City", backref=db.backref("attractions", lazy=True))
    age_groups = db.relationship(
        "AgeGroup",
        secondary="attractionAgeGroup",
        backref=db.backref("attractions", lazy=True),
    )
    category = db.relationship(
        "Category",
        secondary="attractionCategory",
        backref=db.backref("attractions", lazy=True),
    )
    tags = db.relationship(
        "Tag", secondary="attractionTag", backref=db.backref("attractions", lazy=True)
    )
    visited_by = db.relationship("VisitedAttraction", back_populates="attraction")

    def __repr__(self) -> str:
        return self.name

    @property
    def visit_count(self):
        return VisitedAttraction.query.filter_by(attraction_id=self.id).count()

    def to_dict(self):
        data = {
            column.name: getattr(self, column.name) for column in self.__table__.columns
        }
        data["age_groups"] = [age_group.name for age_group in self.age_groups]
        data["category"] = [category.name for category in self.category]
        data["tags"] = [tag.name for tag in self.tags]
        return data


class AttractionAgeGroup(db.Model):
    __tablename__ = "attractionAgeGroup"
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )
    age_group_id = db.Column(db.Integer, db.ForeignKey("ageGroup.id"), primary_key=True)


class AttractionCategory(db.Model):
    __tablename__ = "attractionCategory"
    category_id = db.Column(db.Integer, db.ForeignKey("category.id"), primary_key=True)
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )


class AttractionGroup(db.Model):
    __tablename__ = "attractionGroup"
    id = db.Column(db.Integer, primary_key=True)
    owner = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    title = db.Column(db.String(50), nullable=False)
    visibility = db.Column(db.String(50), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)


class AttractionTag(db.Model):
    __tablename__ = "attractionTag"
    tag_id = db.Column(db.Integer, db.ForeignKey("tag.id"), primary_key=True)
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )


class Category(db.Model):
    __tablename__ = "category"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)

    @property
    def attraction_count(self):
        return Attraction.query.filter(
            Attraction.category.any(Category.id == self.id)
        ).count()

    def __repr__(self) -> str:
        return self.name


class City(db.Model):
    __tablename__ = "city"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text)
    image = db.Column(db.String(255))

    @property
    def attractions_count(self):
        return Attraction.query.filter_by(city=self.id).all()

    def __repr__(self) -> str:
        return self.name


class Friendship(db.Model):
    __tablename__ = "friendship"
    user_1 = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    user_2 = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    status = db.Column(db.String(50))


class GroupedAttraction(db.Model):
    __tablename__ = "groupedAttraction"
    group_id = db.Column(
        db.Integer, db.ForeignKey("attractionGroup.id"), primary_key=True
    )
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )

    user_wishlist = db.relationship("UserWishlist", back_populates="groupedattraction")

    @property
    def attraction_count(self):
        return Attraction.query.filter(Attraction.groupedattractions.any(UserWishlist.id == self.id)).count()

    def __repr__(self) -> str:
        return self.name

    def get_id(self):
        return self.id


class Language(db.Model):
    __tablename__ = "language"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))


class Tag(db.Model):
    __tablename__ = "tag"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)

    user_preferences = db.relationship("UserTagPreference", back_populates="tag")

    @property
    def attraction_count(self):
        return Attraction.query.filter(Attraction.tags.any(Tag.id == self.id)).count()

    def __repr__(self) -> str:
        return self.name

    def get_id(self):
        return self.id


class User(UserMixin, db.Model):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    first_name = db.Column(db.String(50))
    last_name = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(255), nullable=False)
    role = db.Column(db.Integer, db.ForeignKey("userRole.id"), default=2)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    role_rel = db.relationship("UserRole", backref=db.backref("users", lazy=True))
    tag_preferences = db.relationship("UserTagPreference", back_populates="user")
    wishlist = db.relationship("AttractionGroup", backref="owner_user", lazy=True)
    visited_attractions = db.relationship("VisitedAttraction", back_populates="user")

    initiated_friendships = db.relationship(
        "Friendship",
        foreign_keys="Friendship.user_1",
        backref=db.backref("initiator", lazy=True),
    )

    received_friendships = db.relationship(
        "Friendship",
        foreign_keys="Friendship.user_2",
        backref=db.backref("recipient", lazy=True),
    )

    def __init__(self, **kwargs):
        super(User, self).__init__(**kwargs)

    def __repr__(self):
        return "<User {}>".format(self.username)

    def set_password(self, password):
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)

    def get_id(self):
        return self.id

    @property
    def is_authenticated(self):
        return True

    @property
    def is_active(self):
        return True

    @property
    def is_admin(self):
        return self.role_rel.is_admin

    def gravatar(self, size=100, default="identicon", rating="g"):
        if request.is_secure:
            url = "https://secure.gravatar.com/avatar"
        else:
            url = "http://www.gravatar.com/avatar"
        hash = hashlib.md5(self.email.lower().encode("utf-8")).hexdigest()
        return f"{url}/{hash}?s={size}&d={default}&r={rating}"


class Anonymous(AnonymousUserMixin):
    def __init__(self):
        self.id = None


@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))


class UserAchievement(db.Model):
    __tablename__ = "userAchievement"
    achievement_id = db.Column(
        db.Integer, db.ForeignKey("achievement.id"), primary_key=True
    )
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    time_achieved = db.Column(db.DateTime, default=datetime.utcnow)


class UserRole(db.Model):
    __tablename__ = "userRole"

    def __repr__(self):
        return self.title

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30))
    is_admin = db.Column(db.Boolean, default=False)


class VisitedAttraction(db.Model):
    __tablename__ = "visitedAttraction"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )
    time_visited = db.Column(db.DateTime, default=datetime.utcnow)

    user = db.relationship("User", back_populates="visited_attractions")
    attraction = db.relationship("Attraction", back_populates="visited_by")


class UserTagPreference(db.Model):
    __tablename__ = "userTagPreference"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    tag_id = db.Column(db.Integer, db.ForeignKey("tag.id"), primary_key=True)

    user = db.relationship("User", back_populates="tag_preferences")
    tag = db.relationship("Tag", back_populates="user_preferences")



class UserWishlist(db.Model):
    __tablename__ = "userWishlist"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    attraction_group_id = db.Column(db.Integer, db.ForeignKey("attractionGroup.id"), primary_key=True)

    user = db.relationship("User", backref=db.backref("wishlist_entries"))
    attraction_group = db.relationship("AttractionGroup", backref=db.backref("user_wishlist"))

    def __init__(self, user_id, attraction_group_id):
        self.user_id = user_id
        self.attraction_group_id = attraction_group_id