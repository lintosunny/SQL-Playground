-- View is a saved SQL query. Also can be considered as a virtual table.

-- Example input: employee
-- +----+------+--------+--------+--------------+
-- | id | name | salary | gender | departmentid |
-- +----+------+--------+--------+--------------+
-- | 1  | John | 5000   | Male   | 3            |
-- | 2  | Mike | 3400   | Male   | 2            |
-- | 3  | Pam  | 6000   | Female | 1            |
-- | 4  | Todd | 4800   | Male   | 4            |
-- | 5  | Sara | 3200   | Female | 1            |
-- | 6  | Ben  | 4800   | Male   | 3            |
-- +----+------+--------+--------+--------------+

-- Example input: department
-- +-------+-----------+
-- | deptid| deptname  |
-- +-------+-----------+
-- | 1     | IT        |
-- | 2     | Payroll   |
-- | 3     | HR        |
-- | 4     | Admin     |
-- +-------+-----------+

-- Create view
CREATE VIEW vWEmployeeDepartment
AS
SELECT id, name, salary, gender, deptname
FROM employee
JOIN department
  ON employee.departmentid = department.deptid;

-- Select data from view
SELECT *
FROM vWEmployeeDepartment;

-- Advantages
-- 1. Reduced complexity of database schema
-- 2. Row level security
-- 3. Column level security
-- 4. Views can only present aggregated data and hide detailed data
