from flask_wtf import FlaskForm as Form
from wtforms import StringField, SelectField, SubmitField, SelectMultipleField, SubmitField, widgets
from wtforms.validators import DataRequired
from app.models import City
from flask_babel import lazy_gettext as _

class SearchForm(Form):
    search_text = StringField(_('Search Attractions'), render_kw={'placeholder': _('Search Attractions')})
    submit = SubmitField(_('Search'), render_kw={'class': 'search-btn'})

class MultiCheckboxField(SelectMultipleField):
    widget = widgets.ListWidget(html_tag='ul', prefix_label=False)
    option_widget = widgets.CheckboxInput()
    
class FilterAttractionsForm(Form):
    categories = MultiCheckboxField(_('Category'), coerce=int)
    age_groups = MultiCheckboxField(_('Age group'), coerce=int)
    tags = MultiCheckboxField(_('Tag'), coerce=int)

class SelectCityForm(Form):
    city = SelectField(_('City'), coerce=int)

    def __init__(self, *args, **kwargs):
        super(SelectCityForm, self).__init__(*args, **kwargs)
        self.city.choices = [(city.id, city.name) for city in City.query.all()]