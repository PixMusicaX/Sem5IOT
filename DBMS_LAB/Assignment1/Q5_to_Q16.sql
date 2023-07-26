-- q5 Write a query to create a table employee with empno, ename, designation and salary.
CREATE TABLE employee (
    empno INT PRIMARY KEY,
    ename VARCHAR(50) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

--q6  Write a query to display the column name and data type of the table employee
desc employee;

--q7 Write a query to create a table from an existing table with all the fields
CREATE TABLE new_table AS 
SELECT * FROM employee;

--q8 Write a query to create table from an existing table with selected fields.
CREATE TABLE new_table2 AS 
SELECT EMPNO, ENAME FROM employee;

--q9 Write a query to create a new table from an existing table without any record.
CREATE TABLE new_table3 AS
SELECT * FROM employee WHERE 1=0;
-- "WHERE 1=0 resets all table parameters"

--q10 Write a query to Alter the column empno number(4) to empno number(6).
ALTER TABLE employee
MODIFY empno NUMBER(6);

--q11 Write a query to Alter the table employee with multiple columns (empno, ename).
ALTER TABLE employee
MODIFY (empno NUMBER(6),
        ename VARCHAR(100));

--q12 Write a query to add a new column in employee table.
ALTER TABLE employee
ADD age INT;

--q13 Write a query to add multiple columns in employee table.
ALTER TABLE employee
ADD (
    email VARCHAR(100),
    is_active NUMBER(1)
);

--q14 Write a query to drop a column from an existing table employee.
ALTER TABLE employee
DROP COLUMN age;

--q15 Write a query to drop multiple columns from the employee table.
ALTER TABLE employee
DROP COLUMN EMAIL, 
DROP COLUMN IS_ACTIVE;

--q16 Write a query to rename table employee to emp
ALTER TABLE employee
RENAME TO emp;

desc emp;
