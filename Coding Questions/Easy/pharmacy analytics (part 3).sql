-- Write a query to calculate the total drug sales for each manufacturer. 
-- Round the answer to the nearest million and report your results in descending order of total sales. 
-- In case of any duplicates, sort them alphabetically by the manufacturer name.
-- Since this data will be displayed on a dashboard viewed by business stakeholders, please format your results as follows: "$36 million".

-- Table: pharmacy_sales
-- +-------------+-------------+
-- | Column Name | Type        |
-- +-------------+-------------+
-- | product_id  | integer     |
-- | units_sold  | integer     |
-- | total_sales | decimal     |
-- | cogs        | decimal     |
-- | manufacturer| varchar     |
-- | drug        | varchar     |
-- +-------------+-------------+

-- Example Input:
-- +------------+------------+--------------+-------------+--------------+-----------------+
-- | product_id | units_sold | total_sales  | cogs        | manufacturer | drug            |
-- +------------+------------+--------------+-------------+--------------+-----------------+
-- | 94         | 132362     | 2041758.41   | 1373721.70  | Biogen       | UP and UP       |
-- | 9          | 37410      | 293452.54    | 208876.01   | Eli Lilly    | Zyprexa         |
-- | 50         | 90484      | 2521023.73   | 2742445.90  | Eli Lilly    | Dermasorb       |
-- | 61         | 77023      | 500101.61    | 419174.97   | Biogen       | Varicose Relief |
-- | 136        | 144814     | 1084258.00   | 1006447.73  | Biogen       | Burkhart        |
-- +------------+------------+--------------+-------------+--------------+-----------------+

-- Example Output:
-- +--------------+-----------+
-- | manufacturer | sale      |
-- +--------------+-----------+
-- | Biogen       | $4 million|
-- | Eli Lilly    | $3 million|
-- +--------------+-----------+


-- Solution
SELECT 
  manufacturer,
  '$' || ROUND(SUM(total_sales)/1000000) || ' million' AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer;
