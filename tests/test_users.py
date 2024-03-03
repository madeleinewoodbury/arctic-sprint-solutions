import sys
sys.path.append("..") # Adds higher directory to python modules path.
from app import create_app
import unittest
import mysql.connector
from mysql.connector import errorcode
from flask import current_app

class FlaskUserTestCase(unittest.TestCase):
	def setUp(self) -> None:
		self.app = create_app('unittest')
		self.app_context = self.app.app_context()
		self.app_context.push()
		self.conn = mysql.connector.connect(**current_app.config['MYSQL_DICT'])
		self.cursor = self.conn.cursor(prepared=True)
		return self
		


	def tearDown(self) -> None:
		pass

	def test_user_register(self):

		# Registrer bruker
		with self.app.test_client() as c:
			c.post(
				'/auth/register', json={
					'username': 'testUser',
					'first_name': 'Test',
					'last_name': 'User',
					'email': 'test@email.com',
					'passord': 'secret123'
				}, follow_redirects=True
			)
		
		# Henter ut data fra registrert bruker
		try:
			_SQL = """SELECT * FROM User WHERE username=%s"""
			self.cursor.execute(_SQL, ('test@email.com', ))
			result = self.cursor.fetchone()
		except mysql.connector.Error as error:
			print(error)

		#UnitTest for å sjekke om data er registrert og korrekt.
		self.assertTrue(result.username == 'testUser')
		self.assertTrue(result.first_name == 'Test')
		self.assertTrue(result.last_name == 'User')
		self.assertTrue(result.email == 'test@email.com')
		self.assertFalse(result.password == 'secret123')
		# TODO: Role check.


	def test_user_login(self):
		pass