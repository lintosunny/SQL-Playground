-- APPLY operator is used to join a table to a table-valued function.
-- The Table Valued Function on the right-hand side of the APPLY operator gets called for each row from the left (also called outer table) table.
-- Cross Apply returns only matching rows (semantically equivalent to Inner Join)
-- Outer Apply returns matching + non-matching rows (semantically equivalent to Left Outer Join). The unmatched columns of the table-valued function will be set to NULL.

-- Function: fn_GetEmployeesByDepartmentId
Create function fn_GetEmployeesByDepartmentId(@DepartmentId int)
Returns Table
as
Return
(
  Select Id, Name, Gender, Salary, DepartmentId
  from Employee where DepartmentId = @DepartmentId
);

-- Table: Department
-- +----+----------------+
-- | Id | Name           |
-- +----+----------------+
-- | 1  | IT             |
-- | 2  | HR             |
-- | 3  | Payroll        |
-- | 4  | Administration |
-- | 5  | Sales          |
-- +----+----------------+


-- CROSS APPLY: semantically equivalent to INNER JOIN
Select D.DepartmentName, E.Name, E.Gender, E.Salary
from Department D
Cross Apply fn_GetEmployeesByDepartmentId(D.Id) E;

-- OUTER APPLY: semantically equivalent to LEFT JOIN
Select D.DepartmentName, E.Name, E.Gender, E.Salary
from Department D
Outer Apply fn_GetEmployeesByDepartmentId(D.Id) E;
