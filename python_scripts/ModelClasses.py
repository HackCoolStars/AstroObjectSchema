# -*- coding: utf-8 -*-
"""
Created on Wed Jun 22 15:55:27 2016

@author: J.Campbell-White
from D.Muna's code
"""

#!/usr/bin/python

from scicoder.database.DatabaseConnection import DatabaseConnection

import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import mapper, relation, exc, column_property, validates
from sqlalchemy import orm
from sqlalchemy.orm.session import Session

dbc = DatabaseConnection()

# ========================
# Define database classes
# ========================
Base = declarative_base(bind=dbc.engine)

class Object(Base):
	__tablename__ = 'Objects'
	__table_args__ = {'autoload' : True}

class ObjectReference(Base):
	__tablename__ = 'ObjectReferences'
	__table_args__ = {'autoload' : True}

class Reference(Base):
	__tablename__ = 'Reference'
	__table_args__ = {'autoload' : True}

class Measurement(Base):
	__tablename__ = 'Measurements'
	__table_args__ = {'autoload' : True}

class MeasurementType(Base):
	__tablename__ = 'MeasurementTypes'
	__table_args__ = {'autoload' : True}

class Observation(Base):
	__tablename__ = 'Observations'
	__table_args__ = {'autoload' : True}
 
class Instrument(Base):
	__tablename__ = 'Instruments'
	__table_args__ = {'autoload' : True}

# =========================
# Define relationships here
# =========================

ObjectReference.refernces = relation(Object,backref='object')
Object.measurements = relation(Measurement,backref='objects')
Object.observations = relation(Observation,backref='objects')

Observation.reference = relation(Reference, backref='observation')   

Measurement.measuretype = relation(MeasurementType, backref='measurements')
Measurement.observation = relation(Observation, backref='measurements')
Measurement.reference = relation(Reference, backref='measurements')

Observation.instruments = relation(Instrument, backref='observations')


#Student.supervisors = relation(Supervisor,
#							   secondary=StudentToSupervisor.__table__,
#							   backref="students")

# Student.clubs = relation(Club,
# 						 secondary=StudentToClub.__table__, # the join table
# 						 primaryjoin=Student.id==StudentToClub.student_id,
# 						 secondaryjoin=StudentToClub.club_id==Club.id, # note that this is the Table, not the object class!
# 						 foreign_keys=[StudentToClub.student_id,StudentToClub.club_id],
# 						 backref="students")
# 
# Student.status = relation(Status,
# 						  primaryjoin=Student.status_id==Status.id,
# 						  foreign_keys=[Student.status_id],
# 						  backref="students")
# 
# Student.supervisors = relation(Supervisor,
# 							   secondary=StudentToSupervisor.__table__,
# 							   primaryjoin=Student.id==StudentToSupervisor.student_id,
# 							   secondaryjoin=StudentToSupervisor.supervisor_id==Supervisor.id,
# 							   foreign_keys=[StudentToSupervisor.student_id, StudentToSupervisor.supervisor_id],
# 							   backref="students")

