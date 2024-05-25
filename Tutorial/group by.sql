-- Group by clause is used to group a selected set of rows into a set of summary rows by the values of one or more columns or expressions. 
-- It is always used in conjunction with one or more aggregate functions like Count(), Sum(), avg(), Min(), Max()

-- Table: salary
-- +-----------+----------+----------+--------+--------+
-- | firstname | lastname | city     | gender | salary |
-- +-----------+----------+----------+--------+--------+
-- | John      | Doe      | New York | M      | 5000   |
-- | Jane      | Smith    | Chicago  | F      | 6000   |
-- | Emily     | Davis    | New York | F      | 7000   |
-- | Michael   | Johnson  | Houston  | M      | 8000   |
-- | Sarah     | Brown    | New York | F      | 9000   |
-- | Chris     | Lee      | Chicago  | M      | 5500   |
-- | Anna      | Walker   | Houston  | F      | 7200   |
-- | David     | Martinez | Chicago  | M      | 6500   |
-- +-----------+----------+----------+--------+--------+

-- grouping by city
SELECT city, SUM(salary) AS total_salary
FROM salary
WHERE gender = 'M'
GROUP BY city
HAVING city = 'Chicago';

-- Example Output:
-- +---------+--------------+
-- | city    | total_salary |
-- +---------+--------------+
-- | Chicago | 12000        |
-- +---------+--------------+


-- Comparison of WHERE and HAVING Clauses:
-- +---------------------------------------------+---------------------------------------------+
-- | WHERE                                       | HAVING                                      |
-- +---------------------------------------------+---------------------------------------------+
-- | Can use with SELECT, INSERT, and UPDATE     | Can only be used with the SELECT statement  |
-- | Filters rows before aggregation (GROUP BY)  | Filters groups after the aggregations       |
-- | Aggregate functions cannot be used directly | Aggregate functions can be used directly    | 
-- +---------------------------------------------+---------------------------------------------+




