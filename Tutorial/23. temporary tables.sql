-- temporary tables get created in the TempDB and are automatically deleted, when they are no longer used.
-- there are 2 types of Temporary tables - Local Temporary tables and Global Temporary tables.

-- Create local temp table
CREATE TABLE #PersonDetails (
  Id int,
  Name nvarchar(20)
);

INSERT INTO #PersonDetails VALUES(1, 'Mike');
INSERT INTO #PersonDetails VALUES(2, 'Jhon');
INSERT INTO #PersonDetails VALUES(3, 'Todd');

-- if temp table, is created inside stored procedure, it gets dropped automatically upon the completion.
CREATE PROCEDURE spCreateLocalTempTable
AS
BEGIN
  CREATE TABLE #PersonDetails (
  Id int,
  Name nvarchar(20)
  )

  INSERT INTO #PersonDetails VALUES(1, 'Mike')
  INSERT INTO #PersonDetails VALUES(2, 'Jhon')
  INSERT INTO #PersonDetails VALUES(3, 'Todd')

  SELECT * FROM #PersonDetails
END;

-- Create a global temp table
CREATE TABLE ##EmployeeDetails (
  Id int,
  Name nvarchar(20)
);

-- Local vs Global temp table
-- +----------------------------------------------------+---------------------------------------------------+
-- | Local temp table                                   | Global temp table                                 |
-- +----------------------------------------------------+---------------------------------------------------+
-- | prefixed with single pound (#)                     | prefixed with two pounds (##)                     |
-- | visible to the session created table               | visible to all sql sessions                       |
-- | dropped when session that created table is closed  | when last connection referencing table is closed  |
-- +----------------------------------------------------+---------------------------------------------------+
