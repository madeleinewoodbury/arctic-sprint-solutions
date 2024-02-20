from app import db

class Attraction(db.Model):
    id = db.Column(db.int, primary_key=True)
    name = db.Column(db.varchar(55), nullable=False)
    location = db.Column(db.varchar(255), nullable=False)
    description = db.Column(db.text, nullable=False)

    def __repr__(self):
        return f"Attraction('{self.name}', '{self.location}', '{self.description}')'"