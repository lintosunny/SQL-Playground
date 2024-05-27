-- +----------------------+-------------------------------------+-----------------------------------------------------------+
-- | Function             | Date Time Format                    | Description                                               |
-- | -------------------- + ------------------------------------+-----------------------------------------------------------+
-- | GETDATE()            | 2012-08-31 20:15:04.543             | Commonly used function                                    |
-- | CURRENT_TIMESTAMP    | 2012-08-31 20:15:04.543             | ANSI SQL equivalent to GETDATE                            |
-- | SYSDATETIME()        | 2012-08-31 20:15:04.5380028         | More fractional seconds precision                         |
-- | SYSDATETIMEOFFSET()  | 2012-08-31 20:15:04.5380028 + 01:00 | More fractional seconds precision + Time zone offset      |
-- | GETUTCDATE()         | 2012-08-31 19:15:04.543             | UTC Date and Time                                         |
-- | SYSUTCDATETIME()     | 2012-08-31 19:15:04.5380028         | UTC Date and Time, with More fractional seconds precision |
-- +----------------------+-------------------------------------+-----------------------------------------------------------+

-- ISDATE(): check is given value is valid date, time, or datetime.
SELECT ISDATE(' linto ');  -- 0
SELECT ISDATE(GETDATE());  -- 1

-- DAY(): returns day number of the month
SELECT DAY('01/31/2021');  -- 31

-- MONTH(): returns month number of the year
SELECT MONTH('01/31/2021');  -- 1

-- YEAR(): returns year number
SELECT YEAR('01/31/2021');  -- 2021

-- DATENAME(DatePart, Date): returns a string that represents a part of given date
SELECT DATENAME(DAY, '2012-09-30');  -- 30
SELECT DATENAME(WEEKDAY, '2012-09-30');  -- Sunday
SELECT DATENAME(MONTH, '2012-09-30');  -- September
-- +-------------+---------------+
-- | DatePart    | Abbreviation  |
-- +-------------+---------------+
-- | year        | yy, yyyy      |
-- | quarter     | qq, q         |
-- | month       | mm, m         |
-- | dayofyear   | dy, y         |
-- | day         | dd, d         |
-- | week        | wk, ww        |
-- | weekday     | dw            |
-- | hour        | hh            |
-- | minute      | mi, n         |
-- | second      | ss, s         |
-- | millisecond | ms            |
-- | microsecond | mcs           |
-- | nanosecond  | ns            |
-- | TZoffset    | tz            |
-- +-------------+---------------+

-- DATEPART(DatePart, Date): returns an integer representing the specified DatePart.
SELECT DATENAME(DAY, '2012-09-30');  -- 30
SELECT DATENAME(WEEKDAY, '2012-09-30');  -- 1
SELECT DATENAME(MONTH, '2012-09-30');  -- 9

-- DATEADD(DatePart, NumberToAdd, Date): returns datetime after adding specified no.of DatePart
SELECT DATEADD(DAY, 20, '2012-08-30');  -- 2012-09-19
SELECT DATEADD(DAY, -20, '2012-08-30');  -- 2012-08-10

-- DATEDIFF(DatePart, StartDate, EndDate): returns count of DatePart between dates
SELECT DATEDIFF(MONTH, '11/30/2005','01/31/2006')  -- 2
SELECT DATEDIFF(DAY, '11/30/2005','01/31/2006')  -- 62 
