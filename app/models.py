from app import db

class Attraction(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    location = db.Column(db.String(255), nullable=False)
    description = db.Column(db.String(1024), nullable=False)

    def __repr__(self):
        return f"Attraction('{self.name}', '{self.location}', '{self.description}')'"