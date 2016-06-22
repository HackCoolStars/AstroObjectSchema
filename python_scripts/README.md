First of all, massive thank you to Demitri Muna @demitri for providing the sqlalchemy code that has been adapted here.
​
This code requires Dimitri's scicoder module to run:
https://github.com/demitri/scicoder
​
See http://stackoverflow.com/questions/3402168/permanently-add-a-directory-to-pythonpath for details of how to export the module path to python.
​
SQLiteConnection.py is the script that talks to the SQLite database. 
All you need to do in here is change the sqlite_db variable to the filename of your .sqlite file.
​
ModelClasses.py is where the python classes of the database are made and relations between them created. 
This can be edited based on the tables in your database and the foreign keys linking them.
​
import_script.py is the work in progress for populating the database. It reads in both previous scripts and scicoder. 
Currently it just has test entry for an object. 
Next steps is to add more data from a csv file, check querying and check relations.
