-- ASCII(): Returns the ASCII code of the given character expression.
SELECT ASCII('A');
-- Output: 65

-- CHAR(): Converts an int ASCII code to a character. The Integer_Expression, should be between 0 and 255.
SELECT ASCII(65);
-- Output: A

-- LTRIM(): Removes blanks on the left handside of the given character expression.
SELECT LTRIM('   Hello');
-- Output: Hello

-- RTRIM(): Removes blanks on the right hand side of the given character expression.
SELECT RTRIM('Hello   ');
-- Output: Hello

-- LOWER(): Converts all the characters in the given Character_Expression, to lowercase letters.
SELECT LOWER('CONVERT This');
-- Output: convert this

-- UPPER(C): Converts all the characters in the given Character_Expression, to uppercase letters.
SELECT UPPER('CONVERT This String Into upper Case');
-- Output: CONVERT THIS STRING INTO UPPER CASE

-- REVERSE(): Reverses all the characters in the given string expression.
SELECT REVERSE('ABCDEFGHIJKLMNOPQRSTUVWXYZ');
-- Output: ZYXWVUTSRQPONMLKJIHGFEDCBA

-- LEN(): Returns the count of total characters, in the given string expression, excluding the blanks at the end of the expression.
SELECT LEN('SQL Functions   ');
-- Output: 13

-- LEFT(): Returns the specified number of characters from the left hand side of the given character expression.
SELECT LEFT('ABCDE', 3);
-- Output: ABC

-- RIGHT(): Returns the specified number of characters from the right hand side of the given character expression.
SELECT RIGHT('ABCDE', 3);
-- Output: CDE

-- CHARINDEX('Expression_To_Find', 'Expression_To_Search', 'Start_Location'): Returns the starting position of the specified expression
SELECT CHARINDEX('@','sara@aaa.com',1);
-- Output: 5

-- SUBSTRING('Expression', 'Start', 'Length'): returns substring, from the given expression. 
SELECT SUBSTRING('John@bbb.com',6, 7);
-- Output: bbb.com

-- CHARINDEX() with SUBSTRING():
SELECT SUBSTRING('John@bbb.com',(CHARINDEX('@', 'John@bbb.com') + 1), (LEN('John@bbb.com') - CHARINDEX('@','John@bbb.com')));
-- Output: bbb.com

-- REPLICATE(String_To_Be_Replicated, Number_Of_Times_To_Replicate): Repeats the given string, for the specified number of times.
SELECT REPLICATE('linto', 3);
-- Output: linto linto linto 

-- SPACE(Number_Of_Spaces) - Returns number of spaces, specified by the Number_Of_Spaces argument.
SELECT 'Linto' + SPACE(2) + 'Sunny';
-- output: Linto  Sunny

-- PATINDEX('%Pattern%', Expression): Returns the starting position of the first occurrence of a pattern.
-- simial to CHARINDEX(). But with PATINDEX() we can use wildcards. If pattern is not found, returns ZERO.
SELECT PATINDEX('%@aaa.com', 'sam%@aaa.com');
-- output: 4

-- STUFF(Original_Expression, Start, Length, Replacement_expression): inserts Replacement_expression.
SELECT STUFF('sara@aaa.com', 2, 3, '***');
-- output: s***@aaa.com

-- REPLACE(String_Expression, Pattern , Replacement_Value)
SELECT REPLACE('sam@aaa.com', 'com', 'in);
-- output: sam@aaa.in
