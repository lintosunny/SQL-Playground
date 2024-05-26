-- write a query to find the number of gold medals per swimmer for swimmers who only won gold medals.

-- events Table:
-- +-------------+--------------+
-- | Column Name | Type         |
-- +-------------+--------------+
-- | id          | int          |
-- | event       | varchar(255) |
-- | year        | int          |
-- | gold        | varchar(255) |
-- | silver      | varchar(255) |
-- | bronze      | varchar(255) |
-- +-------------+--------------+

-- Example input: events
-- +----+------+-------+--------------------+--------------+---------------+
-- | id | event| year  | gold               | silver       | bronze        |
-- +----+------+-------+--------------------+--------------+---------------+
-- | 1  | 100m | 2016  | Amthhew Mcgarray   | donald       | barbara       |
-- | 2  | 200m | 2016  | Nichole            | Alvaro Eaton | janet Smith   |
-- | 3  | 500m | 2016  | Charles            | Nichole      | Susana        |
-- | 4  | 100m | 2016  | Ronald             | maria        | paula         |
-- | 5  | 200m | 2016  | Alfred             | carol        | Steven        |
-- | 6  | 500m | 2016  | Nichole            | Alfred       | Brandon       |
-- | 7  | 100m | 2016  | Charles            | Dennis       | Susana        |
-- | 8  | 200m | 2016  | Thomas             | Dawn         | catherine     |
-- | 9  | 500m | 2016  | Thomas             | Dennis       | paula         |
-- | 10 | 100m | 2016  | Charles            | Dennis       | Susana        |
-- | 11 | 200m | 2016  | jessica            | Donald       | Stefeney      |
-- | 12 | 500m | 2016  | Thomas             | Steven       | Catherine     |
-- +----+------+-------+--------------------+--------------+---------------+

-- Example Output
+--------------------+-------------+
| player_name        | no_of_gold  |
+--------------------+-------------+
| Amthhew Mcgarray   | 1           |
| Ronald             | 1           |
| Thomas             | 3           |
| Jessica            | 1           |
+--------------------+-------------+


-- Solution 1
SELECT
  gold AS player_name, 
  COUNT(gold) AS no_of_gold
FROM events
WHERE gold NOT IN (
  SELECT silver FROM events 
  UNION ALL 
  SELECT bronze FROM events)
GROUP BY gold;

-- Solution 2
WITH cte_events AS (
  SELECT gold AS player_name, 'gold' AS medal_type FROM events
  UNION ALL
  SELECT silver, 'silver' AS medal_type FROM events
  UNION ALL
  SELECT bronze, 'bronze' AS medal_type FROM events
)

SELECT 
  player_name,
  COUNT(1) AS no_of_gold
FROM cte_events
GROUP BY player_name
HAVING COUNT(DISTINCT medal_type) = 1
  AND MAX(medal_type) = 'gold';
