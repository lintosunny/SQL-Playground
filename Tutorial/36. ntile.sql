-- Distributes the rows into a specified number of groups
-- ORDER BY Clause is required
-- PARTITION BY clause is optional
-- Larger groups come before smaller groups
-- Syntax: NTILE(Number_of_Groups) OVER([PARTITION BY col1, col2, ... ]ORDER BY col1, col2, ...)

-- Table: employees
-- +------+--------+--------+
-- | Name | Gender | Salary |
-- +------+--------+--------+
-- | Todd | Male   | 3500   |
-- | Sara | Female | 4000   |
-- | John | Male   | 4500   |
-- | Mark | Male   | 5000   |
-- | Mary | Female | 5000   |
-- | Ron  | Male   | 5000   |
-- | Tom  | Male   | 5500   |
-- | Pam  | Female | 5500   |
-- | Ben  | Male   | 6500   |
-- | Jodi | Female | 7000   |
-- +------+--------+--------+

-- NTILE function without PARTITION BY clause
SELECT 
  Name,
  Gender,
  Salary,
  NTILE(3) OVER(ORDER BY Salary) AS [Ntile]
FROM employees;

-- Example output
-- +------+--------+--------+-------+
-- | Name | Gender | Salary | Ntile |
-- +------+--------+--------+-------+
-- | Todd | Male   | 3500   | 1     |
-- | Sara | Female | 4000   | 1     |
-- | John | Male   | 4500   | 1     |
-- | Mark | Male   | 5000   | 1     |
-- | Mary | Female | 5000   | 2     |
-- | Ron  | Male   | 5000   | 2     |
-- | Tom  | Male   | 5500   | 2     |
-- | Pam  | Female | 5500   | 3     |
-- | Ben  | Male   | 6500   | 3     |
-- | Jodi | Female | 7000   | 3     |
-- +------+--------+--------+-------+



-- if specifed number of groups more than number of rows
SELECT 
  Name,
  Gender,
  Salary,
  NTILE(11) OVER(ORDER BY Salary) AS [Ntile]
FROM employees;

-- Example output
-- +------+--------+--------+-------+
-- | Name | Gender | Salary | Ntile |
-- +------+--------+--------+-------+
-- | Todd | Male   | 3500   | 1     |
-- | Sara | Female | 4000   | 2     |
-- | John | Male   | 4500   | 3     |
-- | Mark | Male   | 5000   | 4     |
-- | Mary | Female | 5000   | 5     |
-- | Ron  | Male   | 5000   | 6     |
-- | Tom  | Male   | 5500   | 7     |
-- | Pam  | Female | 5500   | 8     |
-- | Ben  | Male   | 6500   | 9     |
-- | Jodi | Female | 7000   | 10    |
-- +------+--------+--------+-------+



-- NTILE function with PARTITION BY clause
SELECT 
  Name,
  Gender,
  Salary,
  NTILE(11) OVER(PARTITION BY Gender ORDER BY Salary) AS [Ntile]
FROM employees;

-- Example output
-- +------+--------+--------+-------+
-- | Name | Gender | Salary | Ntile |
-- +------+--------+--------+-------+
-- | Sara | Female | 4000   | 1     |
-- | Mary | Female | 5000   | 2     |
-- | Pam  | Female | 5500   | 3     |
-- | Jodi | Female | 7000   | 4     |
-- | Todd | Male   | 3500   | 1     |
-- | John | Male   | 4500   | 2     |
-- | Mark | Male   | 5000   | 3     |
-- | Ron  | Male   | 5000   | 4     |
-- | Tom  | Male   | 5500   | 5     |
-- | Ben  | Male   | 6500   | 6     |
-- +------+--------+--------+-------+
