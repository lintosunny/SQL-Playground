-- The OVER clause in SQL is used in conjunction with window functions to perform calculations on a specific set of rows, called a window.
-- The OVER clause specifies how this window is framed. It can be based on:
-- 1. Partitions: Dividing the data into subgroups using a specific column before applying the window function.
-- 2. Ordering: Defining the order within each partition (e.g., ascending, descending) to influence the window calculations.

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

-- Query
SELECT 
  Gender,
  COUNT(*) OVER(PARTITION BY Gender) AS 'Gender Total',
  AVG(Salary)  OVER(PARTITION BY Gender) AS AvgSal,
  MIN(Salary) OVER(PARTITION BY Gender) AS MinSal,
  MAX(Salary) OVER(PARTITION BY Gender) AS MaxSal
FROM employees
GROUP BY Gender;

-- Example output
-- +--------+--------------+--------+--------+--------+
-- | Gender | Gender Total | AvgSal | MinSal | MaxSal |
-- +--------+--------------+--------+--------+--------+
-- | Female |       4      |  5375  |  4000  |  7000  |
-- |  Male  |       6      |  5000  |  3500  |  6500  |
-- +--------+--------------+--------+--------+--------+
