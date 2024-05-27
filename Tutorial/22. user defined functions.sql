-- three types of User Defined Functions
-- 1. Scalar functions
-- 2. Inline table-valued functions
-- 3. Multistatement table-valued functions

-- Table: employees
-- +----+------+-------------+--------+-------------+
-- | Id | Name | DateOfBirth | Gender | Departmentid|
-- +----+------+-------------+--------+-------------+
-- | 1  | Sam  | 1980-12-30  | Male   | 1           |
-- | 2  | Pam  | 1982-09-01  | Female | 2           |
-- | 3  | John | 1985-08-22  | Male   | 1           |
-- | 4  | Sara | 1979-11-29  | Female | 3           |
-- | 5  | Todd | 1978-11-29  | Male   | 1           |
-- +----+------+-------------+--------+-------------+

-- Scalar function: may or may not have parameters, but always return single (scalar) value.
-- returned value can any data type except text, ntext, image, cursor, and, timestamp
CREATE FUNCTION Age(@DOB Date)  
RETURNS INT  
AS  
BEGIN  
 DECLARE @Age INT  
 SET @Age = DATEDIFF(YEAR, @DOB, GETDATE())
  - CASE WHEN (MONTH(@DOB) > MONTH(GETDATE())) 
    OR (MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) THEN 1 ELSE 0 END  
 RETURN @Age  
END;

SELECT dbo.Age( dbo.Age('10/08/1982');
SELECT SampleDB.dbo.Age('10/08/1982');
  
-- Inline table-valued function: return a table
CREATE FUNCTION fn_EmployeesByGender(@Gender nvarchar(10))
RETURN TABLE
AS 
RETURN (
  SELECT Id, Name, DateOfBirth, Gender, Departmentid
  FROM employees
  WHERE Gender = @Gender
);

SELECT * FROM fn_EmployeesByGender('Male')

-- Multi-statement table valued function
CREATE FUNCTION fn_MSTVF_GetEmployees()
RETURNS @TABLE TABLE (Id int, Name nvarchar(20), DOB Date)
AS
BEGIN
 INSERT INTO @TABLE
 SELECT Id, Name, CAST(DateOfBirth AS Date)
 FROM tblEmployees
 
 RETURN
END;

Select * from fn_MSTVF_GetEmployees()


-- Comparison: Inline TVFs vs Multi-Statement TVFs
-- +---------------------------------------------------------------+-------------------------------------------------------------------------------+
-- | Inline Table Valued Functions                                 | Multi-Statement Table Valued Functions                                        |
-- +---------------------------------------------------------------+-------------------------------------------------------------------------------+
-- | do not include the table structure in the RETURNS clause;     | specify the structure of the table to be returned in the RETURNS clause.      |
-- +---------------------------------------------------------------+-------------------------------------------------------------------------------+
-- | do not use BEGIN and END blocks; they directly return data    | can use BEGIN and END blocks for more complex logic and processing.           |
-- +---------------------------------------------------------------+-------------------------------------------------------------------------------+
-- | better performance due to their direct data   return approach | may have slightly lower performance due to the additional processing steps.   |
-- +---------------------------------------------------------------+-------------------------------------------------------------------------------+
