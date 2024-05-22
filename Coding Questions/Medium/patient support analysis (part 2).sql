-- Write a query to calculate the percentage of calls that cannot be categorised. 
--Round your answer to 1 decimal place. For example, 45.0, 48.5, 57.7.
-- uncategorised calls are labeled as “n/a”, or are left empty.

-- callers Table:
-- +------------------+--------------+
-- | Column Name      | Type         |
-- +------------------+--------------+
-- | policy_holder_id | integer      |
-- | case_id          | varchar      |
-- | call_category    | varchar      |
-- | call_date        | timestamp    |
-- | call_duration_secs| integer     |
-- +------------------+--------------+

-- callers Example Input:
-- +------------------+----------+---------------------+---------------------+---------------- --+
-- | policy_holder_id | case_id  | call_category       | call_date           | call_duration_secs|
-- +------------------+----------+---------------------+---------------------+-------------------+
-- | 1                | f1d012f9 | emergency assistance| 2023-04-13T19:16:53Z| 144               |
-- | 1                | 41ce8fb6 | authorisation       | 2023-05-25T09:09:30Z| 815               |
-- | 2                | 9b1af84b | n/a                 | 2023-01-26T01:21:27Z| 992               |
-- | 2                | 8471a3d4 | emergency assistance| 2023-03-09T10:58:54Z| 128               |
-- | 2                | 38208fae | benefits            | 2023-06-05T07:35:43Z| 619               |
-- +------------------+----------+---------------------+---------------------+-------------------+

-- Example Output:
-- +-------------------------+
-- | uncategorised_call_pct  |
-- +-------------------------+
-- | 20.0                    |
-- +-------------------------+


-- Solution
WITH uncategorised_callers AS (
  SELECT COUNT(case_id) AS uncategorised_calls
  FROM callers
  WHERE call_category IS NULL
    OR call_category = 'n/a'
)

SELECT 
  ROUND(100.0 * uncategorised_calls 
    / (SELECT COUNT(*) FROM callers), 1) AS uncategorised_call_pct
FROM uncategorised_callers;