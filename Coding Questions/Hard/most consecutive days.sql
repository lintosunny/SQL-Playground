-- write a SQL query to find out the employee ID who came to the office for most consecutive days.
-- 1 represents present, and 0 represents absent in present column.

-- attendance Table:
-- +--------------+----------------+
-- | Column Name  | Type           |
-- +--------------+----------------+
-- | id           | integer        |
-- | date         | date           |
-- | present      | integer (0, 1) |
-- +--------------+----------------+

-- attendance Example Input:
-- +----+------------+---------+
-- | id | date       | present |
-- +----+------------+---------+
-- | 1  | 2022-01-01 | 1       |
-- | 1  | 2022-01-02 | 1       |
-- | 1  | 2022-01-03 | 1       |
-- | 1  | 2022-01-04 | 0       |
-- | 1  | 2022-01-05 | 1       |
-- | 2  | 2022-01-01 | 1       |
-- | 2  | 2022-01-02 | 1       |
-- | 2  | 2022-01-03 | 0       |
-- | 2  | 2022-01-04 | 1       |
-- | 2  | 2022-01-05 | 1       |
-- | 2  | 2022-01-06 | 1       |
-- | 3  | 2022-01-01 | 1       |
-- | 3  | 2022-01-02 | 0       |
-- | 3  | 2022-01-03 | 1       |
-- | 3  | 2022-01-04 | 1       |
-- | 3  | 2022-01-05 | 1       |
-- | 3  | 2022-01-06 | 1       |
-- | 3  | 2022-01-07 | 1       |
-- +----+------------+---------+

-- Example Output:
-- +------+
-- | id   |
-- +------+
-- | 3    | 
-- +------+


-- Solution
WITH x AS (
  SELECT *, ROW_NUMBER() OVER(PARTITION BY id ORDER BY date ASC) AS rnk
  FROM attendance
  WHERE present = 1),
y AS (
  SELECT *, DATE_ADD(date, INTERVAL -rnk DAY) AS grouped
  FROM x),
z AS (
  SELECT id, date, COUNT(grouped) OVER(PARTITION BY id, grouped) AS cnt
  FROM y),
a AS (
  SELECT *, RANK() OVER(ORDER BY cnt DESC) AS rn
  FROM z)

SELECT DISTINCT(id)  
FROM a
WHERE rn = 1;
