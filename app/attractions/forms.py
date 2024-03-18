from flask_wtf import FlaskForm as Form
from wtforms import StringField, SelectField, SubmitField, SelectMultipleField, SubmitField, widgets

class SearchForm(Form):
    search_text = StringField('Search Attractions', render_kw={'placeholder': 'Search Attractions'})
    submit = SubmitField('Search', render_kw={'class': 'search-btn'})

class MultiCheckboxField(SelectMultipleField):
    widget = widgets.ListWidget(html_tag='ul', prefix_label=False)
    option_widget = widgets.CheckboxInput()
    
class FilterAttractionsForm(Form):
    categories = MultiCheckboxField('Category', coerce=int)
    age_groups = MultiCheckboxField('Age group', coerce=int)
    tags = MultiCheckboxField('Tag', coerce=int)
    