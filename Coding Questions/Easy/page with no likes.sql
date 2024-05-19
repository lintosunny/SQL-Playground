-- Write a query to return the IDs of the Facebook pages that have zero likes. The output should be sorted in ascending order based on the page IDs.

-- Table: pages
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | page_id     | integer  |
-- | page_name   | varchar  |
-- +-------------+----------+

-- Example Input for pages Table
-- +---------+-----------------------+
-- | page_id | page_name             |
-- +---------+-----------------------+
-- | 20001   | SQL Solutions         |
-- | 20045   | Brain Exercises       |
-- | 20701   | Tips for Data Analysts|
-- +---------+-----------------------+

-- Table: page_likes
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | user_id     | integer  |
-- | page_id     | integer  |
-- | liked_date  | datetime |
-- +-------------+----------+

-- Example Input for page_likes Table
-- +---------+---------+---------------------+
-- | user_id | page_id | liked_date          |
-- +---------+---------+---------------------+
-- | 111     | 20001   | 04/08/2022 00:00:00 |
-- | 121     | 20045   | 03/12/2022 00:00:00 |
-- | 156     | 20001   | 07/25/2022 00:00:00 |
-- +---------+---------+---------------------+

-- Example Output
-- +---------+
-- | page_id |
-- +---------+
-- | 20701   |
-- +---------+


-- Solution 1
SELECT pages.page_id
FROM pages
LEFT OUTER JOIN page_likes AS likes
  ON pages.page_id = likes.page_id
WHERE likes.page_id IS NULL;

-- Solution 2
SELECT page_id
FROM pages
EXCEPT
SELECT page_id
FROM page_likes;

-- solution 3
SELECT page_id
FROM pages
WHERE page_id NOT IN (
  SELECT page_id
  FROM page_likes
  WHERE page_id IS NOT NULL
);

-- Solution 4
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id
;)
