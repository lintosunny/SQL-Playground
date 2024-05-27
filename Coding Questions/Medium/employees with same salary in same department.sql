-- write a query to return all employees whose salary in same in same department

-- Table: emp_salary
-- +---------+-------------+----------------+
-- | Column  | Type        | NULL/NOT NULL  | 
-- +---------+-------------+----------------+
-- | emp_id  | INTEGER     | NOT NULL       |      
-- | name    | NVARCHAR(20)| NOT NULL       |      
-- | salary  | NVARCHAR(30)| NULL/NOT NULL  |       
-- | dept_id | INTEGER     | NULL/NOT NULL  |     
-- +---------+-------------+----------------+

-- Example input: emp_salary
-- +--------+---------+--------+---------+
-- | emp_id | name    | salary | dept_id |
-- +--------+---------+--------+---------+
-- | 101    | sohan   | 3000   | 11      |
-- | 102    | rohan   | 4000   | 12      |
-- | 103    | mohan   | 5000   | 13      |
-- | 104    | cat     | 3000   | 11      |
-- | 105    | suresh  | 4000   | 12      |
-- | 109    | mahesh  | 7000   | 12      |
-- | 108    | kamal   | 8000   | 11      |
-- +--------+---------+--------+---------+

-- Example output
-- +--------+---------+--------+---------+
-- | emp_id | name    | salary | dept_id |
-- +--------+---------+--------+---------+
-- | 101    | sohan   | 3000   | 11      |
-- | 102    | rohan   | 4000   | 12      |
-- | 104    | cat     | 3000   | 11      |
-- | 105    | suresh  | 4000   | 12      |
-- +--------+---------+--------+---------+


-- Solution
WITH cte_salary AS (
  SELECT id, name, salary, dept_id,
  FROM emp_salary
  GROUP BY dept_id, salary
  HAVING COUNT(1) = 1
)

SELECT id, name, salary, dept_id
FROM emp_salay
LEFT JOIN cte_salary
  ON emp_salary.dept_id = cte_salary.dept_id
  AND emp_salary.salary = cte_salary.dept_id
WHERE cte_salary dept_id IS NULL;
