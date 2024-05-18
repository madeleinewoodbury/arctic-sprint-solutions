from threading import Thread
from flask import current_app, render_template
from flask_mail import Message
from . import mail


def send_async_email(app, msg):
    """Sends an email asynchronously.

    This function is used internally to send emails in a separate thread.

    Args:
    - app: The Flask application object.
    - msg: The Message object containing the email details.

    """
    with app.app_context():
        mail.send(msg)


def send_email(to, subject, template, **kwargs):
    """Sends an email.

    This function sends an email asynchronously using the Flask-Mail extension.

    Args:
    - to: The recipient's email address.
    - subject: The subject of the email.
    - template: The name of the email template.
    - **kwargs: Additional keyword arguments to be passed to the email template.

    Returns:
    - thr: The Thread object representing the email sending process.

    """
    app = current_app._get_current_object()
    msg = Message(
        app.config["FLASK_MAIL_SUBJECT_PREFIX"] + " " + subject,
        sender=app.config["FLASK_MAIL_SENDER"],
        recipients=[to],
    )
    msg.body = render_template(template + ".txt", **kwargs)
    msg.html = render_template(template + ".html", **kwargs)
    thr = Thread(target=send_async_email, args=[app, msg])
    thr.start()
    return thr
