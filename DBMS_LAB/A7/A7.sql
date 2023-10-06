--Table Preparation

CREATE TABLE Employee( 
emp_id number(10) PRIMARY KEY, 
f_name varchar(10),
l_name varchar(10),
job_type varchar(10),
salary number(10),
Commission number(10),
dept varchar(10),
manager_id number(10),
doj date);


INSERT INTO Employee VALUES(1,'Arun', 'Khan', 'Manager', 90000, '' ,'Production', '', '04-Jan-1998');
INSERT INTO Employee VALUES(2,'Barun', 'Kumar', 'Manager', 80000, '' ,'Marketing', '', '09-Feb-1998');
INSERT INTO Employee VALUES(3,'Chitra', 'Kapoor', 'Engineer', 60000, '' ,'Production', 1, '08-Jan-1998');
INSERT INTO Employee VALUES(4,'Dheeraj', 'Mishra', 'Manager', 75000, '' ,'Sales', 4, '27-Dec-2001');
INSERT INTO Employee VALUES(5,'Emma', 'Dutt', 'Engineer', 55000, '' ,'Production', 1, '2-Mar-2002');
INSERT INTO Employee VALUES(6,'Floki', 'Dutt', 'Accountant', 70000, '' ,'Accounts', '', '16-Jul-2000');
INSERT INTO Employee VALUES(7,'Dheeraj', 'Kumar', 'Clerk', 40000, '' ,'Accounts', 6, '01-Jul-2016');
INSERT INTO Employee VALUES(8,'Saul', 'Good', 'Engineer', 60000, '' ,'R&D', '', '06-Sep-2014');
INSERT INTO Employee VALUES(9,'Mou', 'Bhat', 'Clerk', 30000, '' ,'Sales', 4, '08-Mar-2018');
INSERT INTO Employee VALUES(10,'Sunny', 'Deol', 'Salesman', 20000, 10000,'Marketing', 2, '31-Mar-2001');
INSERT INTO Employee VALUES(11,'Bobby', 'Deol', 'Engineer', 35000, '' ,'R&D', 8, '17-Oct-2017');
INSERT INTO Employee VALUES(12,'Aamir', 'Khan', 'Salesman', 15000, 5000,'Marketing', 2, '11-Jan-2013');

CREATE TABLE Department (
  d_name VARCHAR2(10) PRIMARY KEY,
  d_loc VARCHAR2(10),
  hod_id NUMBER(10)
);


INSERT into Department VALUES('Sales','Kol', 4);
INSERT into Department VALUES('Accounts','Delhi', 6);
INSERT into Department VALUES('Production','Kol', 1);
INSERT into Department VALUES('Marketing','Kol', 2);
INSERT into Department VALUES('R&D','Mumbai', 8);

create table Job_History (emp_id number(10),
start_date date,
end_date date,
job_type varchar2(20),
d_name varchar2(20));

insert into Job_History values (1, '04-Jun-1998', '30-Jun-2001', 'Engineer', 'Production');
insert into Job_History values (2, '09-Feb-1998', '28-Feb-2002', 'Salesman', 'Sales');
insert into Job_History values (1, '01-Jul-2001', '31-Dec-2010', 'Manager', 'R&D');
insert into Job_History values (4, '27-Dec-2001', '19-Dec-2016', 'Sales_Executive', 'Marketing');
insert into Job_History values (2, '01-Mar-2002', '30-Mar-2015', 'Sales_Executive', 'Marketing');
insert into Job_History values (2, '01-Apr-2016', '15-Dec-2017', 'Manager', 'Sales');
insert into Job_History values (4, '20-Sep-2016', '16-Dec-2017', 'Asst. Manager', 'Sales');
insert into Job_History values (6, '16-Jul-2000', '30-Nov-2006', 'Clerk', 'Accounts');
insert into Job_History values (5, '20-Mar-2002', '12-Aug-2011', 'Engineer', 'R&D');
insert into Job_History values (1, '01-Jan-2011', '31-Jan-2012', 'Engineer', 'Production');

SELECT * FROM Job_History;
SELECT * FROM Department;
SELECT * FROM Employee;

-- 2. Display the previous and current job_types of all the employees.
SELECT employee.F_name, employee.job_type AS PrevJob, Job_History.job_type CurrJob FROM employee
JOIN job_history ON employee.Emp_id = Job_History.Emp_id;

-- 3. Display the previous and current department and job_types of all the employees.
SELECT employee.F_name, employee.dept AS PrevDept, Job_History.D_name AS CurrDept, Job_History.job_type FROM employee
JOIN job_history ON employee.Emp_id = Job_History.Emp_id;

-- 4. Display the employee id and job_types of the employees who currently have a job title that they held previously.
SELECT employee.Emp_id, Job_history.job_type FROM employee
JOIN job_history ON employee.Emp_id = Job_History.Emp_id
WHERE employee.job_type = Job_History.job_type;

-- 5. Find the name of those employees who have not changed their jobs once.
SELECT employee.F_name || ' ' || employee.L_name AS NameOfEmployee
FROM employee
JOIN job_history ON employee.Emp_id = job_history.Emp_id
WHERE employee.job_type = job_history.job_type;

-- 6. Find the names of the employees who earn more than Chitra.
SELECT F_name || ' ' || L_name AS NameOfEmployee
FROM employee
WHERE salary > (SELECT salary FROM employee WHERE F_name = 'Chitra');

-- 7. Find the details of those employees who have the same job_type as of emp_id 7.
SELECT *FROM employee
WHERE job_type = (SELECT job_type FROM employee WHERE Emp_id = 7);

-- 8. Find the details of the employees whose job_type is same as that of emp_id 3 and whose salary is greater than that of emp_id 7.
SELECT *FROM employee
WHERE job_type = (SELECT job_type FROM employee WHERE Emp_id = 3) AND salary > (SELECT salary FROM employee WHERE Emp_id = 7);

-- 9. Display l_name, job_type and the salary of the employees whose salary is equal to the minimum salary.
SELECT L_name, job_type, salary FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee);

-- 10. Find the job_type with lowest average salary.
SELECT job_type, AVG(salary) AS average_salary
FROM employee
GROUP BY job_type
HAVING AVG(salary) = (SELECT MIN(AVG(salary)) FROM employee GROUP BY job_type);

-- 11. Display all the departments that have a minimum salary greater than that of ‘Sales’ department.
SELECT dept FROM employee GROUP BY dept
HAVING MIN(salary) > (SELECT MIN(salary) FROM employee WHERE dept = 'Sales');

-- 12. Find the employees who earn the same salary for each department.
SELECT d_name
FROM Department
WHERE (SELECT MIN(salary) FROM employee WHERE job_type = 'Sales') < ALL
      (SELECT MIN(salary) FROM employee WHERE job_type = Department.d_name)
GROUP BY d_name;

-- 13. Display the employees who are not engineers and whose salary is less than that of any engineer.
SELECT F_name || ' ' || L_name AS NameOfEmployee
FROM employee
WHERE job_type != 'Engineer' AND salary < (SELECT MIN(salary) FROM employee WHERE job_type = 'Engineer');

-- 14. Display the employees whose salary is less than the salary of all employees with a job_type ‘Clerk’ and whose job_type is not ‘Clerk’.
SELECT F_name || ' ' || L_name AS NameOfEmployee
FROM employee
WHERE salary < (SELECT MIN(salary) FROM employee WHERE job_type = 'Clerk') AND job_type != 'Clerk';

-- 15. Consider the following database of students enrollment in courses and books adopted for each course.

-- STUDENT(regno: string, name: string, major: strong, bdate: date)
-- COURSE(course-no: int cname: string, dept: string)
-- ENROLL(reg-no: string, course-no: int, sem: int, marks: int)
-- BOOK-ADOPTION(course-no: int, sem: int, book-isbn: int)
-- TEXT(book-isbn: int, book-title: string, publisher: string, author: string)

-- i) Create the above tables by properly specifying the primary keys and the foreign keys

CREATE TABLE STUDENT (
    regno VARCHAR2(25),
    name VARCHAR2(25),
    major VARCHAR2(25),
    bdate DATE
);

CREATE TABLE COURSE (
    course_no NUMBER(25),
    cname VARCHAR2(25),
    dept VARCHAR2(25)
);

CREATE TABLE ENROLL (
    reg_no VARCHAR2(25),
    course_no NUMBER(25),
    sem NUMBER(25),
    marks NUMBER(25)
);

CREATE TABLE BOOK_ADOPTION (
    course_no NUMBER(25),
    sem NUMBER(25),
    book_isbn NUMBER(25)
);

CREATE TABLE TEXT (
    book_isbn NUMBER(25),
    book_title VARCHAR2(25),
    publisher VARCHAR2(25),
    author VARCHAR2(25)
);


-- ii) Enter atleast five tuples for each relation.

INSERT INTO STUDENT (regno, name, major, bdate)
VALUES ('10000', 'Paul', 'UG', TO_DATE('2023-07-24', 'YYYY-MM-DD'));

INSERT INTO STUDENT (regno, name, major, bdate)
VALUES ('10001', 'Deol', 'PG', TO_DATE('2023-06-28', 'YYYY-MM-DD'));

INSERT INTO STUDENT (regno, name, major, bdate)
VALUES ('10002', 'Adin', 'UG', TO_DATE('2023-06-09', 'YYYY-MM-DD'));

INSERT INTO STUDENT (regno, name, major, bdate)
VALUES ('10003', 'Andrew', 'PG', TO_DATE('2023-08-07', 'YYYY-MM-DD'));

INSERT INTO STUDENT (regno, name, major, bdate)
VALUES ('10004', 'Devin', 'UG', TO_DATE('2023-09-28', 'YYYY-MM-DD'));


INSERT INTO COURSE (course_no, cname, dept)
VALUES (501, 'BTech', 'CSE');

INSERT INTO COURSE (course_no, cname, dept)
VALUES (402, 'BTech', 'CSE(IOT)');

INSERT INTO COURSE (course_no, cname, dept)
VALUES (603, 'BTech', 'ME');

INSERT INTO COURSE (course_no, cname, dept)
VALUES (805, 'BTech', 'ECE');

INSERT INTO COURSE (course_no, cname, dept)
VALUES (107, 'BTech', 'CSIT');


INSERT INTO ENROLL (reg_no, course_no, sem, marks)
VALUES ('ABC', 501, 2, 85);

INSERT INTO ENROLL (reg_no, course_no, sem, marks)
VALUES ('DEF', 402, 4, 67);

INSERT INTO ENROLL (reg_no, course_no, sem, marks)
VALUES ('GHI', 603, 5, 98);

INSERT INTO ENROLL (reg_no, course_no, sem, marks)
VALUES ('JKL', 805, 1, 56);

INSERT INTO ENROLL (reg_no, course_no, sem, marks)
VALUES ('MNO', 107, 6, 66);


INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (501, 2, 2501);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (402, 4, 2521);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (603, 5, 2551);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (805, 1, 2351);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (107, 6, 2751);


INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2501, 'The Android Odyssey', 'R. A. Townsend Co', 'Paula');

INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2551, 'The Sorcerer Apprentice', 'Florida Sports Magazine', 'Kenway');

INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2751, 'Unraveled Mysteries', 'Com Media Llc', 'Randy');

INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2753, 'Secrets Unveiled', 'Hidden Knowledge Publications', 'Samuel');

INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2521, 'The Unseen Threat', 'Great Woods Family', 'Edward');

-- iii) Demonstrate how you add a new text book to the database and make this book be adopted by some department.

-- Step 1: Insert the new textbook information into the "TEXT" table
INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2754, 'Exploring Mysteries', 'Knowledge World', 'Sophia');

-- Step 2: Insert the adoption information into the "BOOK_ADOPTION" table
INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (501, 2, 2754);

-- iv) Produce a list of text books (include Course-no, book-isbn, book-title) in the alphabetical order for courses offered by the ‘Compute Science’ department that use more than two books.

INSERT INTO COURSE (course_no, cname, dept)
VALUES (401, 'Computer Networks', 'CSE(IOT)');

INSERT INTO COURSE (course_no, cname, dept)
VALUES (402, 'Internet of Things', 'CSE(IOT)');

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (401, 1, 2751);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (401, 1, 2752);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (401, 1, 2753);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (402, 2, 2752);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (402, 2, 2753);

INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2751, 'Unraveled Mysteries', 'Com Media Llc', 'Randy');

INSERT INTO TEXT (book_isbn, book_title, publisher, author)
VALUES (2753, 'Secrets Unveiled', 'Hidden Knowledge Pub', 'Samuel');

SELECT BA.course_no, BA.book_isbn, T.book_title
FROM BOOK_ADOPTION BA
JOIN TEXT T ON BA.book_isbn = T.book_isbn
JOIN COURSE C ON BA.course_no = C.course_no
WHERE C.dept = 'CSE(IOT)'
GROUP BY BA.course_no, BA.book_isbn, T.book_title
HAVING COUNT(*) > 2
ORDER BY T.book_title;

-- v) List any department that has all its adopted books published by a specific publisher

INSERT INTO COURSE (course_no, cname, dept)
VALUES (701, 'Data Science', 'Computer Science');

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (701, 1, 2752);

INSERT INTO BOOK_ADOPTION (course_no, sem, book_isbn)
VALUES (701, 1, 2753);

SELECT BA.course_no, C.dept
FROM BOOK_ADOPTION BA
JOIN TEXT T ON BA.book_isbn = T.book_isbn
JOIN COURSE C ON BA.course_no = C.course_no
WHERE T.publisher = 'Wonderful Press'
GROUP BY BA.course_no, C.dept
HAVING COUNT(*) = (SELECT COUNT(*) FROM BOOK_ADOPTION WHERE course_no = BA.course_no);
