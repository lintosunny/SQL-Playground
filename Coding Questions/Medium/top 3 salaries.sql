-- Write a query to display the employee's name along with their department name and salary. 
-- In case of duplicates, sort the results by department ID and salary in descending order. 
-- If multiple employees have the same salary, then order them alphabetically.

-- employee Schema:
-- +--------------+--------+------------------------------------------+
-- | column_name  | type   | description                              |
-- +--------------+--------+------------------------------------------+
-- | employee_id  | integer| The unique ID of the employee.           |
-- | name         | string | The name of the employee.                |
-- | salary       | integer| The salary of the employee.              |
-- | department_id| integer| The department ID of the employee.       |
-- +--------------+--------+------------------------------------------+

-- employee Example Input:
-- +--------------+------------------+--------+--------------+
-- | employee_id  | name             | salary | department_id|
-- +--------------+------------------+--------+--------------+
-- | 1            | Emma Thompson    | 3800   | 1            |
-- | 2            | Daniel Rodriguez | 2230   | 1            |
-- | 3            | Olivia Smith     | 2000   | 1            |
-- | 4            | Noah Johnson     | 6800   | 2            |
-- | 5            | Sophia Martinez  | 1750   | 1            |
-- | 6            | Liam Brown       | 13000  | 3            |
-- | 7            | Ava Garcia       | 12500  | 3            |
-- | 8            | William Davis    | 6800   | 2            |
-- | 9            | Isabella Wilson  | 11000  | 3            |
-- | 10           | James Anderson   | 4000   | 1            |
-- +--------------+------------------+--------+--------------+

-- department Schema:
-- +--------------+--------+-----------------------------------+
-- | column_name  | type   | description                       |
-- +--------------+--------+-----------------------------------+
-- | department_id| integer| The department ID of the employee.|
-- | name         | string | The name of the department.       |
-- +--------------+--------+-----------------------------------+

-- department Example Input:
-- +--------------+------------------+
-- | department_id| department_name  |
-- +--------------+------------------+
-- | 1            | Data Analytics   |
-- | 2            | Data Science     |
-- +--------------+------------------+

-- Example Output:
-- +----------------+------------------+--------+
-- | department_name| name             | salary |
-- +----------------+------------------+--------+
-- | Data Analytics | Daniel Rodriguez | 2230   |
-- | Data Analytics | Emma Thompson    | 3800   |
-- | Data Analytics | James Anderson   | 4000   |
-- | Data Science   | Noah Johnson     | 6800   |
-- | Data Science   | William Davis    | 6800   |
-- +----------------+------------------+--------+


-- Solution 1
WITH cte_employee AS (
  SELECT
    department_name,
    name,
    salary,
    DENSE_RANK() OVER(
      PARTITION BY department_name
      ORDER BY salary DESC) AS salary_rank
  FROM employee 
  LEFT JOIN department
    ON employee.department_id = department.department_id
  ORDER BY employee.department_id, salary DESC, name
)

SELECT
  department_name,
  name,
  salary
FROM cte_employee
WHERE salary_rank <= 3;

-- Solution 2
WITH ranked_salary AS (
  SELECT 
    name,
    salary,
    department_id,
    DENSE_RANK() OVER (
      PARTITION BY department_id ORDER BY salary DESC) AS ranking
  FROM employee
)

SELECT 
  d.department_name,
  rs.name,
  rs.salary
FROM ranked_salary AS rs
INNER JOIN department AS d
  ON rs.department_id = d.department_id
WHERE rs.ranking <= 3
ORDER BY d.department_id, rs.salary DESC, rs.name ASC;