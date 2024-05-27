-- write a query to find the total number of people present inside the hospital

-- hospital Table:
-- +-------------+--------------+
-- | Column Name | Type         |
-- +-------------+--------------+
-- | emp_id      | int          |
-- | action      | varchar(10)  |
-- | time        | datetime     |
-- +-------------+--------------+

-- Example input: hospital
-- +--------+--------+---------------------+
-- | emp_id | loc    | time                |
-- +--------+--------+---------------------+
-- | 1      | in     | 2019-12-22 09:00:00 |
-- | 1      | out    | 2019-12-22 09:15:00 |
-- | 2      | in     | 2019-12-22 09:00:00 |
-- | 2      | out    | 2019-12-22 09:15:00 |
-- | 2      | in     | 2019-12-22 09:30:00 |
-- | 3      | out    | 2019-12-22 09:00:00 |
-- | 3      | in     | 2019-12-22 09:15:00 |
-- | 3      | out    | 2019-12-22 09:30:00 |
-- | 3      | in     | 2019-12-22 09:45:00 |
-- | 4      | in     | 2019-12-22 09:45:00 |
-- | 5      | out    | 2019-12-22 09:40:00 |
-- +--------+--------+---------------------+

-- Example output
-- +-----------------------------+
-- | no_of_people_present_inside |
-- +-----------------------------+
-- | 2                           |
-- +-----------------------------+


-- Solution 1
WITH cte_time AS (
  SELECT emp_id, loc max(time)
  FROM hospital
  GROUP BY emp_id
)
SELECT COUNT(emp_id)
FROM cte_time
WHERE loc = 'in';

-- solution 2
WITH cte_having AS (
  SELECT
    emp_id,
    MAX(CASE WHEN loc = 'in' THEN time END) AS intime,
    MAX(CASE WHEN loc = 'out' THEN time END) AS outtime
  FROM hospital
  GROUP BY emp_id
  HAVING MAX(CASE WHEN loc = 'in' THEN time END) > MAX(CASE WHEN loc = 'out' THEN time END)
    OR MAX(CASE WHEN loc = 'out' THEN time END) IS NULL
)

SELECT COUNT(emp_id)
FROM cte_having
WHERE intime > outtime
  OR outtime IS NULL; 
