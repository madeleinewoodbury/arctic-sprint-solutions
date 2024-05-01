
import unittest
from flask import url_for
from werkzeug.exceptions import ServiceUnavailable
from app import create_app



# Test for 503 error
class TestServiceUnavailable(unittest.TestCase):
    def setUp(self):
        app = create_app("testing")
        app.config['TESTING'] = True
        self.app = app.test_client()

    def test_index_page_unavailable(self):
        with self.app:
            # Access the route to trigger the exception
            with self.assertRaises(ServiceUnavailable):
                self.app.get('/service_unavailable')





