-- find the mean number of items per order, rounded to 1 decimal place.
-- count of items in each order (item_count table) and the corresponding number of orders for each item count (order_occurrences table).

-- Table: items_per_order
-- +-------------------+---------+
-- | Column Name       | Type    |
-- +-------------------+---------+
-- | item_count        | integer |
-- | order_occurrences | integer |
-- +-------------------+---------+

-- Example Input for items_per_order Table
-- +-------------+-------------------+
-- | item_count  | order_occurrences |
-- +-------------+-------------------+
-- | 1           | 500               |
-- | 2           | 1000              |
-- | 3           | 800               |
-- | 4           | 1000              |
-- +-------------+-------------------+

-- Example Output
-- +------+
-- | mean |
-- +------+
-- | 2.7  |
-- +------+


-- Solution
-- we can cast either column to a decimal type using ::DECIMAL or CAST(field AS decimal)
SELECT
  ROUND(
    SUM(item_count::DECIMAL * order_occurrences)
    / SUM(order_occurrences)
  ,1) AS mean
FROM items_per_order;
