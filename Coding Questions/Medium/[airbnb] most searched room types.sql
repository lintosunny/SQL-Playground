-- write a query to find the room types that are searched most number of times.
-- output the room type alongside the number of searches for it.
-- if the filter for room types has more than one room type, consider each unique room type as a separate row.
-- sort results based on the number of searches in the ascending order.

-- Table: searches
-- +-------------------+-------------+
-- | Column Name       | Type        |
-- +-------------------+-------------+
-- | user_id           | int         |
-- | date_searched     | date        |
-- | filter_room_types | varchar(200)|
-- +-------------------+-------------+

-- Example input: searches
-- +----+------------+-----------------------------+
-- | id | search_date| room_types                  |
-- +----+------------+-----------------------------+
-- | 1  | 2022-01-01 | entire home,private room    |
-- | 2  | 2022-01-02 | entire home,shared room     |
-- | 3  | 2022-01-02 | private room,shared room    |
-- | 4  | 2022-01-03 | private room                |
-- +----+------------+-----------------------------+

-- Example output
-- +--------------+-----------------+
-- | room_type    | no_of_searches  |
-- +--------------+-----------------+
-- | entire home  | 2               |
-- | private room | 3               |
-- | shared room  | 2               |
-- +--------------+-----------------+


-- Solution
SELECT 
  VALUE AS room_type,
  COUNT(1) AS no_of_searches
FROM searches
CROSS APPLY STRING_SPLIT(room_types, ',')
GROUP BY VALUE
ORDER BY no_of_searches DESC;
