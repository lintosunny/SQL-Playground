-- Returns the sequential number of a row starting at 1
-- ORDER BY clause is required
-- PARTITION BY clause is optional
-- When the data is partitioned, row number is reset to 1 when the partition changes
-- Syntax: ROW_NUMBER() OVER([PARTITION BY col1, col2 ]ORDER BY col1, col2)

-- employees
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


-- ROW_NUBER() without PARTITION BY
SELECT 
  Name,
  Gender,
  Salary,
  ROW_NUMBER() OVER(ORDER BY Gender) AS RowNumber
FROM employees;

-- Example output
-- +--------+--------+--------+----------+
-- | Name   | Gender | Salary | RowNumber|
-- +--------+--------+--------+----------+
-- | Pam    | Female | 5500   | 1        |
-- | Sara   | Female | 4000   | 2        |
-- | Mary   | Female | 5000   | 3        |
-- | Jodi   | Female | 7000   | 4        |
-- | Tom    | Male   | 5500   | 5        |
-- | Ron    | Male   | 5000   | 6        |
-- | Ben    | Male   | 6500   | 7        |
-- | Todd   | Male   | 3500   | 8        |
-- | Mark   | Male   | 5000   | 9        |
-- | John   | Male   | 4500   | 10       |
-- +--------+--------+--------+----------+


-- ROW_NUMBER() with PARTITION BY
SELECT 
  Name,
  Gender,
  Salary,
  ROW_NUMBER() OVER(PARTTION BY Gender ORDER BY Gender) AS RowNumber
FROM employees;

-- Example output
-- +--------+--------+--------+----------+
-- | Name   | Gender | Salary | RowNumber|
-- +--------+--------+--------+----------+
-- | Pam    | Female | 5500   | 1        |
-- | Sara   | Female | 4000   | 2        |
-- | Mary   | Female | 5000   | 3        |
-- | Jodi   | Female | 7000   | 4        |
-- | Tom    | Male   | 5500   | 1        |
-- | Ron    | Male   | 5000   | 2        |
-- | Ben    | Male   | 6500   | 3        |
-- | Todd   | Male   | 3500   | 4        |
-- | Mark   | Male   | 5000   | 5        |
-- | John   | Male   | 4500   | 6        |
-- +--------+--------+--------+----------+
