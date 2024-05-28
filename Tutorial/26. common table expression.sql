-- CTE is a temporary result set, that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement, that immediately follows CTE.

-- Create single CTE
WITH cte_name AS (
  cte_query
)

query;

-- Create multiple CTE
WITH cte_name1 AS (
  cte_query1
)
cte_name2 AS (
  cte_query2
)
...
cte_namen AS (
  cte_queryn
)

query;




-- Recursive CTE

-- employee Table:
-- +-------------+--------+-----------+
-- | EmployeeId  | Name   | ManagerId |
-- +-------------+--------+-----------+
-- | 1           | Tom    | 2         |
-- | 2           | Josh   | NULL      |
-- | 3           | Mike   | 2         |
-- | 4           | John   | 3         |
-- | 5           | Pam    | 1         |
-- | 6           | Mary   | 3         |
-- | 7           | James  | 1         |
-- | 8           | Sam    | 5         |
-- | 9           | Simon  | 1         |
-- +-------------+--------+-----------+

WITH EmployeesCTE (EmployeeId, Name, ManagerId, [Level]) AS (
  SELECT EmployeeId, Name, ManagerId, 1
  FROM tblEmployee
  WHERE ManagerId IS NULL
    
  UNION ALL
    
  SELECT tblEmployee.EmployeeId, tblEmployee.Name, tblEmployee.ManagerId, EmployeesCTE.[Level] + 1
  FROM tblEmployee
  JOIN EmployeesCTE
    ON tblEmployee.ManagerID = EmployeesCTE.EmployeeId
)

SELECT EmpCTE.Name AS Employee, ISNULL(MgrCTE.Name, 'Super Boss') AS Manager, EmpCTE.[Level] 
FROM EmployeesCTE EmpCTE
LEFT JOINEmployeesCTE MgrCTE
  ON EmpCTE.ManagerId = MgrCTE.EmployeeId;
