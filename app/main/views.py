from . import main
from flask import render_template, session, redirect, url_for, flash, request, current_app
from flask_babel import _, refresh
from werkzeug.exceptions import ServiceUnavailable


@main.route('/')
@main.route('/index')
def index():
    return render_template('index.html')


@main.route('/change-language', methods=['GET', 'POST'])
def language():
    if request.method == 'POST':
        selected_language = request.form.get('languages')
        session['language'] = selected_language
        if selected_language in current_app.config['LANGUAGES']:
            flash("Language changed to " + current_app.config['LANGUAGES'].get(selected_language), 'success')
            refresh()
            return redirect(url_for('main.index'))
        flash(_("Language not recognized."), 'error')
        return redirect(url_for('main.index'))
    return render_template('change_language.html')


@main.route('/about')
def about():
    return render_template('about.html')


# For testing purposes - 503
@main.route('/service_unavailable')
def service_unavailable():
    try:
        raise ServiceUnavailable("Service is temporarily unavailable.")
    except ServiceUnavailable as e:
        return render_template('503.html'), 503


# For testing purposes - 404
@main.route('/nonexistent_route')
def nonexistent_route():
    return render_template('404.html'), 404
