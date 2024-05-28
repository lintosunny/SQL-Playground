-- Database normalization is the process of organizing data to minimize data duplication, which in turn ensure data consistency.

-- First Normal form (1NF)
-- 1. atomic. no multiple values, separated by comma.
-- 2. does not contain any repeating columns.
-- 3. identify each record uniquely using primary key.

-- +----------+-------------------+          +---------+----------+       +---------+----------+       
-- | DeptName | Employee          |          | Deptid  | DeptName |       | Deptid  | Employee |
-- +----------+-------------------+          +---------+----------+       +---------+----------+
-- | IT       | Sam, Mike, Shan   |   --->   | 1       | IT       |   +   | 1       | Sam      |
-- | HR       | Pam               |          | 2       | HR       |       | 1       | Mike     |
-- +----------+-------------------+          +---------+----------+       | 1       | Shan     |
                                                                          | 2       | Pam      |
                                                                          +---------+----------+

-- Second Normal form (2NF)
-- 1. meets all the conditions of 1NF
-- 2. move redundant data to a separate table
-- 3. create relationship between these tables using foreign keys

-- +-------+--------------+--------+---------+---------+          +------+--------------+--------+--------+       +-------+----------+----------+
-- | Empld | EmployeeName | Salary | DeptName| DeptHead|          | Empld| EmployeeName | Salary | DeptId |       |Deptid | DeptName | DeptHead |
-- +-------+--------------+--------+---------+---------+          +------+--------------+--------+--------+       +-------+----------+----------+
-- | 1     | Sam          | 4500   | IT      | John    |          |    1 | Sam          | 4500   | 1      |       | 1     | IT       | John     |
-- | 2     | Pam          | 2300   | HR      | Mike    |   --->   |    2 | Pam          | 2300   | 2      |   +   | 2     | HR       | Mike     |
-- | 3     | Simon        | 1345   | IT      | John    |          |    3 | Simon        | 1345   | 1      |       +-------+----------+----------+
-- +-------+--------------+--------+---------+---------+          +------+--------------+--------+--------+ 

-- Third Normal form (3NF)
-- most databases in third form
-- 1. meets all the conditions of 2NF
-- 2. does not contain columns that are not fully dependent upon the primary key

-- Fourth Normal form (4NF)
-- Fifth Normal form (5NF)
-- Sixth Normal form (6NF)
