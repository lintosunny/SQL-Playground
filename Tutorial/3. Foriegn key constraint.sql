-- Foreign keys are used to enforce database integrity.  
-- In layman's terms, A foreign key in one table points to a primary key in another table. The foreign key constraint prevents invalid data form being inserted into the foreign key column. 
-- The values that you enter into the foreign key column, has to be one of the values contained in the table it points to.

Alter table ForeignKeyTable add constraint ForeignKeyTable_ForiegnKeyColumn_FK 
FOREIGN KEY (ForiegnKeyColumn) references PrimaryKeyTable (PrimaryKeyColumn)