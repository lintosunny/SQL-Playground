-- FIRST_VALUE: Retrieves the first value from the specified column
-- LAST_VALUE: Retrieves the last value from the specified column

-- Table: employees
-- +----+------+--------+--------+
-- | Id | Name | Gender | Salary |
-- +----+------+--------+--------+
-- | 8  | Jodi | Female | 8000   |
-- | 6  | Mary | Female | 6000   |
-- | 4  | Sara | Female | 4000   |
-- | 3  | Pam  | Female | 3000   |
-- | 10 | Ron  | Male   | 9500   |
-- | 9  | Tom  | Male   | 9000   |
-- | 7  | Ben  | Male   | 7000   |
-- | 5  | Todd | Male   | 5000   |
-- | 2  | John | Male   | 2000   |
-- | 1  | Mark | Male   | 1000   |
-- +----+------+--------+--------+

-- Query
SELECT
  Id, Name, Gender, Salary,
  FIRST_VALUE(NAME) OVER(PARTITION BY Gender ORDER BY Salary) AS FirstValue,
  LAST_VALUE(NAME) OVER(PARTITION BY Gender ORDER BY Salary) AS LastValue
FROM employees;

-- Example output
-- +----+------+--------+--------+-------------+------------+
-- | Id | Name | Gender | Salary | FirstValue  | LastValue  |
-- +----+------+--------+--------+-------------+------------+
-- | 8  | Jodi | Female | 8000   | Jodi        | Pam        |
-- | 6  | Mary | Female | 6000   | Jodi        | Pam        |
-- | 4  | Sara | Female | 4000   | Jodi        | Pam        |
-- | 3  | Pam  | Female | 3000   | Jodi        | Pam        |
-- | 10 | Ron  | Male   | 9500   | Ron         | Mark       |
-- | 9  | Tom  | Male   | 9000   | Ron         | Mark       |
-- | 7  | Ben  | Male   | 7000   | Ron         | Mark       |
-- | 5  | Todd | Male   | 5000   | Ron         | Mark       |
-- | 2  | John | Male   | 2000   | Ron         | Mark       |
-- | 1  | Mark | Male   | 1000   | Ron         | Mark       |
-- +----+------+--------+--------+-------------+------------+
