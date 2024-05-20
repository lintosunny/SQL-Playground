-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership

-- Table: viewership
-- +-------------+--------------------------------------+
-- | Column Name | Type                                 |
-- +-------------+--------------------------------------+
-- | user_id     | integer                              |
-- | device_type | string ('laptop', 'tablet', 'phone') |
-- | view_time   | timestamp                            |
-- +-------------+--------------------------------------+

-- Example Input for viewership Table
-- +---------+-------------+---------------------+
-- | user_id | device_type | view_time           |
-- +---------+-------------+---------------------+
-- | 123     | tablet      | 01/02/2022 00:00:00 |
-- | 125     | laptop      | 01/07/2022 00:00:00 |
-- | 128     | laptop      | 02/09/2022 00:00:00 |
-- | 129     | phone       | 02/09/2022 00:00:00 |
-- | 145     | tablet      | 02/24/2022 00:00:00 |
-- +---------+-------------+---------------------+

-- Example Output
-- +--------------+--------------+
-- | laptop_views | mobile_views |
-- +--------------+--------------+
-- | 2            | 3            |
-- +--------------+--------------+


-- Solution
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;
