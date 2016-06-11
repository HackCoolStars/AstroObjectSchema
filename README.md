# StellarDatabase
This is a suggestion of a database schema that can be used to store and share data on stars. It was initiated on the CoolStars19 HackDay in Uppsala, Sweden, on June 11 2016.

## Purpose


## Design Choices

* All table primary keys are called _id_.
* Readability and usability over efficiency.
  * e.g. in-line data instead of
* CamelCase for table names with multiple words
  * Lower-case with underscores for field names

## How to use 

Use [wwwsqldesigner](https://github.com/ondras/wwwsqldesigner) to
make _schema.xml_ into _schema.sql_ which in turn is used to make the empty
_schema.sqlite_ data.

