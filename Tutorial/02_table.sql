-- Create table
CREATE TABLE TableName (
    Column1 DataType Constraints,
    Column2 DataType Constraints,
    Column3 DataType Constraints,
    ...
    CONSTRAINT ConstraintName ConstraintType (ColumnReference) ConstraintRules,
    ...
    PRIMARY KEY (PrimaryKeyColumn),
    FOREIGN KEY (ForeignKeyColumn) REFERENCES ReferencedTable (ReferencedColumn),
    ...
);


-- Add values to the table
INSERT INTO table_name ( column1 , column2 , . . . columnN )
VALUES ( value1 , value2 , . . . valueN );
