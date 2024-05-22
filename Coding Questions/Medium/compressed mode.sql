-- Write a query to retrieve the mode of the order occurrences. 
--Additionally, if there are multiple item counts with the same mode, the results should be sorted in ascending order.

-- Clarifications:
-- item_count: Represents the number of items sold in each order.
-- order_occurrences: Represents the frequency of orders with the corresponding number of items sold per order.
-- For example, if there are 800 orders with 3 items sold in each order, the record would have an item_count of 3 and an order_occurrences of 800.

-- items_per_order Table:
-- +------------------+------------------+
-- | Column Name      | Type             |
-- +------------------+------------------+
-- | item_count       | integer          |
-- | order_occurrences| integer          |
-- +------------------+------------------+

-- items_per_order Example Input:
-- +------------+------------------+
-- | item_count | order_occurrences|
-- +------------+------------------+
-- | 1          | 500              |
-- | 2          | 1000             |
-- | 3          | 800              |
-- +------------+------------------+

-- Example Output:
-- +------+
-- | mode |
-- +------+
-- | 2    |
-- +------+


-- Solution 1
SELECT item_count AS mode
FROM items_per_order
WHERE order_occurrences = (
  SELECT MAX(order_occurrences) 
  FROM items_per_order
)
ORDER BY item_count;

-- Solution 2
SELECT item_count AS mode
FROM items_per_order
WHERE order_occurrences = (
  SELECT MODE() WITHIN GROUP (ORDER BY order_occurrences DESC) 
  FROM items_per_order
)
ORDER BY item_count;
