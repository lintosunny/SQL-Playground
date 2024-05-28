-- Write a query to generate students grade report. 
-- if the grade is lower than 8, use "NULL" as their name; the report must be in descending order by grade. 
-- If there are students with the same grade, order those particular students by their name alphabetically.

-- Table: students
-- +--------+---------+
-- | Column | Type    |
-- +--------+---------+
-- | ID     | Integer |
-- | Name   | String  |
-- | Marks  | Integer |
-- +--------+---------+

-- Example input: students
-- +----+----------+-------+
-- | ID | Name     | Marks |
-- +----+----------+-------+
-- | 1  | Julia    | 88    |
-- | 2  | Samantha | 68    |
-- | 3  | Maria    | 99    |
-- | 4  | Scarlet  | 78    |
-- | 5  | Ashley   | 63    |
-- | 6  | Jane     | 81    |
-- +----+----------+-------+

-- Table: grades
-- +----------+---------+
-- | Column   | Type    |
-- +----------+---------+
-- | Grade    | Integer |
-- | Min_Mark | String  |
-- | Max_Mark | Integer |
-- +----------+---------+

-- Example input: grades
-- +-------+----------+----------+
-- | Grade | Min_Mark | Max_Mark |
-- +-------+----------+----------+
-- | 1     | 0        | 9        |
-- | 2     | 10       | 19       |
-- | 3     | 20       | 29       |
-- | 4     | 30       | 39       |
-- | 5     | 40       | 49       |
-- | 6     | 50       | 59       |
-- | 7     | 60       | 69       |
-- | 8     | 70       | 79       |
-- | 9     | 80       | 89       |
-- | 10    | 90       | 100      |
-- +-------+----------+----------+

-- Example output
-- +----------+--------+--------+
-- |  Name    |  Grade |  Marks |
-- +----------+--------+--------+
-- |  Maria   | 10     | 99     |
-- |  Jane    | 9      | 81     |
-- |  Julia   | 9      | 88     |
-- |  Scarlet | 8      | 78     |
-- |  NULL    | 7      | 68     |
-- |  NULL    | 7      | 63     |
-- +----------+--------+--------+

-- Solution
SELECT
  CASE WHEN grades.Grade >= 8 THEN Name ELSE NULL END AS Name,
  grades.Grade,
  students.Marks
FROM students
LEFT JOIN grades
 ON students.Marks BETWEEN grades.Min_Mark AND grades.Max_mark
ORDER BY Grade DESC, Name ASC;
