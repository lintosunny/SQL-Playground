-- To convert one data type to another, CAST and CONVERT functions can be used. 

-- CAST(expression AS data_type[(length)]
SELECT CAST(GETDATE() AS VARCHAR(10));

-- CONVERT(data_type[(length)], expression[, style]);
SELECT CONVERT(VARCHAR(10), GETDATE(), 101);

-- few of the datetime styles
-- +-------------+-------------+
-- | Date FOrmat | Style       |
-- +-------------+-------------+
-- | mm/dd/yyyy  | 101         |
-- | yy.mm.dd    | 102         |
-- | dd/mm/yyyy  | 103         |
-- | dd.mm.yy    | 104         |
-- | dd-mm-yy    | 105         |
-- +-------------+-------------+

-- CAST vs CONVERT
-- 1. Cast is based on ANSI standard and Convert is specific to SQL Server.
-- 2. Convert provides more flexibility than Cast. Can specify styles with convert function.

-- PostgreSQL
SELECT GETDATE()::VARCHAR(10);
