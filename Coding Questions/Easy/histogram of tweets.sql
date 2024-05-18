-- write a query to obtain a histogram of tweets posted per user in 2022. 
-- Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

-- Table: tweets
-- +-----------+----------+
-- | Column    | Type     |        
-- +-----------+----------+
-- | tweet_id  | integer  |         
-- | user_id   | integer  |        
-- | msg       | string   |       
-- | tweet_date| timestamp|         
-- +-----------+----------+

-- Example input: tweets
-- +---------+---------+-------------------------------------------------------------------+---------------------+
-- | tweet_id| user_id | msg                                                               | tweet_date          |
-- +---------+---------+-------------------------------------------------------------------+---------------------+
-- | 214252  | 111     | Am considering taking Tesla private at $420. Funding secured.     | 12/30/2021 00:00:00 |
-- | 739252  | 111     | Despite the constant negative press covfefe                       | 01/01/2022 00:00:00 |
-- | 846402  | 111     | Following @NickSinghTech on Twitter changed my life!              | 02/14/2022 00:00:00 |
-- | 241425  | 254     | If the salary is so competitive why won’t you tell me what it is? | 03/01/2022 00:00:00 |
-- | 231574  | 148     | I no longer have a manager. I can't be managed                    | 03/23/2022 00:00:00 |
-- +---------+---------+-------------------------------------------------------------------+---------------------+

-- Example Output
-- +--------------+-----------+
-- | tweet_bucket | users_num |
-- +--------------+-----------+
-- | 1            | 2         |
-- | 2            | 1         |
-- +--------------+-----------+


-- Solution
WITH cte_tweets AS (
  SELECT
    user_id,
    COUNT(tweet_id) AS tweet_count
  FROM tweets
  WHERE EXTRACT(YEAR FROM tweet_date) = '2022'
  GROUP BY user_id
)

SELECT
  tweet_count AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM cte_tweets
GROUP BY tweet_count;
