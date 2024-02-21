"""SQL Queries related to authentication of users.

Keyword arguments:
	N/A
Return:
	N/A
"""
import mysql.connector
from mysql.connector import errorcode
from flask import current_app

class UserSQL():
	def __enter__(self) -> 'cursor':
		self.conn = mysql.connector.connect(**current_app.config['MYSQL_DICT'])
		self.cursor = self.conn.cursor(prepared=True)
		return self
	
	def __exit__(self, exc_type, exc_val, exc_trace) -> None:
		self.conn.commit()
		self.conn.cursor.close()
		self.conn.close()

	def reg_user(self, username, first_name, last_name, email, password):
		try:
			_SQL = """INSERT INTO User(username, first_name, last_name, email, password, role) VALUES (%s, %s, %s, %s, %s, %s, (SELECT id FROM UserRole WHERE title='Bruker'))"""
			values = (username, first_name, last_name, email, password)
			self.cursor.execute(_SQL, values)
		except mysql.connector.Error as error:
			print(error)
