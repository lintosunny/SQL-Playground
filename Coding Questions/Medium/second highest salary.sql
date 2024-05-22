-- Write a query to find second highest salary among all employees.
-- In case of duplicate, display the salary only once.

-- employees Schema:
-- +--------------+--------+------------------------------------+
-- | column_name  | type   | description                        |
-- +--------------+--------+------------------------------------+
-- | employee_id  | integer| The unique ID of the employee.     |
-- | salary       | integer| The salary of the employee.        |
-- +--------------+--------+------------------------------------+

-- employees Example Input:
-- +--------------+--------+
-- | employee_id  | salary |
-- +--------------+--------+
-- | 1            | 2500   |
-- | 2            | 800    |
-- | 3            | 1000   |
-- +--------------+--------+

-- Example Output:
-- +-----------------------+
-- | second_highest_salary |
-- +-----------------------+
-- | 1000                  |
-- +-----------------------+


-- Solution 1
WITH cte_employees AS (  
  SELECT
    salary,
    DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
  FROM employees
)

SELECT DISTINCT salary
FROM cte_employees
WHERE salary_rank = 2;

-- Solution 2
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);