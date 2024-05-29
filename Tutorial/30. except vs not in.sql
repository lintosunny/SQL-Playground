-- TableA
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 1  | Mark   | Male   |
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- | 1  | Mark   | Male   |
-- +----+--------+--------+

-- TableB
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 1  | Mary   | Female |
-- | 2  | Steve  | Male   |
-- +----+--------+--------+


-- EXCEPT
SELECT Id, Name, Gender
FROM TableA
EXCEPT
SELECT Id, Name, Gender
FROM TableB;

-- Example output
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 1  | Mark   | Male   |
-- +----+--------+--------+


-- NOT IN 
SELECT Id, Name, Gender
FROM TableA
WHERE Id NOT IN (
  SELECT Id
  FROM TableB);

-- Example output
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 1  | Mark   | Male   |
-- | 1  | Mark   | Male   |
-- +----+--------+--------+

-- EXCEPT vs NOT IN
-- 1. EXCEPT filters duplicates and return distinct rows, where as NOT IN doesn't filter the results
-- 2. EXCEPT expects same number of columns in both tables,
--    NOT IN compares a single column in outer query with a single column in subquery.
