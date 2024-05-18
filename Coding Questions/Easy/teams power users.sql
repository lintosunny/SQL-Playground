-- Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022.
-- Display the IDs of these 2 users along with the total number of messages they sent.
-- Output the results in descending order based on the count of the messages.
-- Assumption: No two users have sent the same number of messages in August 2022.

-- Table: messages
-- +-------------+-------------+
-- | Column Name | Type        |
-- +-------------+-------------+
-- | message_id  | integer     |
-- | sender_id   | integer     |
-- | receiver_id | integer     |
-- | content     | varchar     |
-- | sent_date   | datetime    |
-- +-------------+-------------+

-- Example Input:
-- +------------+-----------+-------------+--------------------------+---------------------+
-- | message_id | sender_id | receiver_id | content                  | sent_date           |
-- +------------+-----------+-------------+--------------------------+---------------------+
-- | 901        | 3601      | 4500        | "You up?"                | 2022-08-03 00:00:00 |
-- | 902        | 4500      | 3601        | "Only if you're buying"  | 2022-08-03 00:00:00 |
-- | 743        | 3601      | 8752        | "Let's take this offline"| 2022-06-14 00:00:00 |
-- | 922        | 3601      | 4500        | "Get on the call"        | 2022-08-10 00:00:00 |
-- +------------+-----------+-------------+--------------------------+---------------------+

-- Example Output:
-- +-----------+--------------+
-- | sender_id | message_count|
-- +-----------+--------------+
-- | 3601      | 3            |
-- | 4500      | 1            |
-- +-----------+--------------+


-- Solution 1
SELECT
  sender_id,
  COUNT(message_id) AS message_count
FROM messages
WHERE sent_date BETWEEN '2022-08-01'
  AND '2022-08-31'
GROUP BY sender_id
ORDER BY message_count DESC, sender_id
LIMIT 2;

-- Solution 2
SELECT 
  sender_id,
  COUNT(message_id) AS message_count
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
  AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY message_count DESC, sender_id
LIMIT 2;
