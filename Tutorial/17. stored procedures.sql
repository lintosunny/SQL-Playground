-- A stored procedure is group of SQL statements. 
-- Instead of write the same query over and over again, save that specific query as a stored procedure and call it just by it's name.

-- Table: employee
-- +----+-------+--------+--------------+
-- | Id | Name  | Gender | DepartmentId |
-- +----+-------+--------+--------------+
-- | 1  | Sam   | Male   | 1            |
-- | 2  | Ram   | Male   | 1            |
-- | 3  | Sara  | Female | 3            |
-- | 4  | Todd  | Male   | 2            |
-- | 5  | John  | Male   | 3            |
-- | 6  | Sana  | Female | 2            |
-- | 7  | James | Male   | 1            |
-- | 8  | Rob   | Male   | 2            |
-- | 9  | Steve | Male   | 1            |
-- | 10 | Pam   | Female | 2            |
-- +----+-------+--------+--------------+

-- Creating simple stored procedure without any input parameters and encryption
CREATE PROCEDURE spGetEmployees
AS
BEGIN
  SELECT Name, Gender
  FROM employee
END;

-- Creating simple stored procedure without any input parameters with encryption
-- Once, encrypted, cannot view the text of the procedure, using sp_helptext system stored procedure.
CREATE PROCEDURE spGetEncryptedEmployees
WITH ENCRYPTION
AS
BEGIN
  SELECT Name, Gender
  FROM employee
END;

-- Creating simple stored procedure with input parameters and encryption
CREATE PROCEDURE spGetEmployeesByGenderAndDepartment
@Gender nvarchar(50),
@DepartmentId int
WiTH ENCRYPTION
AS
BEGIN
  SELECT Name, Gender
  FROM employee
  WHERE Gender = @Gender
    AND DepartmentId = @DepartmentId
END;

-- To change the stored procedure
ALTER PROCEDURE spGetEmployeesByGenderAndDepartment
@Gender nvarchar(50),
@DepartmentId int
WiTH ENCRYPTION
AS
BEGIN
  SELECT Name, Gender
  FROM employee
  WHERE Gender = @Gender
    AND DepartmentId = @DepartmentId
END;

-- Excecute stored procedure
-- EXECUTE spGetEmployeesByGenderAndDepartment @DepartmentId=1, @Gender = 'Male;

-- Delete stored procedure
DROP PROCEDURE spGetEmployeesByGenderAndDepartment;

-- Create stored procedure with output parameter
CREATE PROCEDURE spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int OUTPUT
AS
BEGIN
  SELECT @EmployeeCount = COUNT(Id)
  FROM employee
  WHERE Gender = @Gender
END;

-- Excecute stored procedure with outpupt parameter
DECLARE @EmployeeTotal int
EXECUTE spGetEmployeeCountByGender 'Female', @EmployeeTotal OUTPUT
PRINT @EmployeeTotal;

-- sp_helptext SP_Name : View the Text of the stored procedure
-- sp_depends SP_Name : View the dependencies of the stored procedure.

-- Advantages of stored procedure
-- 1. Excecution plan retention and reusability
-- 2. Reduce network traffic: only sendin sp_name instead of entire code
-- 3. Code reusability and better maintainability
-- 4. Better security
-- 5. Avoids SQL injection attack
