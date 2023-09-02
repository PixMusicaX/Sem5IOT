-- Note: this is a direct continuation from A3_16_to_25.sql

-- 1. Show the use of upper and lower function.

SELECT UPPER('hello') AS upper_case_text, LOWER('WORLD') AS lower_case_text FROM DUAL;

-- 2. Show the use of concat, instr and length function

SELECT 
  CONCAT('Hello', ' ', 'World') AS concatenated_text,
  INSTR('Hello World', 'World') AS position_of_world,
  LENGTH('Hello World') AS length_of_text
FROM DUAL;

-- 3. Show the use of the following functions on numeric values:
-- a. SQRT()
SELECT SQRT(25) AS square_root FROM DUAL;

-- b. POWER()
SELECT POWER(2, 3) AS power_result FROM DUAL;

-- c. CEIL()
SELECT CEIL(4.3) AS ceiling_value FROM DUAL;

-- d. SUBSTR()
SELECT SUBSTR('Hello, World!', 8) AS substring_result FROM DUAL;

-- e. MAX() 
SELECT MAX(salary) FROM employee;

-- f. MIN()
SELECT MIN(salary) FROM employee;

-- g. ROUND()
SELECT ROUND(3.14159, 2) AS rounded_value FROM DUAL;

-- h. AVG()
SELECT AVG(salary) AS average_value FROM employee;

-- i. COUNT()
SELECT COUNT(*) AS total_rows FROM DUAL;

-- j. EXP()
SELECT EXP(2) AS exponential_value FROM DUAL;

-- k. MOD()
SELECT MOD(15, 4) AS remainder_value FROM DUAL;

-- [Using Dual wasn't possible for MAX, AVG and MIN]

-- 4. Solve the following queries:
-- a. Find the ceiling and floor value of 14.887.
SELECT CEIL(14.887) AS ceiling_value, FLOOR(14.887) AS floor_value FROM DUAL;

-- b. Find out the round-off 17.49989.
SELECT ROUND(17.49989) AS rounded_value FROM DUAL;

-- c. Calculate 8^7.
SELECT POWER(8, 7) AS result FROM DUAL;

-- 5. Show the current date [Write any one]

SELECT DATE_FORMAT(NOW(), '%Y/%d/%m') AS `Date`; -- MySQL

SELECT TO_CHAR (sysdate , 'yyyy/dd/mm') "Date" from Dual; -- OracleSQL

-- 6. Find the total experience of the employees in weeks who works in Sales department

-- MySQL
SELECT f_name, l_name, ROUND(DATEDIFF(NOW(), date_of_joining) / 7) AS total_experience_in_weeks
FROM employee
WHERE dept = 'Sales';

-- OracleSQL
SELECT f_name, l_name, ROUND((MONTHS_BETWEEN(SYSDATE, date_of_joining) / 30) * 7) AS total_experience_in_weeks
FROM employee
WHERE dept = 'Sales';

-- Note: Anything after this has to be done in OracleSQL due to the demands in question.

-- 7. Display the use of the following functions on date:
-- a. Months_between
SELECT MONTHS_BETWEEN(TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-02-15', 'YYYY-MM-DD')) AS months_diff FROM DUAL;

-- b. Add_months
SELECT ADD_MONTHS(TO_DATE('2023-08-15', 'YYYY-MM-DD'), 3) AS new_date FROM DUAL;

-- c. Next_day
SELECT NEXT_DAY(TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'SUNDAY') AS next_sunday FROM DUAL;

-- d. Last_day
SELECT LAST_DAY(TO_DATE('2023-08-15', 'YYYY-MM-DD')) AS last_day_of_month FROM DUAL;

-- e. Round
SELECT ROUND(TO_DATE('2023-08-15 14:30:45', 'YYYY-MM-DD HH24:MI:SS'), 'HH') AS rounded_time FROM DUAL;

-- f. Trunc
SELECT TRUNC(TO_DATE('2023-08-15 14:30:45', 'YYYY-MM-DD HH24:MI:SS'), 'MM') AS truncated_date FROM DUAL;

-- g. To_char
SELECT TO_CHAR(TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Month DD, YYYY') AS formatted_date FROM DUAL;
