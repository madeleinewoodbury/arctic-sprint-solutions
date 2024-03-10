from flask_wtf import FlaskForm as Form
from wtforms import StringField, SelectField, SubmitField, SelectMultipleField, SubmitField, widgets
from app.models import Category

class SearchForm(Form):
  search_text = StringField('Search Attractions', render_kw={'placeholder': 'Search Attractions'})
  category = SelectField('Category', choices=[('cat1', 'Category 1'), ('cat2', 'Category 2')], render_kw={'placeholder': 'Category'})
  age_group = SelectField('Age Group', choices=[('group1', 'Group 1'), ('group2', 'Group 2'), ('group3', 'Group 3')], render_kw={'placeholder': 'Age Groups'})
  tag = SelectField('Tag', choices=[('tag1', 'Tag 1'), ('tag2', 'Tag 2'), ('tag3', 'Tag 3')], render_kw={'placeholder': 'Keyword'})
  submit = SubmitField('Search', render_kw={'class': 'search-btn'})

class MultiCheckboxField(SelectMultipleField):
    widget = widgets.ListWidget(html_tag='ul', prefix_label=False)
    option_widget = widgets.CheckboxInput()
    
class FilterAttractionsForm(Form):
    categories = MultiCheckboxField('Category', coerce=int)
    
    def __init__(self, *args, **kwargs):
        super(FilterAttractionsForm, self).__init__(*args, **kwargs)
        self.categories.choices = [(category.id, category.name) for category in Category.query.all()]
