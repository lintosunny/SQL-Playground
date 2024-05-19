-- Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table.
-- Display the top 5 artist names in ascending order, along with their song appearance ranking.
-- If two or more artists have the same number of song appearances.
-- They should be assigned the same ranking, and the rank numbers should be continuous (i.e. 1, 2, 2, 3, 4, 5)

-- artists Table:
-- +-----------+--------------+
-- | Column Name | Type       | 
-- +-------------+------------+
-- | artist_id   | integer    |              
-- | artist_name | varchar    |              
-- | label_owner | varchar    |              
-- +-------------+------------+

-- artists Example Input:
-- +-----------+--------------+---------------------+
-- | artist_id | artist_name  | label_owner         |
-- +-----------+--------------+---------------------+
-- | 101       | Ed Sheeran   | Warner Music Group  |
-- | 120       | Drake        | Warner Music Group  |
-- | 125       | Bad Bunny    | Rimas Entertainment |
-- +-----------+--------------+---------------------+

-- songs Table:
-- +-------------+--------------+
-- | Column Name |    Type      |          
-- +-------------+--------------+
-- | song_id     | integer      |          
-- | artist_id   | integer      |          
-- | name        | varchar      |          
-- +-------------+--------------+

-- songs Table:
-- +---------+-----------+------------------+
-- | song_id | artist_id | name             |
-- +---------+-----------+------------------+
-- | 55511   | 101       | Perfect          |
-- | 45202   | 101       | Shape of You     |
-- | 22222   | 120       | One Dance        |
-- | 19960   | 120       | Hotline Bling    |
-- +---------+-----------+------------------+

-- global_song_rank Table:
-- +-------------+-----------------------+
-- | Column Name |    Type               |
-- +-------------+-----------------------+
-- | day         | integer (1-52)        |
-- | song_id     | integer               |
-- | rank        | integer (1-1,000,000) |
-- +-------------+-----------------------+

-- global_song_rank Table:
-- +-----+---------+------+
-- | day | song_id | rank |
-- +-----+---------+------+
-- | 1   | 45202   | 5    |
-- | 3   | 45202   | 2    |
-- | 1   | 19960   | 3    |
-- | 9   | 19960   | 15   |
-- +-----+---------+------+

-- Example Output:
-- +-------------+-------------+
-- | artist_name | artist_rank |
-- +-------------+-------------+
-- | Ed Sheeran  | 1           |
-- | Drake       | 2           |
-- +-------------+-------------+


-- Solution
WITH cte_top10 AS (
  SELECT
    artists.artist_name,
    DENSE_RANK() OVER(ORDER BY COUNT(global_song_rank.rank) DESC) AS artist_rank
  FROM artists
  INNER JOIN songs
    ON artists.artist_id = songs.artist_id
  INNER JOIN global_song_rank
    ON songs.song_id = global_song_rank.song_id
  WHERE global_song_rank.rank <= 10
  GROUP BY artists.artist_name
  ORDER BY artist_rank DESC
)

SELECT 
  artist_name,
  artist_rank
FROM cte_top10
WHERE artist_rank <= 5
ORDER BY artist_rank;