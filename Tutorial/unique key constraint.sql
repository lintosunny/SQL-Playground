-- UNIQUE constraint to enforce uniqueness of a column i.e the column shouldn't allow any duplicate values.

-- To create the unique key using a query:
Alter Table Table_Name
Add Constraint Constraint_Name Unique(Column_Name)

-- What is the difference between Primary key constraint and Unique key constraint?
-- 1. A table can have only one primary key, but more than one unique key
-- 2. Primary key does not allow nulls, where as unique key allows one null
