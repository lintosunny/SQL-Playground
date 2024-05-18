-- Write a query that outputs each employee id and whether they hit the quota or not ('yes' or 'no'). Order the results by employee id in ascending order.
-- Definitions:
-- deal_size: Deals acquired by a salesperson in the year. Each salesperson may have more than 1 deal.
-- quota: Total annual quota for each salesperson.

-- Table: deals
-- +-------------+--------+
-- | Column Name | Type   |
-- +-------------+--------+
-- | employee_id | integer|
-- | deal_size   | integer|
-- +-------------+--------+

-- Example Input for deals Table
-- +-------------+-----------+
-- | employee_id | deal_size |
-- +-------------+-----------+
-- | 101         | 400000    |
-- | 101         | 300000    |
-- | 201         | 500000    |
-- | 301         | 500000    |
-- +-------------+-----------+

-- Table: sales_quotas
-- +-------------+--------+
-- | Column Name | Type   |
-- +-------------+--------+
-- | employee_id | integer|
-- | quota       | integer|
-- +-------------+--------+

-- Example Input for sales_quotas Table
-- +-------------+--------+
-- | employee_id | quota  |
-- +-------------+--------+
-- | 101         | 500000 |
-- | 201         | 400000 |
-- | 301         | 600000 |
-- +-------------+--------+

-- Example Output
-- +-------------+-----------+
-- | employee_id | made_quota|
-- +-------------+-----------+
-- | 101         | yes       |
-- | 201         | yes       |
-- | 301         | no        |
-- +-------------+-----------+


-- Solution
SELECT 
  deals.employee_id,
  CASE WHEN SUM(deals.deal_size) < sales_quotas.quota THEN 'no' ELSE 'yes' END AS made_quota
FROM deals
LEFT JOIN sales_quotas
  ON deals.employee_id = sales_quotas.employee_id
GROUP BY deals.employee_id, sales_quotas.quota
ORDER BY deals.employee_id;
