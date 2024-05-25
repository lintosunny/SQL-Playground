-- joining a table with itself is called as SELF JOIN.
-- SELF JOIN is not a different type of JOIN. 
-- It can be classified under any type of JOIN - INNER, OUTER or CROSS Joins.

-- Table:employee
-- +----+-------+-----------+
-- | ID | Name  | ManagerID |
-- +----+-------+-----------+
-- | 1  | Mike  | 3         |
-- | 2  | Rob   | 1         |
-- | 3  | Todd  | NULL      |
-- | 4  | Ben   | 1         |
-- | 5  | Sam   | 1         |
-- +----+-------+-----------+

-- Query:
Select E.Name as Employee, M.Name as Manager
from employee E
Left Join employee M
On E.ManagerId = M.EmployeeId

-- Expected Output:
-- +----------+----------+
-- | Employee | Manager  |
-- +----------+----------+
-- | Todd     | NULL     |
-- | Mike     | Todd     |
-- | Rob      | Mike     |
-- | Ben      | Mike     |
-- | Sam      | Mike     |
-- +----------+----------+
