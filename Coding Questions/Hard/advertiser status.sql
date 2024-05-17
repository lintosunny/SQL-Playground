-- Write a query to update the payment status of Facebook advertisers based on the information in the daily_pay table. 
-- The output should include the user ID and their current payment status, sorted by the user id.

-- possible transitions in the advertiser's status based on the payment status.
-- +----+----------------+----------------+------------------+
-- | #  | Current Status | Updated Status | Payment on Day T |
-- +----+----------------+----------------+------------------+
-- | 1  | NEW            | EXISTING       | Paid             |
-- | 2  | NEW            | CHURN          | Not paid         |
-- | 3  | EXISTING       | EXISTING       | Paid             |
-- | 4  | EXISTING       | CHURN          | Not paid         |
-- | 5  | CHURN          | RESURRECT      | Paid             |
-- | 6  | CHURN          | CHURN          | Not paid         |
-- | 7  | RESURRECT      | EXISTING       | Paid             |
-- | 8  | RESURRECT      | CHURN          | Not paid         |
-- +----+----------------+----------------+------------------+
-- "Current Status" column: Represents the advertiser's current status.
-- "Updated Status" column: Represents the updated payment status based on the conditions
-- "Payment on Day T" column: Indicates whether the advertiser made a payment on a specific day (T) or not.

-- Table: advertiser
-- +-----------+--------+
-- | Column Name | Type   |
-- +-----------+--------+
-- | user_id     | string |
-- | status      | string |
-- +-----------+--------+

-- Example Input for advertiser Table
-- +---------+-----------+
-- | user_id | status    |
-- +---------+-----------+
-- | bing    | NEW       |
-- | yahoo   | NEW       |
-- | alibaba | EXISTING  |
-- +---------+-----------+

-- Table: daily_pay
-- +-----------+--------+
-- | Column Name | Type   |
-- +-----------+--------+
-- | user_id     | string |
-- | paid        | decimal|
-- +-----------+--------+

-- Example Input for daily_pay Table
-- +---------+-------+
-- | user_id | paid  |
-- +---------+-------+
-- | yahoo   | 45.00 |
-- | alibaba | 100.00|
-- | target  | 13.00 |
-- +---------+-------+

-- Example Output
-- +---------+------------+
-- | user_id | new_status |
-- +---------+------------+
-- | bing    | CHURN      |
-- | yahoo   | EXISTING   |
-- | alibaba | EXISTING   |
-- +---------+------------+


-- Solution
SELECT 
  COALESCE(advertiser.user_id, daily_pay.user_id) AS user_id,
  CASE 
    WHEN paid IS NULL THEN 'CHURN' 
    WHEN paid IS NOT NULL AND advertiser.status IN ('NEW','EXISTING','RESURRECT') THEN 'EXISTING'
    WHEN paid IS NOT NULL AND advertiser.status = 'CHURN' THEN 'RESURRECT'
    WHEN paid IS NOT NULL AND advertiser.status IS NULL THEN 'NEW'
  END AS new_status
FROM advertiser
FULL OUTER JOIN daily_pay
  ON advertiser.user_id = daily_pay.user_id
ORDER BY user_id;
