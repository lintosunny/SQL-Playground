-- INTERSECT operator return distinct common records from both right and left tables

-- TableA
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 1  | Mark   | Male   |
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- | 2  | Mary   | Female |
-- +----+--------+--------+

-- TableB
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- +----+--------+--------+


-- INTERSECT
SELECT Id, Name, Gender 
FROM TableA
INTERSECT
SELECT Id, Name, Gender 
FROM TableA;

-- Example output
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- +----+--------+--------+


-- INNER JOIN
SELECT Id, Name, Gender
FROM TableA
INNER JOIN TableB
  ON TableA.Id = TableB.Id;

-- Example output
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- | 2  | Mary   | Female |
-- +----+--------+--------+


-- INTERSECT vs INNER JOIN
-- 1. INTERSECT filters duplicates and returns only DISTINCT common rows between tables, where as INNER JOIN does not filter the duplicates.
-- 2. INNER JOIN treats two NULLS as two different values.where as INTERSECT treats two NULLs as a same value and it returns all matching rows.
-- 2. Example:

-- TableA
-- +-------+--------+--------+
-- | Id    | Name   | Gender |
-- +-------+--------+--------+
-- | 1     | Mark   | Male   |
-- | 2     | Mary   | Female |
-- | 3     | Steve  | Male   |
-- | 2     | Mary   | Female |
-- | NULL  | Pam    | Female |
-- +-------+--------+--------+

-- TableB
-- +-------+--------+--------+
-- | Id    | Name   | Gender |
-- +-------+--------+--------+
-- | 2     | Mary   | Female |
-- | 3     | Steve  | Male   |
-- | NULL  | Pam    | Female |
-- +-------+--------+--------+

-- INTERSECT
SELECT Id, Name, Gender 
FROM TableA
INTERSECT
SELECT Id, Name, Gender 
FROM TableA;

-- Example output
-- +------+--------+--------+
-- | Id   | Name   | Gender |
-- +------+--------+--------+
-- | NULL | Pam    | Female |
-- | 2    | Mary   | Female |
-- | 3    | Steve  | Male   |
-- +------+--------+--------+

--INNER JOIN
SELECT Id, Name, Gender
FROM TableA
INNER JOIN TableB
  ON TableA.Id = TableB.Id;

-- Example output
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- | 2  | Mary   | Female |
-- +----+--------+--------+
