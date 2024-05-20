-- New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. 
-- Users may receive multiple text messages for account confirmation until they have confirmed their new account.
-- Write a query to find the activation rate. Round the percentage to 2 decimal places.

-- Definitions:
-- emails table contain the information of user signup details.
-- texts table contains the users' activation information.

-- Assumptions:
-- The analyst is interested in the activation rate of specific users in the emails table, which may not include all users that could potentially be found in the texts table.
-- For example, user 123 in the emails table may not be in the texts table and vice versa.

-- emails Table:
-- +-------------+------------+
-- | Column Name | Type       |
-- +-------------+------------+
-- | email_id    | integer    |
-- | user_id     | integer    |
-- | signup_date | datetime   |
-- +-------------+------------+

-- emails Table:
-- +----------+---------+---------------------+
-- | email_id | user_id | signup_date         |
-- +----------+---------+---------------------+
-- | 125      | 7771    | 06/14/2022 00:00:00 |
-- | 236      | 6950    | 07/01/2022 00:00:00 |
-- | 433      | 1052    | 07/09/2022 00:00:00 |
-- +----------+---------+---------------------+

-- texts Table:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | text_id       | integer |
-- | email_id      | integer |
-- | signup_action | varchar |
-- +---------------+---------+

-- texts Table:
-- +---------+----------+---------------+
-- | text_id | email_id | signup_action |
-- +---------+----------+---------------+
-- | 6878    | 125      | Confirmed     |
-- | 6920    | 236      | Not Confirmed |
-- | 6994    | 236      | Confirmed     |
-- +---------+----------+---------------+

-- Example Output:
-- +--------------+
-- | confirm_rate |
-- +--------------+
-- | 0.67         |
-- +--------------+


-- Solution 1
SELECT 
    ROUND(
        SUM(CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END)::DECIMAL
        / COUNT(DISTINCT user_id), 2
    ) AS confirm_rate
FROM emails
LEFT JOIN texts
    ON emails.email_id = texts.email_id;

-- Solution 2
SELECT 
  ROUND(COUNT(texts.email_id)::DECIMAL
    /COUNT(DISTINCT emails.email_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';