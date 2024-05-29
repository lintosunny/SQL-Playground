-- Returns a rank starting at 1 based on the ordering of rows imposed by the ORDER BY clause
-- ORDER BY clause is required
-- PARTITION BY clause is optional
-- When the data is partitioned, rank is reset to 1 when the partition changes

-- Syntax: RANK() OVER([PARTITION BY col1, col2, ... ]ORDER BY col1, col2, ...)
-- Example: RANK() returns 1, 1, 3, 4, 5

-- Syntax: DENSE_RANK() OVER([PARTITION BY col1, col2, ... ]ORDER BY col1, col2, ...)
-- Example: DESE_RANK() returns 1, 1, 2, 3, 4

-- Table: employees
-- +----+------+--------+--------+
-- | Id | Name | Gender | Salary |
-- +----+------+--------+--------+
-- | 1  | Mark | Male   | 8000   |
-- | 2  | John | Male   | 8000   |
-- | 3  | Pam  | Female | 5000   |
-- | 4  | Sara | Female | 4000   |
-- | 5  | Todd | Male   | 3500   |
-- | 6  | Mary | Female | 6000   |
-- | 7  | Ben  | Male   | 6500   |
-- | 8  | Jodi | Female | 4500   |
-- | 9  | Tom  | Male   | 7000   |
-- | 10 | Ron  | Male   | 6800   |
-- +----+------+--------+--------+

-- Query
SELECT 
  Name,
  Gender,
  Salary,
  RANK() OVER (ORDER BY Salary DESC) AS [Rank],
  DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRank
FROM employees;

-- Example output
-- +----+------+--------+--------+--------+--------------+
-- | Id | Name | Gender | Salary | Rank   | DenseRank    |
-- +----+------+--------+--------+--------+--------------+
-- | 1  | Mark | Male   | 8000   | 1      | 1            |
-- | 2  | John | Male   | 8000   | 1      | 1            |
-- | 9  | Tom  | Male   | 7000   | 3      | 2            |
-- | 10 | Ron  | Male   | 6800   | 4      | 3            |
-- | 7  | Ben  | Male   | 6500   | 5      | 4            |
-- | 6  | Mary | Female | 6000   | 6      | 5            |
-- | 3  | Pam  | Female | 5000   | 7      | 6            |
-- | 8  | Jodi | Female | 4500   | 8      | 7            |
-- | 4  | Sara | Female | 4000   | 9      | 8            |
-- | 5  | Todd | Male   | 3500   | 10     | 9            |
-- +----+------+--------+--------+--------+--------------+
