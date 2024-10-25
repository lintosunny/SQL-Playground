-- Write a solution to report the total distance traveled by each user.
-- If a user did not take any rides, their traveled distance should be 0.
-- Return the result table ordered by travelled_distance in descending order. If two or more users traveled the same distance, order them by name in ascending order.

-- Table: Users
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 2  | Bob      |
-- | 3  | Alex     |
-- | 4  | Donald   |
-- | 7  | Lee      |
-- | 13 | Jonathan |
-- | 19 | Elvis    |
-- +----+----------+

-- Table: Rides
-- +----+---------+----------+
-- | id | user_id | distance |
-- +----+---------+----------+
-- | 1  | 1       | 120      |
-- | 2  | 2       | 317      |
-- | 3  | 3       | 222      |
-- | 4  | 7       | 100      |
-- | 5  | 13      | 312      |
-- | 6  | 19      | 50       |
-- | 7  | 7       | 120      |
-- | 8  | 19      | 400      |
-- | 9  | 7       | 230      |
-- +----+---------+----------+

-- Expected Output:
-- +----------+--------------------+
-- | name     | travelled_distance |
-- +----------+--------------------+
-- | Elvis    | 450                |
-- | Lee      | 450                |
-- | Bob      | 317                |
-- | Jonathan | 312                |
-- | Alex     | 222                |
-- | Alice    | 120                |
-- | Donald   | 0                  |
-- +----------+--------------------+


-- Solution:
SELECT u.name, ISNULL(SUM(r.distance), 0)
FROM Users u
LEFT JOIN Rides r
  ON t.user_id = r.id
GROUP BY u.name
ORDER BY t.travelled_distance DESC, u.name;
