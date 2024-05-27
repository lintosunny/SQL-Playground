-- UNION and UNION ALL operators in SQL Server, are used to combine the result-set of two or more SELECT queries

-- input table: Manager
-- +----+------+--------+
-- | Id | Name | Email  |
-- +----+------+--------+
-- | 1  | Raj  | R@R.com|
-- | 2  | Sam  | S@S.com|
-- +----+------+--------+

-- input table: owner
-- +----+------+--------+
-- | Id | Name | Email  |
-- +----+------+--------+
-- | 1  | Bob  | B@B.com|
-- | 2  | Sam  | S@S.com|
-- +----+------+--------+

-- UNION ALL
SELECT Id, Name, Email FROM manager
UNION ALL
SELECT Id, Name, Email FROM owner;
  
-- Example output
-- +----+------+--------+
-- | Id | Name | Email  |
-- +----+------+--------+
-- | 1  | Raj  | R@R.com|
-- | 2  | Sam  | S@S.com|
-- | 3  | Bob  | B@B.com|
-- | 4  | Sam  | S@S.com|
-- +----+------+--------+

-- UNION
SELECT Id, Name, Email FROM manager
UNION
SELECT Id, Name, Email FROM owner;

-- Example output
-- +----+------+--------+
-- | Id | Name | Email  |
-- +----+------+--------+
-- | 1  | Raj  | R@R.com|
-- | 2  | Sam  | S@S.com|
-- | 3  | Bob  | B@B.com|
-- +----+------+--------+


-- ORDER BY caluse should be used on the last SELECT statement
Select Id, Name, Email from tblIndiaCustomers
UNION ALL
Select Id, Name, Email from tblUKCustomers
UNION ALL
Select Id, Name, Email from tblUSCustomers
Order by Name;


-- Differences between UNION and UNION ALL (Common Interview Question)
-- UNION removes duplicate rows, where as UNION ALL does not. 
-- to remove the duplicate rows, UNION performs a distinct sort, which is time consuming. UNION ALL is much faster than UNION. 

-- Difference between JOIN and UNION 
-- UNION combines rows from 2 or more tables, where JOINS combine columns from 2 or more table.
