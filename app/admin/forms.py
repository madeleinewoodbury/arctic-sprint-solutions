from flask_wtf import FlaskForm
from wtforms import SelectField, SubmitField
from wtforms.validators import DataRequired
from datetime import datetime


class ReportForm(FlaskForm):
    """
    A form for generating reports based on selected year and month.

    Attributes:
        year (SelectField): A select field for choosing the year.
        month (SelectField): A select field for choosing the month.
        submit (SubmitField): A submit button for submitting the form.
    """

    current_year = datetime.now().year
    current_month = datetime.now().month

    year = SelectField(
        "Year",
        choices=[(str(y), str(y)) for y in range(current_year, current_year - 10, -1)],
        validators=[DataRequired()],
        default=str(current_year),
    )
    month = SelectField(
        "Month",
        choices=[(str(m), datetime(1900, m, 1).strftime("%B")) for m in range(1, 13)],
        validators=[DataRequired()],
        default=str(current_month),
    )
    submit = SubmitField("Submit")
