from flask import session
import random


# Babel stuff
def get_locale():
    # Sjekk om språket er lagret i sesjonen
    if 'language' in session:
        return session['language']
    # Dersom ingen language i session returner engelsk språk.
    return 'en'


def translate_filter(text):
    from app import cache, translator_manager

    cached_data = {}
    if ('language' in session) and (session['language'] != 'en'):
        cache_key = "{}_{}".format(text, session['language'])
        cached_data = cache.get(cache_key)
        if cached_data is not None:
            return cached_data
        try:
            translated_text = translator_manager.translate(text, dest=session['language'], src='en').text
        except Exception as e:
            print(e)
            return text
        cached_data = translated_text
        cache.set(cache_key, cached_data, timeout=random.randint(100, 1500))
        return cached_data
    return text