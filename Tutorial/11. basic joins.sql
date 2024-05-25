-- Joins are used to query (retrieve) data from 2 or more related tables. 
-- In general, tables are related to each other using foreign key constraints.

-- Types of JOINS.
-- 1. CROSS JOIN
-- 2. INNER JOIN 
-- 3. OUTER JOIN 
--    3.1. Left Join or Left Outer Join
--    3.2. Right Join or Right Outer Join
--    3.3. Full Join or Full Outer Join

-- General Formula for Joins
SELECT {ColumnList}
FROM {LeftTableName}
{JOIN_TYPE} {RightTableName}
ON {JoinCondition};

-- Input Table: employees
-- +----+----------+--------+--------+--------------+
-- | ID | Name     | Gender | Salary | DepartmentId |
-- +----+----------+--------+--------+--------------+
-- | 1  | Tom      | Male   | 4000   | 1            |
-- | 2  | Pam      | Female | 3000   | 3            |
-- | 3  | John     | Male   | 3500   | 1            |
-- | 4  | Sam      | Male   | 4500   | 2            |
-- | 5  | Todd     | Male   | 2800   | 2            |
-- | 6  | Ben      | Male   | 7000   | 1            |
-- | 7  | Sara     | Female | 4800   | 3            |
-- | 8  | Valarie  | Female | 5500   | 1            |
-- | 9  | James    | Male   | 6500   | NULL         |
-- | 10 | Russell  | Male   | 8800   | NULL         |
-- +----+----------+--------+--------+--------------+

-- Input Table: department
-- +----+------------------+-------------+-------------------+
-- | ID | DepartmentName   | Location    | DepartmentHead    |
-- +----+------------------+-------------+-------------------+
-- | 1  | IT               | London      | Rick              |
-- | 2  | Payroll          | Delhi       | Ron               |
-- | 3  | HR               | New York    | Christie          |
-- | 4  | Other Department | Sydney      | Cindrella         |
-- +----+------------------+-------------+-------------------+






-- CROSS JOIN
-- produces the cartesian product of the 2 tables involved in the join. 
-- For example, table1 has 10 rows and table2 has 4. Cross join produces 40 rows. 
-- Cross Join shouldn't have ON clause. 

-- Query:
SELECT Name, Gender, Salary, DepartmentName
FROM employee
CROSS JOIN department;

-- Example output:
-- +----------+--------+--------+------------------+
-- | Name     | Gender | Salary | DepartmentName   |
-- +----------+--------+--------+------------------+
-- | Tom      | Male   | 4000   | IT               |
-- | Tom      | Male   | 4000   | Payroll          |
-- | Tom      | Male   | 4000   | HR               |
-- | Tom      | Male   | 4000   | Other Department |
-- | Pam      | Female | 3000   | IT               |
-- | Pam      | Female | 3000   | Payroll          |
-- | Pam      | Female | 3000   | HR               |
-- | Pam      | Female | 3000   | Other Department |
-- | John     | Male   | 3500   | IT               |
-- | John     | Male   | 3500   | Payroll          |
-- | John     | Male   | 3500   | HR               |
-- | John     | Male   | 3500   | Other Department |
-- | ...      | ...    | ...    | ...              |
-- +----------+--------+--------+------------------+






-- INNER JOIN / JOIN
-- returns only the matching rows between both tables. Non-matching rows are eliminated.

-- Query:
SELECT Name, Gender, Salary, DepartmentName
FROM employee
INNER JOIN department
ON employee.DepartmentId = department.Id;

-- Example Output:
-- +----------+--------+--------+------------------+
-- | Name     | Gender | Salary | DepartmentName   |
-- +----------+--------+--------+------------------+
-- | Tom      | Male   | 4000   | IT               |
-- | Pam      | Female | 3000   | HR               |
-- | John     | Male   | 3500   | IT               |
-- | Sam      | Male   | 4500   | Payroll          |
-- | Todd     | Male   | 2800   | Payroll          |
-- | Ben      | Male   | 7000   | IT               |
-- | Sara     | Female | 4800   | HR               |
-- | Valarie  | Female | 5500   | IT               |
-- +----------+--------+--------+------------------+






-- LEFT JOIN
-- returns all the matching rows + non-matching rows from the left table. 
-- in reality, INNER JOIN and LEFT JOIN are extensively used.

-- Query:
SELECT Name, Gender, Salary, DepartmentName
FROM employee
LEFT JOIN department
ON employee.DepartmentId = department.Id;

-- Example Output:
-- +----------+--------+--------+------------------+
-- | Name     | Gender | Salary | DepartmentName   |
-- +----------+--------+--------+------------------+
-- | Tom      | Male   | 4000   | IT               |
-- | Pam      | Female | 3000   | HR               |
-- | John     | Male   | 3500   | IT               |
-- | Sam      | Male   | 4500   | Payroll          |
-- | Todd     | Male   | 2800   | Payroll          |
-- | Ben      | Male   | 7000   | IT               |
-- | Sara     | Female | 4800   | HR               |
-- | Valarie  | Female | 5500   | IT               |
-- | James    | Male   | 6500   | NULL             |
-- | Russell  | Male   | 8800   | NULL             |
-- +----------+--------+--------+------------------+






-- RIGHT JOIN
-- returns all the matching rows + non-matching rows from the right table.

-- Query:
SELECT Name, Gender, Salary, DepartmentName
FROM employee
RIGHT JOIN department
ON employee.DepartmentId = department.Id;

-- Expected Output:
-- +----------+--------+--------+------------------+
-- | Name     | Gender | Salary | DepartmentName   |
-- +----------+--------+--------+------------------+
-- | Tom      | Male   | 4000   | IT               |
-- | John     | Male   | 3500   | IT               |
-- | Ben      | Male   | 7000   | IT               |
-- | Valarie  | Female | 5500   | IT               |
-- | Pam      | Female | 3000   | HR               |
-- | Sara     | Female | 4800   | HR               |
-- | Sam      | Male   | 4500   | Payroll          |
-- | Todd     | Male   | 2800   | Payroll          |
-- | NULL     | NULL   | NULL   | Other Department |
-- +----------+--------+--------+------------------+






-- FULL JOIN / FULL OUTER JOIN
-- returns all rows from both the left and right tables, including the non-matching rows.

-- Query
SELECT Name, Gender, Salary, DepartmentName
FROM employee
FULL OUTER JOIN department
ON employee.DepartmentId = department.Id;

-- Expected Output:
-- +----------+--------+--------+------------------+
-- | Name     | Gender | Salary | DepartmentName   |
-- +----------+--------+--------+------------------+
-- | Tom      | Male   | 4000   | IT               |
-- | Pam      | Female | 3000   | HR               |
-- | John     | Male   | 3500   | IT               |
-- | Sam      | Male   | 4500   | Payroll          |
-- | Todd     | Male   | 2800   | Payroll          |
-- | Ben      | Male   | 7000   | IT               |
-- | Sara     | Female | 4800   | HR               |
-- | Valarie  | Female | 5500   | IT               |
-- | James    | Male   | 6500   | NULL             |
-- | Russell  | Male   | 8800   | NULL             |
-- | NULL     | NULL   | NULL   | Other Department |
-- +----------+--------+--------+------------------+




-- Summary
-- +-------------+-----------------------------------------------------------------------------------+
-- | Join Type   | Returns                                                                           |
-- +-------------+-----------------------------------------------------------------------------------+
-- | Cross Join  | cartesian product of the tables                                                   |
-- | Inner Join  | only the matching rows                                                            |
-- | Left Join   | all matching rows from the left table + non-matching rows from the left table     |
-- | Right Join  | all matching rows from the right table + non-matching rows from the right table   |
-- | Full Join   | Returns all rows from both tables                                                 |
-- +-------------+-----------------------------------------------------------------------------------+
