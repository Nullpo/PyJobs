from sqlalchemy import (
	Table,
    Column,
    Index,
    Integer,
    String,
	Text,
	ForeignKey
    )

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import (
    scoped_session,
    sessionmaker,
	relationship,
	backref
    )

from zope.sqlalchemy import ZopeTransactionExtension

DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()

class JobOffers(Base):
    __tablename__ = 'JobOffers'
    id = Column(Integer, primary_key=True)
    position = Column(String(50))
    location = Column(String(50)) # Ubicacion del trabajo, no necesariamente de la compania (ej: consultoras). 
    description = Column(Text)
    meansOfApplication = Column(String(70))
    company_id = Column(Integer, ForeignKey('Companies.id'))
    company = relationship("Companies", backref="joboffers")
    category_id = Column(Integer, ForeignKey('JobCategories.id'))
    category = relationship("JobCategories", backref="joboffers")

class JobCategories(Base):
   __tablename__= 'JobCategories'
   id = Column(Integer, primary_key=True)
   name = Column(String(50))
   
class Companies(Base):
   __tablename__= 'Companies'
   id = Column(Integer, primary_key=True)
   logoUrl = Column(String(50))
   name = Column(String(50))
   email = Column(String(50))
   location = Column(String(50)) 
   address = Column(String(50))
   jobsLimit = Column(Integer)
    
   def __repr__(self):
      return "<JobOffer(id='%s', description='%s', location='%s')>" % (
      self.id, self.description, self.location)