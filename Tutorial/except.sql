-- SQL SERVER: EXCEPT operator returns unique rows from the left query that aren't in the right query's results.
-- ORACLE: MINUS operator
-- MYSQL: distinct rows from left join with only non-macthing rows from right table

-- TableA
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 1  | Mark   | Male   |
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- | 4  | John   | Male   |
-- | 5  | Sara   | Female |
-- +----+--------+--------+

-- TableB
-- +----+--------+--------+
-- | Id | Name   | Gender |
-- +----+--------+--------+
-- | 4  | John   | Male   |
-- | 5  | Sara   | Female |
-- | 6  | Pam    | Female |
-- | 7  | Rebeka | Female |
-- | 8  | Jordan | Male   |
-- +----+--------+--------+

-- Query
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
-- | 2  | Mary   | Female |
-- | 3  | Steve  | Male   |
-- +----+--------+--------+
