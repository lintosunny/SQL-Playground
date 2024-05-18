-- Write a query to display the user IDs of those who did not confirm their sign-up on the first day, but confirmed on the second day.
-- Definition: Action_date refers to the date when users activated their accounts and confirmed their sign-up through text messages.

-- Table: emails
-- +------------+-----------+
-- | Column     | Type      |
-- +------------+-----------+
-- | email_id   | integer   |
-- | user_id    | integer   |
-- | signup_date| datetime  |
-- +------------+-----------+

-- Example input: emails
-- +----------+---------+---------------------+
-- | email_id | user_id | signup_date         |
-- +----------+---------+---------------------+
-- | 125      | 7771    | 06/14/2022 00:00:00 |
-- | 433      | 1052    | 07/09/2022 00:00:00 |
-- +----------+---------+---------------------+

--Table: texts
-- +---------------+---------------------------------------+
-- | Column        | Type                                  |     
-- +---------------+---------------------------------------+
-- | text_id       | integer                               |             
-- | email_id      | integer                               |          
-- | signup_action | string ('Confirmed', 'Not confirmed') |        
-- | action_date   | datetime                              |      
-- +---------------+---------------------------------------+

-- Example input: texts
-- +---------+----------+----------------+---------------------+
-- | text_id | email_id | signup_action  | action_date         |
-- +---------+----------+----------------+---------------------+
-- | 6878    | 125      | Confirmed      | 06/14/2022 00:00:00 |
-- | 6997    | 433      | Not Confirmed  | 07/09/2022 00:00:00 |
-- | 7000    | 433      | Confirmed      | 07/10/2022 00:00:00 |
-- +---------+----------+----------------+---------------------+

-- Example Output
-- +---------+
-- | user_id |
-- +---------+
-- | 1052    |
-- +---------+


-- Solutions
SELECT user_id
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.signup_action = 'Confirmed'
  AND texts.action_date = emails.signup_date + INTERVAL '1 DAY';
