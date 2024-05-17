-- find candidates who are proficient in Python, Tableau, and PostgreSQL.
-- Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.
-- Assumption: There are no duplicates in the candidates table.

-- Table: candidates
-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | candidate_id | integer |
-- | skill        | varchar |
-- +--------------+---------+

-- Example Input for candidates Table
-- +--------------+-----------+
-- | candidate_id | skill     |
-- +--------------+-----------+
-- | 123          | Python    |
-- | 123          | Tableau   |
-- | 123          | PostgreSQL|
-- | 234          | R         |
-- | 234          | PowerBI   |
-- | 234          | SQL Server|
-- | 345          | Python    |
-- | 345          | Tableau   |
-- +--------------+-----------+

-- Example Output
-- +--------------+
-- | candidate_id |
-- +--------------+
-- | 123          |
-- +--------------+


-- Solution
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
