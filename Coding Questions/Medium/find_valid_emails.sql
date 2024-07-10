-- Write a solution to find the users who have valid emails.
-- A valid e-mail has a prefix name and a domain where:
-- The prefix name is a string that may contain letters a-z, digits, underscore, period, and/or dash.
-- The prefix name must start with a letter.
-- The domain is '@leetcode.com'.

-- Table Schema: Users
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- | mail          | varchar |
-- +---------------+---------+

-- Input table: Users
-- +---------+-----------+-------------------------+
-- | user_id | name      | mail                    |
-- +---------+-----------+-------------------------+
-- | 1       | Winston   | winston@leetcode.com    |
-- | 2       | Jonathan  | jonathanisgreat         |
-- | 3       | Annabelle | bella-@leetcode.com     |
-- | 4       | Sally     | sally.come@leetcode.com |
-- | 5       | Marwan    | quarz#2020@leetcode.com |
-- | 6       | David     | david69@gmail.com       |
-- | 7       | Shapiro   | .shapo@leetcode.com     |
-- +---------+-----------+-------------------------+

-- Output: 
-- +---------+-----------+-------------------------+
-- | user_id | name      | mail                    |
-- +---------+-----------+-------------------------+
-- | 1       | Winston   | winston@leetcode.com    |
-- | 3       | Annabelle | bella-@leetcode.com     |
-- | 4       | Sally     | sally.come@leetcode.com |
-- +---------+-----------+-------------------------+


-- Solution
SELECT user_id, name, mail
FROM Users
WHERE mail REGEXP '^[a-z][a-z0-9_.-]*@leetcode\\.com$';
