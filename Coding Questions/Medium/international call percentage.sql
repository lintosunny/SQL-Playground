-- A phone call is considered an international call when the person calling is in a different country than the person receiving the call.
-- What percentage of phone calls are international? Round the result to 1 decimal.

-- Assumption:
-- The caller_id in phone_info table refers to both the caller and receiver.

-- phone_calls Table:
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | caller_id   | integer  |
-- | receiver_id | integer  |
-- | call_time   | timestamp|
-- +-------------+----------+

-- phone_calls Example Input:
-- +-----------+-------------+---------------------+
-- | caller_id | receiver_id | call_time           |
-- +-----------+-------------+---------------------+
-- | 1         | 2           | 2022-07-04 10:13:49 |
-- | 1         | 5           | 2022-08-21 23:54:56 |
-- | 5         | 1           | 2022-05-13 17:24:06 |
-- | 5         | 6           | 2022-03-18 12:11:49 |
-- +-----------+-------------+---------------------+

-- phone_info Table:
-- +-------------+----------+
-- | Column Name | Type     |
-- +-------------+----------+
-- | caller_id   | integer  |
-- | country_id  | integer  |
-- | network     | integer  |
-- | phone_number| string   |
-- +-------------+----------+

-- phone_info Example Input:
-- +-----------+------------+-------------+-----------------+
-- | caller_id | country_id | network     | phone_number    |
-- +-----------+------------+-------------+-----------------+
-- | 1         | US         | Verizon     | +1-212-897-1964 |
-- | 2         | US         | Verizon     | +1-703-346-9529 |
-- | 3         | US         | Verizon     | +1-650-828-4774 |
-- | 4         | US         | Verizon     | +1-415-224-6663 |
-- | 5         | IN         | Vodafone    | +91 7503-907302 |
-- | 6         | IN         | Vodafone    | +91 2287-664895 |
-- +-----------+------------+-------------+-----------------+

-- Example Output:
-- +-------------------------+
-- | international_calls_pct |
-- +-------------------------+
-- | 50.0                    |
-- +-------------------------+


-- Solution
WITH cte_phone_calls AS (
  SELECT calls.caller_id
  FROM phone_calls AS calls
  LEFT JOIN phone_info AS caller
    ON calls.caller_id = caller.caller_id
  LEFT JOIN phone_info AS receiver
    ON calls.receiver_id = receiver.caller_id
  WHERE caller.country_id <> receiver.country_id
)

SELECT
  ROUND(100 * COUNT(*)::DECIMAL
  / (SELECT COUNT(*) FROM phone_calls),1) AS international_call_pct
FROM cte_phone_calls;