from flask_wtf import FlaskForm as Form
from wtforms import SelectMultipleField, SubmitField, widgets
from wtforms.validators import DataRequired
from app.models import Category


class MultiCheckboxField(SelectMultipleField):
    widget = widgets.ListWidget(html_tag='ul', prefix_label=False)
    option_widget = widgets.CheckboxInput()
    
class FilterAttractionsForm(Form):
    categories = MultiCheckboxField('Category', coerce=int)
    
    def __init__(self, *args, **kwargs):
        super(FilterAttractionsForm, self).__init__(*args, **kwargs)
        self.categories.choices = [(category.id, category.name) for category in Category.query.all()]
