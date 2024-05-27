-- write query to find number of business days excluding weekends and holidays for each ticket

-- tickets Table
-- +--------------+--------------+
-- | Column Name  | Type         |
-- +--------------+--------------+
-- | ticket_id    | varchar(10)  |
-- | create_date  | date         |
-- | resolved_date| date         |
-- +--------------+--------------+

-- Example input tickets
-- +-----------+-------------+---------------+
-- | ticket_id | create_date | resolved_date |
-- +-----------+-------------+---------------+
-- | 1         | 2022-08-01  | 2022-08-03    |
-- | 2         | 2022-08-01  | 2022-08-12    |
-- | 3         | 2022-08-01  | 2022-08-16    |
-- +-----------+-------------+---------------+

-- holidays Table
-- +--------------+--------------+
-- | Column Name  | Type         |
-- +--------------+--------------+
-- | holiday_date | date         |
-- | reason       | varchar(100) |
-- +--------------+--------------+

-- Example input holidays
-- +--------------+------------------+
-- | holiday_date | reason           |
-- +--------------+------------------+
-- | 2022-08-11   | Rakhi            |
-- | 2022-08-15   | Independence day |
-- +--------------+------------------+

-- Example output
-- +-----------+---------------+
-- | ticket_id | business_days | 
-- +-----------+---------------+
-- | 1         | 3             |
-- | 2         | 9             |
-- | 3         | 10            |
-- +-----------+---------------+


-- Solution
WITH cte AS (
  SELECT ticket_id, create_date, resolved_date, COUNT(holiday_date) AS no_of_holidays
  FROM tickets
  LEFT JOIN holidays
    ON holiday_date BETWEEN create_date AND resolved_date
  GROUP BY ticket_id, create_date, resolved_date
)

SELECT 
  ticket_id,
  DATEDIFF(DAY, create_date, resolved_date)
  - 2 * DATEDIFF(WEEK, create_date, resolved_date)
  - no_of_holidays AS business_days
FROM cte;
