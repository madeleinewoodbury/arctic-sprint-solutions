from . import main
from flask import (
    render_template,
    session,
    redirect,
    url_for,
    flash,
    request,
    current_app,
    send_from_directory,
)
from flask_babel import _, refresh
from werkzeug.exceptions import ServiceUnavailable
import os


@main.route("/")
@main.route("/index")
def index():
    """
    Renders the index.html template.

    Returns:
        The rendered index.html template.
    """
    return render_template("index.html")


@main.route("/change-language", methods=["GET", "POST"])
def language():
    """
    Handles the language change request.

    If the request method is POST, it changes the selected language in the session.
    If the selected language is recognized, it flashes a success message and redirects to the index page.
    If the selected language is not recognized, it flashes an error message and redirects to the index page.

    Returns:
        If the request method is GET, the rendered change_language.html template.
        If the request method is POST and the selected language is recognized, a redirect to the index page.
        If the request method is POST and the selected language is not recognized, a redirect to the index page.
    """
    if request.method == "POST":
        selected_language = request.form.get("languages")
        session["language"] = selected_language
        if selected_language in current_app.config["LANGUAGES"]:
            flash(
                "Language changed to "
                + current_app.config["LANGUAGES"].get(selected_language),
                "success",
            )
            refresh()
            return redirect(url_for("main.index"))
        flash(_("Language not recognized."), "error")
        return redirect(url_for("main.index"))
    return render_template("change_language.html")


@main.route("/about")
def about():
    """
    Renders the about.html template.

    Returns:
        The rendered about.html template.
    """
    return render_template("about.html")


@main.route("/service_unavailable")
def service_unavailable():
    """
    Renders the 503.html template with a 503 status code.

    Returns:
        The rendered 503.html template with a 503 status code.
    """
    try:
        raise ServiceUnavailable("Service is temporarily unavailable.")
    except ServiceUnavailable as e:
        return render_template("503.html"), 503


@main.route("/nonexistent_route")
def nonexistent_route():
    """
    Renders the 404.html template with a 404 status code.

    Returns:
        The rendered 404.html template with a 404 status code.
    """
    return render_template("404.html"), 404


@main.route("/favicon.ico")
def favicon():
    """
    Returns the favicon.ico file.

    Returns:
        The favicon.ico file.
    """
    return send_from_directory(
        os.path.join(main.root_path, "app\static"),
        "favicon.ico",
        mimetype="image/vnd.microsoft.icon",
    )
