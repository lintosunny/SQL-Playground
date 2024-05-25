-- CHECK constraint is used to limit the range of the values, that can be entered for a column.
-- Use case: AGE cannot be less than ZERO. But, an integer column can accept negative values. Use CHECK constraint to limit this.

-- The general formula for adding check constraint in SQL Server:
ALTER TABLE { TABLE_NAME }
ADD CONSTRAINT { CONSTRAINT_NAME } CHECK ( BOOLEAN_EXPRESSION )

-- The following check constraint, limits the age between ZERO and 150.
ALTER TABLE tblPerson
ADD CONSTRAINT CK_tblPerson_Age CHECK (Age > 0 AND Age < 150)

-- To drop the CHECK constraint:
ALTER TABLE tblPerson
DROP CONSTRAINT CK_tblPerson_Age
