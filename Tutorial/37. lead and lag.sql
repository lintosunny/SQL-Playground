-- LEAD function is used to access subsequent row data along with current row data
-- Syntax: LEAD(Column_Name, Offset, Default_Value) OVER ([PARTITION BY col1, col2, ... ]ORDER BY Col1, Col2, ...)

-- LAG function is used to access previous row data along with current row data
-- Syntax: LAG(Column_Name, Offset, Default_Value) OVER ([PARTITION BY col1, col2, ... ]ORDER BY Col1, Col2, ...)

-- Offset - Number of rows to lead or lag.
-- Default_Value - Value to return if the number of rows goes beyond the first or last row in a table or partition. default value is  NULL.
-- ORDER BY clause is required
-- PARTITION BY clause is optional

-- Table: employees
-- +----+------+--------+--------+
-- | Id | Name | Gender | Salary |
-- +----+------+--------+--------+
-- | 1  | Mark | Male   | 1000   |
-- | 2  | John | Male   | 2000   |
-- | 3  | Pam  | Female | 3000   |
-- | 4  | Sara | Female | 4000   |
-- | 5  | Todd | Male   | 5000   |
-- | 6  | Mary | Female | 6000   |
-- | 7  | Ben  | Male   | 7000   |
-- | 8  | Jodi | Female | 8000   |
-- | 9  | Tom  | Male   | 9000   |
-- | 10 | Ron  | Male   | 9500   |
-- +----+------+--------+--------+



-- LEAD and LEAG without PARTITION BY
SELECT 
  Name,
  Gender,
  Salary,
  LEAD(Salary, 2, -1) OVER(ORDER BY Salary) AS Lead_2,
  LAG(Salary, 1, -1) OVER(ORDER BY Sales) AS Lag_1
FROM employees;

-- Example output
-- +------+--------+--------+--------+-------+
-- | Name | Gender | Salary | Lead_2 | Lag_1 |
-- +------+--------+--------+--------+-------+
-- | Mark | Male   | 1000   | 3000   | -1    |
-- | John | Male   | 2000   | 4000   | 1000  |
-- | Pam  | Female | 3000   | 5000   | 2000  |
-- | Sara | Female | 4000   | 6000   | 3000  |
-- | Todd | Male   | 5000   | 7000   | 4000  |
-- | Mary | Female | 6000   | 8000   | 5000  |
-- | Ben  | Male   | 7000   | 9000   | 6000  |
-- | Jodi | Female | 8000   | 9500   | 7000  |
-- | Tom  | Male   | 9000   | -1     | 8000  |
-- | Ron  | Male   | 9500   | -1     | 9000  |
-- +------+--------+--------+--------+-------+



-- LEAD and LEAG without PARTITION BY
SELECT 
  Name,
  Gender,
  Salary,
  LEAD(Salary, 2, -1) OVER(PARTITION BY Gender ORDER BY Salary) AS Lead_2,
  LAG(Salary, 1, -1) OVER(PARTITION BY Gender ORDER BY Sales) AS Lag_1
FROM employees;

-- Example output
-- +------+--------+--------+--------+-------+
-- | Name | Gender | Salary | Lead_2 | Lag_1 |
-- +------+--------+--------+--------+-------+
-- | Pam  | Female | 3000   | 6000   | -1    |
-- | Sara | Female | 4000   | 8000   | 3000  |
-- | Mary | Female | 6000   | -1     | 4000  |
-- | Jodi | Female | 8000   | -1     | 6000  |
-- | Mark | Male   | 1000   | 5000   | -1    |
-- | John | Male   | 2000   | 7000   | 1000  |
-- | Todd | Male   | 5000   | 9000   | 2000  |
-- | Ben  | Male   | 7000   | 9500   | 5000  |
-- | Tom  | Male   | 9000   | -1     | 7000  |
-- | Ron  | Male   | 9500   | -1     | 9000  |
-- +------+--------+--------+--------+-------+
