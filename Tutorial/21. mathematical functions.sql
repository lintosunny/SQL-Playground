-- ABS(): return absolute value
SELECT ABS(-1);  -- 1

-- CEILING(): returns smallest integer value grater than or equal to parameter
SELECT CEILING(15.2);  -- 16
SELECT CEILING(-15.2);  -- -15

-- FLOOR(): returns largest integer value smaller than or equal to parameter
SELECT FLOOR(15.2);  -- 15
SELECT FLOOR(-15.2);  -- -16

-- POWER(expression, power): returns power value
SELECT POWER(2,3);  -- 8

-- RAND([seed_value]): returns random float number between 0 and 1
SELECT RAND(1);  --always return same value
SELECT RAND();  -- always return random value

-- SQUARE(number): retruns square of given number
SELECT SQUARE(2)  -- 4

-- SQRT(number): returns square root of given number
SELECT SQRT(4)  -- 2

-- ROUND(numeric_expression, length [, funcion]): rounds the given expression
-- numeric_expression: number to round
-- length:
--   length = -ve: rounding applied to the number before decimal
--   length = +ve: rounding applied to the decimal part
-- function: 0 for rounding and non-zero for truncation
SELECT ROUND(850.556, 2)  -- 850.56
SELECT ROUND(850.556, 2, 1)  -- 850.55
SELECT ROUND(850.556, 1)  -- 850.6
SELECT ROUND(850.556, 1, 1)  -- 850.5
SELECT ROUND(850.556, -2)  -- 900.000
SELECT ROUND(850.556, -1)  --  850.000
