-- Table: employees
-- +----+------+--------+--------+
-- | Id | Name | Gender | Salary |
-- +----+------+--------+--------+
-- | 1  | Mark | Male   | 5000   |
-- | 2  | John | Male   | 4500   |
-- | 3  | Pam  | Female | 5500   |
-- | 4  | Sara | Female | 4000   |
-- | 5  | Todd | Male   | 3500   |
-- | 6  | Mary | Female | 5000   |
-- | 7  | Ben  | Male   | 6500   |
-- | 8  | Jodi | Female | 7000   |
-- | 9  | Tom  | Male   | 5500   |
-- | 10 | Ron  | Male   | 5000   |
-- +----+------+--------+--------+

-- SQL Query to compute running total without partitions
SELECT 
  Name,
  Gender,
  Salary,
  SUM(Salary) OVER(ORDER BY Id) AS RunningTotal
FROM employees;

-- Example output
-- +------+--------+--------+---------------+
-- | Name | Gender | Salary | RunningTotal  |
-- +------+--------+--------+---------------+
-- | Mark | Male   | 5000   | 5000          |
-- | John | Male   | 4500   | 9500          |
-- | Pam  | Female | 5500   | 15000         |
-- | Sara | Female | 4000   | 19000         |
-- | Todd | Male   | 3500   | 22500         |
-- | Mary | Female | 5000   | 27500         |
-- | Ben  | Male   | 6500   | 34000         |
-- | Jodi | Female | 7000   | 41000         |
-- | Tom  | Male   | 5500   | 46500         |
-- | Ron  | Male   | 5000   | 51500         |
-- +------+--------+--------+---------------+



-- SQL Query to compute running total with partitions
SELECT 
  Name,
  Gender,
  Salary,
  SUM(Salary) OVER(PARTITION BY Gender ORDER BY Id) AS RunningTotal
FROM employees;

-- Example output
-- +------+--------+--------+---------------+
-- | Name | Gender | Salary | RunningTotal  |
-- +------+--------+--------+---------------+
-- | Pam  | Female | 5500   | 5500          |
-- | Sara | Female | 4000   | 9500          |
-- | Mary | Female | 5000   | 14500         |
-- | Jodi | Female | 7000   | 21500         |
-- | Mark | Male   | 5000   | 5000          |
-- | John | Male   | 4500   | 9500          |
-- | Todd | Male   | 3500   | 13000         |
-- | Ben  | Male   | 6500   | 19500         |
-- | Tom  | Male   | 5500   | 25000         |
-- | Ron  | Male   | 5000   | 30000         |
-- +------+--------+--------+---------------+



-- What happens if I use order by on Salary column
SELECT 
  Name,
  Gender,
  Salary,
  SUM(Salary) OVER(ORDER BY Salary) AS RunningTotal
FROM employees;

-- Example output
-- +------+--------+--------+---------------+
-- | Name | Gender | Salary | RunningTotal  |
-- +------+--------+--------+---------------+
-- | Todd | Male   | 3500   | 3500          |
-- | Sara | Female | 4000   | 7500          |
-- | John | Male   | 4500   | 12000         |
-- | Mark | Male   | 5000   | 27000         |
-- | Mary | Female | 5000   | 27000         |
-- | Ron  | Male   | 5000   | 27000         |
-- | Tom  | Male   | 5500   | 32500         |
-- | Pam  | Female | 5500   | 38000         |
-- | Ben  | Male   | 6500   | 44500         |
-- | Jodi | Female | 7000   | 51500         |
-- +------+--------+--------+---------------+
