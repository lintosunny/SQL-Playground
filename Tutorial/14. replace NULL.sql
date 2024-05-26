-- How to replace NULL?
-- 1. ISNULL()
-- 2. CASE
-- 3. COALESCE()

-- department table:
-- +----------+----------+
-- | employee | manager  |
-- +----------+----------+
-- | Todd     | NULL     |
-- | Mike     | Todd     |
-- | Rob      | Mike     |
-- | Ben      | Mike     |
-- | Sam      | Mike     |
-- +----------+----------+

-- Replacing NULL value using ISNULL() function:
SELECT employee, ISNULL(manager, 'No Manager') AS manager
FROM department;

-- Replacing NULL value using CASE Statement:
SELECT employee, CASE WHEN manager IS NULL THEN 'No Manager' ELSE manager END AS manager
FROM department;

-- Replacing NULL value using COALESCE() function: 
-- COALESCE() function, returns the first NON NULL value.
SELECT employee, COALESCE(manager, 'No Manager') AS manager
FROM department;

-- Example output
-- +----------+----------------+
-- | employee | manager        |
-- +----------+----------------+
-- | Todd     | No Manager     |
-- | Mike     | Todd           |
-- | Rob      | Mike           |
-- | Ben      | Mike           |
-- | Sam      | Mike           |
-- +----------+----------------+
