
-- Google's marketing team is making a Superbowl commercial and needs a simple statistic to put on their TV ad: the median number of searches a person made last year.
-- Write a query to report the median of searches made by a user. Round the median to one decimal point.

-- search_frequency Table:
-- +-------------+-------------+
-- | Column Name | Type        |
-- +-------------+-------------+
-- | searches    | integer     |
-- | num_users   | integer     |
-- +-------------+-------------+

-- search_frequency example input:
-- +---------+----------+
-- | searches| num_users|
-- +---------+----------+
-- | 1       | 2        |
-- | 2       | 2        |
-- | 3       | 3        |
-- | 4       | 1        |
-- +---------+----------+

-- Example output:
-- +--------+
-- | median |
-- +--------+
-- | 2.5    |
-- +--------+

-- By expanding the search_frequency table, we get [1, 1, 2, 2, 3, 3, 3, 4] which has a median of 2.5 searches per user.


-- Solution
WITH searches_expanded AS (
  SELECT searches
  FROM search_frequency
  GROUP BY 
    searches,
    GENERATE_SERIES(1, num_users)
)
SELECT 
  ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (
    ORDER BY searches)::DECIMAL, 1) AS median
FROM searches_expanded;
