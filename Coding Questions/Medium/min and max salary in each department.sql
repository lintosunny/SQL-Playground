-- write a query to find highest and lowest salary employee in each department

-- employee schema
-- +----------+-------------+
-- | column   | type        |
-- +----------+-------------+
-- | emp_name | varchar(10) |
-- | dep_id   | int         |
-- | salary   | int         |
-- +----------+-------------+

-- employee example input
-- +----------+--------+--------+
-- | emp_name | dep_id | salary |
-- +----------+--------+--------+
-- | Siva     | 1      | 30000  |
-- | Ravi     | 2      | 40000  |
-- | Prasad   | 1      | 50000  |
-- | Sai      | 2      | 20000  |
-- +----------+--------+--------+

-- Example output
-- +--------+----------------+---------------+
-- | dep_id | highest_salary | lowest_salary |
-- +--------+----------------+---------------+
-- | 1      | Prasad         | Siva          |
-- | 2      | Ravi           | Sai           |
-- +--------+----------------+---------------+


-- Solution 1
WITH cte_employee AS (
  SELECT 
    dep_id,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
  FROM employee
  GROUP BY dep_id
)

SELECT
  e.dep_id,
  MAX(CASE WHEN salary = max_salary THEN emp_name ELSE NULL END) AS highest_salary,
  MAX(CASE WHEN salary = min_salary THEN emp_name ELSE NULL END) AS lowest_salary
FROM employee e
INNER JOIN cte.employee ce
 ON e.dep_id = ce.dep_id
GROUP BY e.dep_id;

-- Solution 2
WITH cte_employee AS (
  SELECT
    emp_name, dep_id, salary,
    ROW_NUMBER() OVER(PARTITION BY dep_id ORDER BY salary DESC) AS rank_desc,
    ROW_NUMBER() OVER(PARTITION BY dep_id ORDER BY salary) AS rank_asc
  FROM employee
)
  
SELECT 
  dep_id,
  MIN(CASE WHEN rank_desc = 1 THEN emp_name END) AS highest_salary,
  MIN(CASE WHEN rank_asc = 1 THEN emp_name END) AS lowest_salary
FROM ete_employee
GROUP BY dep_id;
  MIN(CASE WHEN rank_desc = 1 THEN emp_name 
