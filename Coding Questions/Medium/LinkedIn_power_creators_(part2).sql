-- Write a query to return power users on LinkedIn.
-- Power user: A person with more followers than the company he is working for.
-- Assumption: A person can work at multiple companies.

-- personal_profiles schema
-- +-------------+---------+
-- | column      | type    |
-- +-------------+---------+
-- | profile_id  | integer |
-- | name        | string  |
-- | followers   | integer |
-- +-------------+---------+

-- personal_profiles example input
-- +-----------+--------+-----------+
-- | profile_id| name   | followers |
-- +-----------+--------+-----------+
-- | 1         | Nick   | 92000     |
-- | 2         | Zach   | 199000    |
-- | 3         | Liu    | 171000    |
-- | 4         | Ravit  | 107000    |
-- | 5         | Vin    | 139000    |
-- | 6         | Susan  | 39000     |
-- +-----------+--------+-----------+

-- employee_company schema
-- +--------------------+---------+
-- | column             | type    |
-- +--------------------+---------+
-- | personal_profile_id| integer |
-- | company_id         | integer |
-- +--------------------+---------+

-- employee_company example input
-- +--------------------+-----------+
-- | personal_profile_id| company_id|
-- +--------------------+-----------+
-- | 1                  | 4         |
-- | 1                  | 9         |
-- | 2                  | 2         |
-- | 3                  | 1         |
-- | 4                  | 3         |
-- | 5                  | 6         |
-- | 6                  | 5         |
-- +--------------------+-----------+

-- company_pages schema
-- +-------------+---------+
-- | column      | type    |
-- +-------------+---------+
-- | company_id  | integer |
-- | name        | string  |
-- | followers   | integer |
-- +-------------+---------+

-- company_pages example input
-- +-----------+-------------------------------+-----------+
-- | company_id| name                          | followers |
-- +-----------+-------------------------------+-----------+
-- | 1         | The data science podcast      | 8000      |
-- | 2         | Airbnb                        | 700000    |
-- | 3         | The Ravit show                | 6000      |
-- | 4         | DataLemur                     | 200       |
-- | 5         | YouTube                       | 16000000  |
-- | 6         | DataScience.vin               | 4500      |
-- | 9         | Ace the data science interview| 4479      |
-- +-----------+-------------------------------+-----------+

-- Example output
-- +-----------+
-- | profile_id|
-- +-----------+
-- | 1         |
-- | 3         |
-- | 4         |
-- | 5         |
-- +-----------+


-- Solution
WITH cte AS (
  SELECT
    ec.personal_profile_id,
    MAX(followers) AS max_followers
  FROM employee_company ec
  INNER JOIN company_pages cp
    ON ec.company_id = cp.company_id
  GROUP BY ec.personal_profile_id
)

SELECT pp.profile_id
FROM personal_profiles pp
INNER JOIN cte
  ON pp.profile_id = cte.personal_profile_id
WHERE pp.followers > cte.max_followers;
