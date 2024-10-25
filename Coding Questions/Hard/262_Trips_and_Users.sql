-- The cancellation rate is computed by dividing the number of canceled (by client or driver) 
-- requests with unbanned users by the total number of requests with unbanned users on that day.
-- Write a solution to find the cancellation rate of requests with unbanned users (both 
-- client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". 
-- Round Cancellation Rate to two decimal points.

-- Trips Table:
-- +----+-----------+-----------+---------+---------------------+------------+
-- | id | client_id | driver_id | city_id | status              | request_at |
-- +----+-----------+-----------+---------+---------------------+------------+
-- | 1  | 1         | 10        | 1       | completed           | 2013-10-01 |
-- | 2  | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
-- | 3  | 3         | 12        | 6       | completed           | 2013-10-01 |
-- | 4  | 4         | 13        | 6       | cancelled_by_client | 2013-10-01 |
-- | 5  | 1         | 10        | 1       | completed           | 2013-10-02 |
-- | 6  | 2         | 11        | 6       | completed           | 2013-10-02 |
-- | 7  | 3         | 12        | 6       | completed           | 2013-10-02 |
-- | 8  | 2         | 12        | 12      | completed           | 2013-10-03 |
-- | 9  | 3         | 10        | 12      | completed           | 2013-10-03 |
-- | 10 | 4         | 13        | 12      | cancelled_by_driver | 2013-10-03 |
-- +----+-----------+-----------+---------+---------------------+------------+

-- Users Table:
-- +----------+--------+--------+
-- | users_id | banned | role   |
-- +----------+--------+--------+
-- | 1        | No     | client |
-- | 2        | Yes    | client |
-- | 3        | No     | client |
-- | 4        | No     | client |
-- | 10       | No     | driver |
-- | 11       | No     | driver |
-- | 12       | No     | driver |
-- | 13       | No     | driver |
-- +----------+--------+--------+

-- Example Output:
-- +------------+-------------------+
-- | Day        | Cancellation Rate |
-- +------------+-------------------+
-- | 2013-10-01 | 0.33              |
-- | 2013-10-02 | 0.00              |
-- | 2013-10-03 | 0.50              |
-- +------------+-------------------+


-- Solution
SELECT 
  request_at AS Day,
  ROUND(1 - (COUNT(CASE WHEN status = "completed" THEN 1 END) * 1.0 / COUNT(*)), 2) AS `Cancellation Rate`
FROM Trips t
LEFT JOIN Users u1
  ON u1.users_id = t.client_id
LEFT JOIN Users u2
  ON u2.users_id = t.driver_id
WHERE request_at BETWEEN "2013-10-01" AND "2013-10-03"
    AND (u2.banned = "No" AND u1.banned = "No")
GROUP BY request_at;
