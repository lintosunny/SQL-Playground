-- Indexes are used by queries to find data from tables quickly. Indexes are created on tables and views.
-- Very similar to index we see on books.
-- Table scan: If there is no index to help the query, then the query engine, checks every row in the table from the beginning to the end.
-- Index seek: SQL picks up the row addresses from the index and directly fetch the records from the table, rather than table scan.

-- Create index
CREATE INDEX IX_employee_salary
ON employee(salary DESC);

-- View index
EXECUTE sp_helptext employee

-- Delete index
DROP INDEX employee.IX_employee_salary

-- Types of indexes
-- 1. clustered index
-- 2. non-clustered index
-- 3. unique index
-- 4. non-unique index

-- Advantages
-- 1. improved performance of SELECT query
-- 2. improved processing time for queries

-- Disadvantages
-- 1. Additional disk space
-- 2. INSERT, UPDATE, and DELETE statement can become slow
