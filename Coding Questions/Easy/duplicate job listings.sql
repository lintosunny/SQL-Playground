-- Write a query to retrieve the count of companies that have posted duplicate job listings.
-- Definition: Duplicate job listings are defined as two job listings within the same company that share identical titles and descriptions.

-- Table: job_listings
-- +-------------+-------------+
-- | Column Name | Type        |
-- +-------------+-------------+
-- | job_id      | integer     |
-- | company_id  | integer     |
-- | title       | string      |
-- | description | string      |
-- +-------------+-------------+

-- Example input: job_listings
-- +--------+------------+-----------------+-----------------------------------------------------------------------+
-- | job_id | company_id | title           | description                                                           |
-- +--------+------------+-----------------+-----------------------------------------------------------------------+
-- | 248    | 827        | Business Analyst| Improving decision-making processes within organizations.             |
-- | 149    | 845        | Business Analyst| Improving decision-making processes within organizations.             |
-- | 945    | 345        | Data Analyst    | Identify key insights into a business's customers and solve problems. |
-- | 164    | 345        | Data Analyst    | Identify key insights into a business's customers and solve problems. |
-- | 172    | 244        | Data Engineer   | Build systems that collect, manage, and convert raw data.             |
-- +--------+------------+-----------------+-----------------------------------------------------------------------+

-- Example output
-- +---------------------+
-- | duplicate_companies |
-- +---------------------+
-- | 1                   |
-- +---------------------+


-- Solution
WITH cte_job_listings AS (
  SELECT
    company_id,
    ROW_NUMBER() OVER(PARTITION BY company_id, title, description ORDER BY company_id) AS job_count
  FROM job_listings
)
  
SELECT 
  COUNT(DISTINCT company_id) AS duplicate_companies
FROM cte_job_listings
WHERE job_count > 1; 
