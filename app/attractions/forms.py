from flask_wtf import FlaskForm as Form
from wtforms import StringField, SelectField, SubmitField, SelectMultipleField, SubmitField, widgets
from flask_babel import _

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
    