-- Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day.

-- Definition:
-- Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements,
-- measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.

-- measurements Table:
-- +-------------------+----------+
-- | Column Name       | Type     |
-- +-------------------+----------+
-- | measurement_id    | integer  |
-- | measurement_value | decimal  |
-- | measurement_time  | datetime |
-- +-------------------+----------+

-- measurements Example Input:
-- +-------------------+------------------+---------------------+
-- | measurement_id    | measurement_value| measurement_time    |
-- +-------------------+------------------+---------------------+
-- | 131233            | 1109.51          | 07/10/2022 09:00:00 |
-- | 135211            | 1662.74          | 07/10/2022 11:00:00 |
-- | 523542            | 1246.24          | 07/10/2022 13:15:00 |
-- | 143562            | 1124.50          | 07/11/2022 15:00:00 |
-- | 346462            | 1234.14          | 07/11/2022 16:45:00 |
-- +-------------------+------------------+---------------------+

-- Example Output:
-- +---------------------+----------+----------+
-- | measurement_day     | odd_sum  | even_sum |
-- +---------------------+----------+----------+
-- | 07/10/2022 00:00:00 | 2355.75  | 1662.74  |
-- | 07/11/2022 00:00:00 | 1124.50  | 1234.14  |
-- +---------------------+----------+----------+


-- Solution 1
WITH cte_measurements AS (
    SELECT 
        ROW_NUMBER() OVER(PARTITION BY measurement_time::DATE ORDER BY measurement_time) AS measurement_no,
        measurement_time::DATE AS measurement_day,
        measurement_value
    FROM measurements
)

SELECT
    measurement_day,
    SUM(CASE WHEN measurement_no % 2 != 0 THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN measurement_no % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM cte_measurements
GROUP BY measurement_day;

-- Solution 2
WITH ranked_measurements AS (
  SELECT 
    CAST(measurement_time AS DATE) AS measurement_day, 
    measurement_value, 
    ROW_NUMBER() OVER (
      PARTITION BY CAST(measurement_time AS DATE) 
      ORDER BY measurement_time) AS measurement_num 
  FROM measurements
) 

SELECT 
  measurement_day, 
  SUM(measurement_value) FILTER (WHERE measurement_num % 2 != 0) AS odd_sum, 
  SUM(measurement_value) FILTER (WHERE measurement_num % 2 = 0) AS even_sum 
FROM ranked_measurements
GROUP BY measurement_day;