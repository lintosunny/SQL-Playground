-- Advanced joins
-- 1. Retrieve only the non matching rows from the left table
-- 2. Retrieve only the non matching rows from the right table
-- 3. Retrieve only the non matching rows from both the left and right table

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






-- non matching rows from the left table
SELECT Name, Gender, Salary, DepartmentName
FROM employee
LEFT JOIN department
ON employee.DepartmentId = department.Id
WHERE department.Id IS NULL;

-- Expected Output:
-- +--------+--------+--------+---------------+
-- | Name   | Gender | Salary | DepartmentName|
-- +--------+--------+--------+---------------+
-- | James  | Male   | 6500   | NULL          |
-- | Russell| Male   | 8800   | NULL          |
-- +--------+--------+--------+---------------+






-- non matching rows from the right table
SELECT Name, Gender, Salary, DepartmentName
FROM employee
RIGHT JOIN department
ON employee.DepartmentId = department.Id
WHERE employee.DepartmentId IS NULL;

-- Expected Output:
-- +------+--------+--------+------------------+
-- | Name | Gender | Salary | DepartmentName   |
-- +------+--------+--------+------------------+
-- | NULL | NULL   | NULL   | Other Department |
-- +------+--------+--------+------------------+






-- non matching rows from both the left and right table
SELECT Name, Gender, Salary, DepartmentName
FROM employee
FULL OUTER JOIN department
ON employee.DepartmentId = department.Id
WHERE department.Id IS NULL
  OR employee.DepartmentId IS NULL;

-- Example Output:
-- +--------+--------+--------+------------------+
-- | Name   | Gender | Salary | DepartmentName   |
-- +--------+--------+--------+------------------+
-- | James  | Male   | 6500   | NULL             |
-- | Russell| Male   | 8800   | NULL             |
-- | NULL   | NULL   | NULL   | Other Department |
-- +--------+--------+--------+------------------+
