-- write a query to identify all employees who earn more than their direct managers.
-- the result should include employee id and name

-- employee schema
-- +--------------+---------+-----------------------------------------+
-- | column_name  | type    | description                             |
-- +--------------+---------+-----------------------------------------+
-- | employee_id  | integer | The unique ID of the employee.          |
-- | name         | string  | The name of the employee.               |
-- | salary       | integer | The salary of the employee.             |
-- | department_id| integer | The department ID of the employee.      |
-- | manager_id   | integer | The manager ID of the employee.         |
-- +--------------+---------+-----------------------------------------+

-- Example input: employee
-- +--------------+------------------+--------+--------------+-----------+
-- | employee_id  | name             | salary | department_id| manager_id|
-- +--------------+------------------+--------+--------------+-----------+
-- | 1            | Emma Thompson    | 3800   | 1            | 6         |
-- | 2            | Daniel Rodriguez | 2230   | 1            | 7         |
-- | 3            | Olivia Smith     | 7000   | 1            | 8         |
-- | 4            | Noah Johnson     | 6800   | 2            | 9         |
-- | 5            | Sophia Martinez  | 1750   | 1            | 11        |
-- | 6            | Liam Brown       | 13000  | 3            | NULL      |
-- | 7            | Ava Garcia       | 12500  | 3            | NULL      |
-- | 8            | William Davis    | 6800   | 2            | NULL      |
-- +--------------+------------------+--------+--------------+-----------+

-- Example input
-- +--------------+---------------+
-- | employee_id  | employee_name |
-- +--------------+---------------+
-- | 3            | Olivia Smith  |
-- +--------------+---------------+


-- Solution
SELECT E.employee_id, E.name
FROM employee E
INNER JOIN employee M
  ON E.manager_id = M.employee_id
WHERE E.salary > M.salary;
