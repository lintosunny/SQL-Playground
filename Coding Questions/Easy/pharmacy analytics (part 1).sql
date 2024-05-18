-- Write a query to find the top 3 most profitable drugs sold, and how much profit they made. 
-- Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.
-- Definition: Total Profit = Total Sales - Cost of Goods Sold

-- Table: pharmacy_sales
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | product_id   | integer |
-- | units_sold   | integer |
-- | total_sales  | decimal |
-- | cogs         | decimal |
-- | manufacturer | varchar |
-- | drug         | varchar |
-- +--------------+---------+

-- Example Input for pharmacy_sales Table
-- +------------+------------+--------------+-----------+--------------+-----------------+
-- | product_id | units_sold | total_sales  | cogs      | manufacturer | drug            |
-- +------------+------------+--------------+-----------+--------------+-----------------+
-- | 9          | 37410      | 293452.54    | 208876.01 | Eli Lilly    | Zyprexa         |
-- | 34         | 94698      | 600997.19    | 521182.16 | AstraZeneca  | Surmontil       |
-- | 61         | 77023      | 500101.61    | 419174.97 | Biogen       | Varicose Relief |
-- | 136        | 144814     | 1084258      | 1006447.73| Biogen       | Burkhart        |
-- +------------+------------+--------------+-----------+--------------+-----------------+

-- Example Output
-- +-----------------+-------------+
-- | drug            | total_profit|
-- +-----------------+-------------+
-- | Zyprexa         | 84576.53    |
-- | Varicose Relief | 80926.64    |
-- | Surmontil       | 79815.03    |
-- +-----------------+-------------+


-- Solution
SELECT 
  drug,
  SUM(total_sales) - SUM(cogs) AS total_profit
FROM pharmacy_sales
GROUP BY drug
ORDER BY total_profit DESC
LIMIT 3;
