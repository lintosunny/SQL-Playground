-- It allows to define the actions should take when a user attempts to delete or update a key to which an existing foreign keys points.

-- However, you have the following options when setting up Cascading referential integrity constraint
-- 1. No Action: This is the default behaviour. 
-- 2. Cascade: all rows containing those foreign keys are also deleted or updated.
-- 3. Set NULL: all rows containing those foreign keys are set to NULL.  
-- 4. Set Default: all rows containing those foreign keys are set to default values.
