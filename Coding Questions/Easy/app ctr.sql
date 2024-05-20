-- Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.
-- Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, multiply the CTR by 100.0, not 100.

-- Table: events
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | app_id      | integer  |
-- | event_type  | string   |
-- | timestamp   | datetime |
-- +-------------+----------+

-- Example Input for events Table
-- +--------+------------+---------------------+
-- | app_id | event_type | timestamp           |
-- +--------+------------+---------------------+
-- | 123    | impression | 07/18/2022 11:36:12 |
-- | 123    | impression | 07/18/2022 11:37:12 |
-- | 123    | click      | 07/18/2022 11:37:42 |
-- | 234    | impression | 07/18/2022 14:15:12 |
-- | 234    | click      | 07/18/2022 14:16:12 |
-- +--------+------------+---------------------+

-- Example Output
-- +--------+--------+
-- | app_id | ctr    |
-- +--------+--------+
-- | 123    | 50.00  |
-- | 234    | 100.00 |
-- +--------+--------+


-- Solution
SELECT 
  app_id,
  ROUND(100.0 *
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2) AS ctr
FROM events
WHERE timestamp >= '01-01-2022'
  AND timestamp < '01-01-2023'
GROUP BY app_id;

-- Solution 2
SELECT
  app_id,
  ROUND(100.0 *
    SUM(1) FILTER (WHERE event_type = 'click') /
    SUM(1) FILTER (WHERE event_type = 'impression'), 2) AS ctr
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;
