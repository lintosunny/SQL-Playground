-- Write a query to determine which parts have begun the assembly process but are not yet finished.
-- Assumptions:
-- 1. parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
-- 2. An unfinished part is one that lacks a finish_date.

-- Table: parts_assembly
-- +----------------+----------+
-- | Column Name    | Type     |
-- +----------------+----------+
-- | part           | string   |
-- | finish_date    | datetime |
-- | assembly_step  | integer  |
-- +----------------+----------+

-- Example Input for parts_assembly Table
-- +---------+---------------------+---------------+
-- | part    | finish_date         | assembly_step |
-- +---------+---------------------+---------------+
-- | battery | 01/22/2022 00:00:00 | 1             |
-- | battery | 02/22/2022 00:00:00 | 2             |
-- | battery | 03/22/2022 00:00:00 | 3             |
-- | bumper  | 01/22/2022 00:00:00 | 1             |
-- | bumper  | 02/22/2022 00:00:00 | 2             |
-- | bumper  |                     | 3             |
-- | bumper  |                     | 4             |
-- +---------+---------------------+---------------+

-- Example Output
-- +---------+---------------+
-- | part    | assembly_step |
-- +---------+---------------+
-- | bumper  | 3             |
-- | bumper  | 4             |
-- +---------+---------------+


-- Solution
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
