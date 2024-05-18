import hashlib
from flask import request, current_app
from datetime import datetime
from sqlalchemy.ext.hybrid import hybrid_property
from sqlalchemy import func
from sqlalchemy.sql import select
from app import db, login_manager
from flask_login import UserMixin, AnonymousUserMixin
from werkzeug.security import check_password_hash, generate_password_hash
from itsdangerous.url_safe import URLSafeTimedSerializer as Serializer


class Achievement(db.Model):
    """
    Represents an achievement in the system.

    Attributes:
        id (int): The unique identifier for the achievement.
        title (str): The title of the achievement.
        description (str): The description of the achievement.
        points_needed (int): The number of points needed to unlock the achievement.
        users (list): The list of users who have unlocked this achievement.
    """

    __tablename__ = "achievement"
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text)
    points_needed = db.Column(db.Integer, nullable=False)
    users = db.relationship(
        "User", secondary="userAchievement", back_populates="achievements"
    )

    @property
    def user_count(self):
        """
        Returns the number of users who have unlocked this achievement.

        Returns:
            int: The number of users who have unlocked this achievement.
        """
        return User.query.filter(
            User.achievements.any(Achievement.id == self.id)
        ).count()


class AgeGroup(db.Model):
    """
    Represents an age group in the system.

    Attributes:
        id (int): The unique identifier for the age group.
        name (str): The name of the age group.
        user_preferences (relationship): The user preferences associated with the age group.

    Properties:
        attraction_count (int): The number of attractions associated with the age group.

    Methods:
        __repr__(): Returns a string representation of the age group.

    """

    __tablename__ = "ageGroup"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    user_preferences = db.relationship(
        "UserAgeGroupPreference", back_populates="age_group"
    )

    @property
    def attraction_count(self):
        """
        Returns the number of attractions associated with the age group.

        Returns:
            int: The number of attractions.

        """
        return Attraction.query.filter(
            Attraction.age_groups.any(AgeGroup.id == self.id)
        ).count()

    def __repr__(self) -> str:
        """
        Returns a string representation of the age group.

        Returns:
            str: The name of the age group.

        """
        return self.name


class Attraction(db.Model):
    """
    Represents an attraction in the system.

    Attributes:
        id (int): The unique identifier of the attraction.
        name (str): The name of the attraction.
        city (int): The ID of the city where the attraction is located.
        location (str): The location of the attraction.
        description (str): The description of the attraction.
        image (str): The image URL of the attraction.
        points (int): The points assigned to the attraction.
        city_rel (City): The relationship to the city where the attraction is located.
        age_groups (list): The age groups associated with the attraction.
        category (list): The categories associated with the attraction.
        tags (list): The tags associated with the attraction.
        visited_by (list): The users who have visited the attraction.
        groups (list): The attraction groups that the attraction belongs to.
    """

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
    groups = db.relationship(
        "AttractionGroup",
        secondary="groupedAttraction",
        back_populates="grouped_attractions",
    )

    def __repr__(self) -> str:
        """
        Returns a string representation of the attraction.

        Returns:
            str: The name of the attraction.

        """
        return self.name

    @hybrid_property
    def visit_count(self):
        """
        Returns the number of times the object has been visited.

        Returns:
            int: The number of visits.
        """
        return len(self.visited_by)

    @visit_count.expression
    def visit_count(cls):
        """
        Returns the number of times the attraction has been visited.

        :param cls: The class representing the attraction.
        :return: The visit count for the attraction.
        """
        return (
            select(func.count(VisitedAttraction.attraction_id))
            .where(VisitedAttraction.attraction_id == cls.id)
            .label("visit_count")
        )

    @property
    def list_of_visitors(self):
        """
        Returns a list of usernames of all the visitors who have visited the attraction.

        Returns:
            list: A list of usernames of the visitors.
        """
        visitors = (
            User.query.join(VisitedAttraction)
            .filter(VisitedAttraction.attraction_id == self.id)
            .all()
        )
        list_of_visitors = [visitor.username for visitor in visitors]
        return list_of_visitors

    def to_dict(self):
        """
        Convert the object to a dictionary representation.

        Returns:
            dict: A dictionary representation of the object.
        """
        data = {
            column.name: getattr(self, column.name) for column in self.__table__.columns
        }
        data["age_groups"] = [age_group.name for age_group in self.age_groups]
        data["category"] = [category.name for category in self.category]
        data["tags"] = [tag.name for tag in self.tags]
        return data


class AttractionAgeGroup(db.Model):
    """
    Represents the relationship between an attraction and an age group.

    This class defines the table structure for the "attractionAgeGroup" table in the database.
    It contains two foreign key columns: "attraction_id" and "age_group_id".

    Attributes:
        attraction_id (int): The ID of the attraction.
        age_group_id (int): The ID of the age group.
    """

    __tablename__ = "attractionAgeGroup"
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )
    age_group_id = db.Column(db.Integer, db.ForeignKey("ageGroup.id"), primary_key=True)


class AttractionCategory(db.Model):
    """
    Represents the relationship between an attraction and its category.

    This class defines the many-to-many relationship between the `Attraction` and `Category` models.
    It contains two primary key columns: `category_id` and `attraction_id`, which are foreign keys
    referencing the `id` columns of the `Category` and `Attraction` models respectively.

    Attributes:
        category_id (int): The ID of the category.
        attraction_id (int): The ID of the attraction.
    """

    __tablename__ = "attractionCategory"
    category_id = db.Column(db.Integer, db.ForeignKey("category.id"), primary_key=True)
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )


class AttractionGroup(db.Model):
    """
    Represents a group of attractions.

    Attributes:
        id (int): The unique identifier for the attraction group.
        owner (int): The ID of the user who owns the attraction group.
        title (str): The title of the attraction group.
        visibility (str): The visibility of the attraction group.
        created_at (datetime): The timestamp when the attraction group was created.
        grouped_attractions (list): The attractions grouped in this attraction group.

    Methods:
        to_dict(): Converts the AttractionGroup object to a dictionary.

    """

    __tablename__ = "attractionGroup"
    id = db.Column(db.Integer, primary_key=True)
    owner = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    title = db.Column(db.String(50), nullable=False)
    visibility = db.Column(db.String(50), nullable=False)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)

    grouped_attractions = db.relationship(
        "Attraction", secondary="groupedAttraction", back_populates="groups"
    )

    def to_dict(self):
        """
        Converts the AttractionGroup object to a dictionary.

        Returns:
            dict: A dictionary representation of the AttractionGroup object.

        """
        data = {
            column.name: getattr(self, column.name) for column in self.__table__.columns
        }
        data["created_at"] = self.created_at.isoformat() if self.created_at else None
        data["grouped_attractions"] = [
            {"name": attraction.name, "image": attraction.image}
            for attraction in self.grouped_attractions
        ]
        return data


class AttractionTag(db.Model):
    """
    Represents the association table between attractions and tags.
    """

    __tablename__ = "attractionTag"
    tag_id = db.Column(db.Integer, db.ForeignKey("tag.id"), primary_key=True)
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )


class Category(db.Model):
    """
    Represents a category of attractions.

    Attributes:
        id (int): The unique identifier of the category.
        name (str): The name of the category.
        user_preferences (list): A list of user preferences associated with the category.

    Properties:
        attraction_count (int): The number of attractions in the category.

    Methods:
        __repr__(): Returns a string representation of the category.
    """

    __tablename__ = "category"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    user_preferences = db.relationship(
        "UserCategoryPreference", back_populates="category"
    )

    @property
    def attraction_count(self):
        """
        Get the number of attractions in the category.

        Returns:
            int: The number of attractions in the category.
        """
        return Attraction.query.filter(
            Attraction.category.any(Category.id == self.id)
        ).count()

    def __repr__(self) -> str:
        """
        Returns a string representation of the category.

        Returns:
            str: The name of the category.
        """
        return self.name


class City(db.Model):
    """
    Represents a city in the database.

    Attributes:
        id (int): The unique identifier of the city.
        name (str): The name of the city.
        description (str): The description of the city.
        image (str): The image URL of the city.
        country_id (int): The foreign key referencing the associated country.

    Relationships:
        country (Country): The associated country object.
        cities (List[Attraction]): The attractions in the city.

    Properties:
        attractions_count (int): The number of attractions in the city.

    Methods:
        __repr__(): Returns a string representation of the city object.
    """

    __tablename__ = "city"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    description = db.Column(db.Text)
    image = db.Column(db.String(255))
    country_id = db.Column(db.Integer, db.ForeignKey("country.id"))

    country = db.relationship("Country", backref=db.backref("cities", lazy=True))

    @property
    def attractions_count(self):
        """
        Returns the number of attractions in the city.

        :return: The count of attractions in the city.
        :rtype: int
        """
        return Attraction.query.filter_by(city=self.id).count()

    def __repr__(self) -> str:
        """
        Returns a string representation of the object.

        The string representation is the name of the object.

        Returns:
            str: The name of the object.
        """
        return self.name


class Comment(db.Model):
    """
    Represents a comment made by a user on an attraction.
    """

    __tablename__ = "comment"
    id = db.Column(db.Integer, primary_key=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    edited_at = db.Column(db.DateTime)
    comment_text = db.Column(db.Text)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    editor_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    attraction_id = db.Column(db.Integer, db.ForeignKey("attraction.id"))

    user = db.relationship("User", foreign_keys=[user_id], backref="comments")
    editor = db.relationship(
        "User", foreign_keys=[editor_id], backref="edited_comments"
    )


class Friendship(db.Model):
    """
    Represents a friendship between two users.

    Attributes:
        user_1 (int): The ID of the first user in the friendship.
        user_2 (int): The ID of the second user in the friendship.
        status (str): The status of the friendship.
    """

    __tablename__ = "friendship"
    user_1 = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    user_2 = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    status = db.Column(db.String(50))


class GroupedAttraction(db.Model):
    """
    Represents a grouped attraction.

    This class defines the structure of a grouped attraction in the database.
    It contains information about the group ID and the attraction ID.

    Attributes:
        group_id (int): The ID of the attraction group.
        attraction_id (int): The ID of the attraction.
    """

    __tablename__ = "groupedAttraction"
    group_id = db.Column(
        db.Integer, db.ForeignKey("attractionGroup.id"), primary_key=True
    )
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )


class Language(db.Model):
    """
    Represents a language in the system.

    Attributes:
        id (int): The unique identifier for the language.
        name (str): The name of the language.
    """

    __tablename__ = "language"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))


class Tag(db.Model):
    """
    Represents a tag associated with attractions.
    """

    __tablename__ = "tag"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)

    user_preferences = db.relationship("UserTagPreference", back_populates="tag")

    @property
    def attraction_count(self):
        """
        Returns the number of attractions associated with this tag.
        """
        return Attraction.query.filter(Attraction.tags.any(Tag.id == self.id)).count()

    def __repr__(self) -> str:
        """
        Returns a string representation of the tag.
        """
        return self.name

    def get_id(self):
        """
        Returns the ID of the tag.
        """
        return self.id


class User(UserMixin, db.Model):
    """
    Represents a user in the system.

    Attributes:
        id (int): The unique identifier of the user.
        username (str): The username of the user.
        first_name (str): The first name of the user.
        last_name (str): The last name of the user.
        email (str): The email address of the user.
        password (str): The hashed password of the user.
        role (int): The role of the user.
        country_id (int): The ID of the country associated with the user.
        created_at (datetime): The timestamp of when the user was created.
        achievements (list): The list of achievements associated with the user.
        badges (list): The list of badges associated with the user.
        role_rel (UserRole): The role relationship of the user.
        visited_attractions (list): The list of visited attractions by the user.
        initiated_friendships (list): The list of friendships initiated by the user.
        received_friendships (list): The list of friendships received by the user.
        country (Country): The country associated with the user.
        category_preferences (list): The list of category preferences of the user.
        tag_preferences (list): The list of tag preferences of the user.
        age_group_preferences (list): The list of age group preferences of the user.

    Methods:
        __init__(self, **kwargs): Initializes a new User object.
        list_of_badges(self): Returns a list of badge names associated with the user.
        badges_count(self): Returns the count of badges associated with the user.
        list_of_visited_attractions(self): Returns a list of names of visited attractions by the user.
        visited_count(self): Returns the count of visited attractions by the user.
        __repr__(self): Returns a string representation of the User object.
        set_password(self, password): Sets the password for the user.
        check_password(self, password): Checks if the provided password matches the user's password.
        generate_reset_token(self): Generates a reset token for the user's password reset.
        reset_password(token, new_password): Resets the user's password using the provided token.
        generate_delete_token(self): Generates a delete token for deleting the user.
        delete_user(token): Deletes the user using the provided token.
        get_id(self): Returns the ID of the user.
        is_authenticated(self): Returns True if the user is authenticated.
        is_active(self): Returns True if the user is active.
        is_admin(self): Returns True if the user is an admin.
        gravatar(self, size=100, default="identicon", rating="g"): Returns the Gravatar URL for the user's email.
        level(self): Returns the level information for the user.
    """

    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    first_name = db.Column(db.String(50))
    last_name = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(255), nullable=False)
    role = db.Column(db.Integer, db.ForeignKey("userRole.id"), default=2)
    country_id = db.Column(db.Integer, db.ForeignKey("country.id"))
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    achievements = db.relationship(
        "Achievement", secondary="userAchievement", back_populates="users"
    )
    badges = db.relationship("Badge", secondary="userBadge", back_populates="users")
    role_rel = db.relationship("UserRole", backref=db.backref("user", lazy=True))
    visited_attractions = db.relationship("VisitedAttraction", back_populates="user")
    initiated_friendships = db.relationship(
        "Friendship",
        foreign_keys="Friendship.user_1",
        backref=db.backref("initiator", lazy=True),
    )
    received_friendships = db.relationship(
        "Friendship",
        foreign_keys="Friendship.user_2",
        backref=db.backref("receiver", lazy=True),
    )
    country = db.relationship("Country", backref=db.backref("user", lazy=True))
    category_preferences = db.relationship(
        "UserCategoryPreference", back_populates="user"
    )
    tag_preferences = db.relationship("UserTagPreference", back_populates="user")
    age_group_preferences = db.relationship(
        "UserAgeGroupPreference", back_populates="user"
    )

    def __init__(self, **kwargs):
        super(User, self).__init__(**kwargs)

    @property
    def list_of_badges(self):
        return [b.name for b in self.badges]

    @property
    def badges_count(self):
        return len(self.list_of_badges)

    @property
    def list_of_visited_attractions(self):
        return [a.attraction.name for a in self.visited_attractions]

    @property
    def visited_count(self):
        return len(self.list_of_visited_attractions)

    def __repr__(self):
        return "<User {}>".format(self.username)

    def set_password(self, password):
        self.password = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password, password)

    def generate_reset_token(self):
        s = Serializer(current_app.config["SECRET_KEY"])
        return s.dumps({"reset": self.id})

    def reset_password(token, new_password):
        s = Serializer(current_app.config["SECRET_KEY"])
        try:
            data = s.loads(token, max_age=300)
        except:
            return False
        user = User.query.filter_by(id=data.get("reset")).first()
        if user is None:
            return False
        user.set_password(new_password)
        db.session.add(user)
        return True

    def generate_delete_token(self):
        s = Serializer(current_app.config["SECRET_KEY"])
        return s.dumps({"delete_user": self.id})

    def delete_user(token):
        s = Serializer(current_app.config["SECRET_KEY"])
        try:
            data = s.loads(token, max_age=300)
        except:
            return False
        user = User.query.filter_by(id=data.get("delete_user")).first()
        if user is None:
            return False

        attraction_groups = AttractionGroup.query.filter_by(owner=user.id).all()
        for group in attraction_groups:
            GroupedAttraction.query.filter_by(group_id=group.id).delete()
        AttractionGroup.query.filter_by(owner=user.id).delete()
        Friendship.query.filter(
            (Friendship.user_1 == user.id) | (Friendship.user_2 == user.id)
        ).delete()
        UserAchievement.query.filter_by(user_id=user.id).delete()
        UserTagPreference.query.filter_by(user_id=user.id).delete()
        UserBadge.query.filter_by(user_id=user.id).delete()
        UserCategoryPreference.query.filter_by(user_id=user.id).delete()
        UserAgeGroupPreference.query.filter_by(user_id=user.id).delete()
        VisitedAttraction.query.filter_by(user_id=user.id).delete()
        Comment.query.filter_by(user_id=user.id).delete()
        db.session.delete(user)
        return True

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

    @property
    def level(self):
        BASE_POINTS = 42
        GROWTH_RATE = 1.05
        current_level = 1
        points_required = BASE_POINTS
        points_remaining = sum(
            item.attraction.points for item in self.visited_attractions
        )

        while points_remaining >= points_required:
            points_remaining -= points_required
            current_level += 1
            points_required = int(
                (points_required + BASE_POINTS) * GROWTH_RATE - points_required
            )

        points_missing = points_required - points_remaining
        level = {
            "current_level": current_level,
            "points_required": points_required,
            "points_missing": points_missing,
            "progress": points_remaining,
        }
        return level


class Anonymous(AnonymousUserMixin):
    """
    Represents an anonymous user.

    This class is used to represent users who are not authenticated.
    It inherits from the `AnonymousUserMixin` class.

    Attributes:
        id: The unique identifier of the anonymous user.

    Methods:
        __init__: Initializes a new instance of the `Anonymous` class.
    """

    def __init__(self):
        self.id = None


@login_manager.user_loader
def load_user(user_id):
    """
    Load a user from the database based on the given user ID.

    Args:
        user_id (int): The ID of the user to load.

    Returns:
        User: The user object corresponding to the given user ID, or None if no user is found.
    """
    return User.query.get(int(user_id))


class UserAchievement(db.Model):
    """
    Represents the association table between User and Achievement.
    """

    __tablename__ = "userAchievement"
    achievement_id = db.Column(
        db.Integer, db.ForeignKey("achievement.id"), primary_key=True
    )
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    time_achieved = db.Column(db.DateTime, default=datetime.utcnow)


class UserRole(db.Model):
    """
    Represents a user role in the system.

    Attributes:
        id (int): The unique identifier for the user role.
        title (str): The title of the user role.
        is_admin (bool): Indicates whether the user role has administrative privileges.
    """

    __tablename__ = "userRole"

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(30))
    is_admin = db.Column(db.Boolean, default=False)

    def __repr__(self):
        return self.title


class VisitedAttraction(db.Model):
    """
    Represents a visited attraction by a user.

    Attributes:
        user_id (int): The ID of the user who visited the attraction.
        attraction_id (int): The ID of the visited attraction.
        time_visited (datetime): The timestamp of when the attraction was visited.
        user (User): The user who visited the attraction.
        attraction (Attraction): The visited attraction.

    Relationships:
        - user: Represents a one-to-many relationship with the User model.
        - attraction: Represents a one-to-many relationship with the Attraction model.
    """

    __tablename__ = "visitedAttraction"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    attraction_id = db.Column(
        db.Integer, db.ForeignKey("attraction.id"), primary_key=True
    )
    time_visited = db.Column(db.DateTime, default=datetime.utcnow)

    user = db.relationship("User", back_populates="visited_attractions")
    attraction = db.relationship("Attraction", back_populates="visited_by")


class UserTagPreference(db.Model):
    """
    Represents the user's preference for a specific tag.

    Attributes:
        user_id (int): The ID of the user.
        tag_id (int): The ID of the tag.
        user (User): The user associated with this preference.
        tag (Tag): The tag associated with this preference.
    """

    __tablename__ = "userTagPreference"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    tag_id = db.Column(db.Integer, db.ForeignKey("tag.id"), primary_key=True)

    user = db.relationship("User", back_populates="tag_preferences")
    tag = db.relationship("Tag", back_populates="user_preferences")


class Badge(db.Model):
    """
    Represents a badge in the system.

    Attributes:
        id (int): The unique identifier of the badge.
        name (str): The name of the badge.
        description (str): The description of the badge.
        users (list): The list of users who have earned this badge.
        requirements (list): The list of requirements for earning this badge.
    """

    __tablename__ = "badge"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    description = db.Column(db.String(255), nullable=False)

    users = db.relationship("User", secondary="userBadge", back_populates="badges")
    requirements = db.relationship(
        "BadgeRequirement", back_populates="badge", cascade="all, delete-orphan"
    )

    @property
    def list_of_achievers(self):
        """
        Get the list of usernames of users who have earned this badge.

        Returns:
            list: The list of usernames.
        """
        return [user.username for user in self.users]

    @hybrid_property
    def achieved_count(self):
        """
        Get the count of users who have earned this badge.

        Returns:
            int: The count of users.
        """
        return len(self.users)

    @achieved_count.expression
    def achieved_count(cls):
        """
        Get the count of users who have earned this badge (SQL expression).

        Returns:
            int: The count of users.
        """
        return (
            select(func.count(UserBadge.user_id))
            .where(UserBadge.badge_id == cls.id)
            .label("achieved_count")
        )

    def __repr__(self):
        """
        Get the string representation of the badge.

        Returns:
            str: The name of the badge.
        """
        return self.name


class BadgeRequirement(db.Model):
    """
    Represents a requirement for earning a badge.

    Attributes:
        id (int): The unique identifier of the requirement.
        badge_id (int): The foreign key referencing the associated badge.
        tag_id (int): The foreign key referencing the associated tag.
        quantity_required (int): The quantity of the tag required to earn the badge.
        badge (Badge): The associated badge object.
        tag (Tag): The associated tag object.
    """

    __tablename__ = "badgeRequirement"
    id = db.Column(db.Integer, primary_key=True)
    badge_id = db.Column(db.Integer, db.ForeignKey("badge.id"), nullable=False)
    tag_id = db.Column(db.Integer, db.ForeignKey("tag.id"), nullable=False)
    quantity_required = db.Column(db.Integer, nullable=False)

    badge = db.relationship("Badge", back_populates="requirements")
    tag = db.relationship("Tag", backref="requirements")

    def __repr__(self):
        """
        Returns a string representation of the object.

        The string representation includes the quantity required and the name of the tag.

        Returns:
            str: A string representation of the object.
        """
        return f"{self.quantity_required}x {self.tag.name} tags"


class UserBadge(db.Model):
    """
    Represents the association table between users and badges.
    """

    __tablename__ = "userBadge"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    badge_id = db.Column(db.Integer, db.ForeignKey("badge.id"), primary_key=True)
    date_earned = db.Column(db.DateTime, default=datetime.utcnow)

    def __repr__(self):
        """
        Returns a string representation of the UserBadge object.

        The string representation includes the user ID and badge ID.

        Returns:
            str: A string representation of the UserBadge object.
        """
        return f"<UserBadge {self.user_id} {self.badge_id}>"


class Country(db.Model):
    """
    Represents a country.

    Attributes:
        id (int): The unique identifier of the country.
        name (str): The name of the country.
        code (str): The country code.
        flag (str): The URL of the country's flag image.
    """

    __tablename__ = "country"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(55), nullable=False)
    code = db.Column(db.String(2))
    flag = db.Column(db.String(100))

    def __repr__(self):
        """
        Returns a string representation of the object.

        The string representation is the name of the object.

        Returns:
            str: The name of the object.
        """
        return self.name


class UserCategoryPreference(db.Model):
    """
    Represents the user's preference for a specific category.

    Attributes:
        user_id (int): The ID of the user.
        category_id (int): The ID of the category.
        user (User): The user object associated with this preference.
        category (Category): The category object associated with this preference.
    """

    __tablename__ = "userCategoryPreference"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    category_id = db.Column(db.Integer, db.ForeignKey("category.id"), primary_key=True)
    user = db.relationship("User", back_populates="category_preferences")
    category = db.relationship("Category", back_populates="user_preferences")


class UserAgeGroupPreference(db.Model):
    """
    Represents the user's preference for a specific age group.

    Attributes:
        user_id (int): The ID of the user.
        age_group_id (int): The ID of the age group.
        user (User): The user associated with this preference.
        age_group (AgeGroup): The age group associated with this preference.
    """

    __tablename__ = "userAgeGroupPreference"
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), primary_key=True)
    age_group_id = db.Column(db.Integer, db.ForeignKey("ageGroup.id"), primary_key=True)
    user = db.relationship("User", back_populates="age_group_preferences")
    age_group = db.relationship("AgeGroup", back_populates="user_preferences")
