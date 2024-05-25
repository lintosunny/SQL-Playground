-- SELECT statement returns a result set of rows, from one or more tables.
-- * to select all the columns. For better performance use the column list, instead of *.

-- Basic select statement syntax
SELECT Column_List
FROM Table_Name

-- To Select distinct rows use DISTINCT keyword
SELECT DISTINCT Column_List
FROM Table_Name

-- Filtering rows with WHERE clause
SELECT Column_List
FROM Table_Name
WHERE Filter_Condition
