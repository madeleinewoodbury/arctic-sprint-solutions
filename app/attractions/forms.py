from flask_wtf import FlaskForm as Form
from wtforms import (
    StringField,
    SelectField,
    SubmitField,
    SelectMultipleField,
    SubmitField,
    widgets,
    TextAreaField,
)
from app.models import City
from flask_babel import lazy_gettext as _


class SearchForm(Form):
    """
    Form for searching attractions.
    """

    search_text = StringField(
        _("Search Attractions"), render_kw={"placeholder": _("Search Attractions")}
    )
    submit = SubmitField(_("Search"), render_kw={"class": "search-btn"})


class MultiCheckboxField(SelectMultipleField):
    """
    Custom field for multiple checkboxes.
    """

    widget = widgets.ListWidget(html_tag="ul", prefix_label=False)
    option_widget = widgets.CheckboxInput()


class FilterAttractionsForm(Form):
    """
    Form for filtering attractions by category, age group, and tag.
    """

    categories = MultiCheckboxField(_("Category"), coerce=int)
    age_groups = MultiCheckboxField(_("Age group"), coerce=int)
    tags = MultiCheckboxField(_("Tag"), coerce=int)


class SelectCityForm(Form):
    """
    Form for selecting a city.
    """

    city = SelectField(_("City"), coerce=int)

    def __init__(self, *args, **kwargs):
        super(SelectCityForm, self).__init__(*args, **kwargs)
        self.city.choices = [(city.id, city.name) for city in City.query.all()]


class CommentForm(Form):
    """
    Form for posting comments.
    """

    comment = TextAreaField()
    submit = SubmitField(_("Post"), render_kw={"class": "btn btn-primary"})
