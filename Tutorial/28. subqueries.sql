-- subquery is simply a select statement, that returns a single value and can be nested inside a SELECT, UPDATE, INSERT, or DELETE statement.
-- It is also possible to nest a subquery inside another subquery.
-- According to MSDN, subqueries can be nested upto 32 levels.

-- products table
-- +----+---------+-----------------------------------+
-- | Id | Name    | Description                       |
-- +----+---------+-----------------------------------+
-- | 1  | TV      | 52 inch black color LCD TV        |
-- | 2  | Laptop  | Very thin black color acer laptop |
-- | 3  | Desktop | HP high performance desktop       |
-- +----+---------+-----------------------------------+

-- product_sales table
-- +----+-----------+-----------+--------------+
-- | Id | ProductId | UnitPrice | QuantitySold |
-- +----+-----------+-----------+------------- +
-- | 1  | 3         | 450       | 5            |
-- | 2  | 2         | 250       | 7            |
-- | 3  | 3         | 450       | 4            |
-- | 4  | 3         | 450       | 9            |
-- +----+-----------+-----------+--------------+

-- Write a query to retrieve products that are not at all sold?
SELECT Id, Name, Description
FROM products 
WHERE Id NOT IN (
  SELECT DISTINCT productId
  FROM product_sales
) AS subquery;
