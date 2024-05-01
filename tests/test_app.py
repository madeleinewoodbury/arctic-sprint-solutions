
import unittest
from flask import url_for
from werkzeug.exceptions import ServiceUnavailable
from app import create_app


# Class for 503 error testing
#python -m unittest tests.test_app.TestServiceUnavailable
class TestServiceUnavailable(unittest.TestCase):
    def setUp(self):
        self.app = create_app("testing").test_client()

    def test_service_unavailable_error(self):
        with self.app:
            response = self.app.get('/service_unavailable')
            self.assertEqual(response.status_code, 503)  



if __name__ == "__main__":
    unittest.main()