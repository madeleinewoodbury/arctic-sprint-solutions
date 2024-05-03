from . import main
from flask import render_template, session, redirect, url_for, flash, request, current_app, send_from_directory
from flask_babel import _, refresh
import os


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

@main.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(main.root_path, 'app\static'), 'favicon.ico', mimetype='image/vnd.microsoft.icon')
    #return send_from_directory(os.path.join(main.root_path, 'app\static'),
                            # 'favicon.ico', mimetype='image/vnd.microsoft.icon')
