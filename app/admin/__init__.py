from app import db, admin_manager

from app.admin.views import (
    UserView,
    User,
    CategoryView,
    Category,
    TagView,
    Tag,
    AgeGroupView,
    AgeGroup,
    AttractionView,
    Attraction,
    AchievementsView,
    Achievement,
    ReportView,
    CitiesView,
    City,
)


def add_admin_views():
    admin_manager.add_view(UserView(User, db.session, category="Edit Database"))
    admin_manager.add_view(CitiesView(City, db.session, category="Edit Database"))
    admin_manager.add_view(
        CategoryView(Category, db.session, category="Edit Database"),
    )
    admin_manager.add_view(TagView(Tag, db.session, category="Edit Database"))
    admin_manager.add_view(AgeGroupView(AgeGroup, db.session, category="Edit Database"))
    admin_manager.add_view(
        AttractionView(Attraction, db.session, category="Edit Database")
    )
    admin_manager.add_view(
        AchievementsView(Achievement, db.session, category="Edit Database")
    )
    admin_manager.add_view(ReportView(name="Reports", endpoint="reports"))



add_admin_views()
