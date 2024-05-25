-- for identity column, values are automatically generated, when insert a new row into the table.
-- Seed and Increment values are optional. Default value is 1.

-- creating table with identity column
Create Table tblPerson
(
PersonId int Identity(1,1) Primary Key,
Name nvarchar(20)
)

-- insert values to only name column
Insert into tblPerson values ('Sam')
Insert into tblPerson values ('Sara')

-- 'Sam' and 'Sara' rows have got 1 and 2 as PersonId.
-- It has to be automatically generated. can't give values explicitly.
