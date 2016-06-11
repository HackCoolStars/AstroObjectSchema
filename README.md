# StellarDatabase
This is a suggestion of a database schema that can be used to store and share data on stars. It was initiated on the CoolStars19 HackDay in Uppsala, Sweden, on June 11 2016.

## Purpose

## Table Descriptions

- Objects. 
  - This is the primary table. 
  - One row per object including decimal right ascension and declination and object name.

- Measurements + MeasurementTypes
  - One row per measurement value and uncertainty. 
  - For example, photometry, spectral types, abundances measurements.

- Observations + Instruments
  - One row per observation including observation date, telescope, instrument, etc.

- ObjectReferences
  - Citation history of objects.

- References
  - Reference lookup table. For example, ADS info and bibtex.

## How to use 

Use [wwwsqldesigner](https://github.com/ondras/wwwsqldesigner) to
make _schema.xml_ into _schema.sql_ which in turn is used to make the empty
_schema.sqlite_ data.

