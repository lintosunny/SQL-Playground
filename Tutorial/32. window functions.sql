-- Window function: OVER Clause defines the partitioning and ordering of rows (i.e. a window) for the above functions to operate on. 
-- different categories of window functions
-- 1. Aggregate functions: AVG, SUM, COUNT, MIN, MAX etc...
-- 2. Ranking functions: ROW_NUBER, RANK, DENSE_RANK etc...
-- 3. Analytics functions: LEAD, LAG, FIRST_VALUE, LAST_VALUE etc...

-- The OVER clause specifies how this window is framed. It can be based on:
-- 1. PARTITION BY: Dividing the data into subgroups using a specific column before applying the window function.
-- 2. ORDER BY: Defining the order within each partition (e.g., ascending, descending) to influence the window calculations.
-- 3. ROWS or RANGE: limits the rows in partition by specifying start and end points within the partition
--    Default RANGE clause: RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW

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



-- from the first row in the partition to the last row in the partition.
SELECT 
  Name, Gender, Salary,
  AVG(Salary) OVER(ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS Average
FROM employees;

-- Example output
-- +-------+---------+---------+---------+
-- |  Name |  Gender |  Salary | Average |
-- +-------+---------+---------+---------+
-- |  Mark |  Male   | 5000    | 5150    |
-- |  John |  Male   | 4500    | 5150    |
-- |  Pam  |  Female | 5500    | 5150    |
-- |  Sara |  Female | 4000    | 5150    |
-- |  Todd |  Male   | 3500    | 5150    |
-- |  Mary |  Female | 5000    | 5150    |
-- |  Ben  |  Male   | 6500    | 5150    |
-- |  Jodi |  Female | 7000    | 5150    |
-- |  Tom  |  Male   | 5500    | 5150    |
-- |  Ron  |  Male   | 5000    | 5150    |
-- +-------+---------+---------+---------+



-- average salary of 
