--  COALESCE() returns the first Non NULL value.

-- input table: employee
-- +----+-----------+------------+----------+
-- | Id | FirstName | MiddleName | LastName |
-- +----+-----------+------------+----------+
-- | 1  | Sam       | NULL       | NULL     |
-- | 2  | NULL      | Todd       | Tanzan   |
-- | 3  | NULL      | NULL       | Sara     |
-- | 4  | Ben       | Parker     | NULL     |
-- | 5  | James     | Nick       | Nancy    |
-- +----+-----------+------------+----------+

-- Query:
SELECT Id, COALESCE(FirstName, MiddleName, LastName) AS Name
FROM employees;

-- Example output
-- +----+-----------+
-- | Id |      Name |
-- +----+-----------+
-- | 1  | Sam       |
-- | 2  | Todd      | 
-- | 3  | Sara      |
-- | 4  | Ben       | 
-- | 5  | James     | 
-- +----+-----------+
