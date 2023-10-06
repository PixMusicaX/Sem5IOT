-- Table Preparations
CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE TIMESTAMP,
    DEPARTMENT VARCHAR(50)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (001, 'Monika', 'Arora', 100000, TO_TIMESTAMP('2014-02-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'HR');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (002, 'Niharika', 'Verma', 80000, TO_TIMESTAMP('2014-06-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Admin');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (003, 'Vishal', 'Singhal', 300000, TO_TIMESTAMP('2014-02-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'HR');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (004, 'Amitabh', 'Singh', 500000, TO_TIMESTAMP('2014-02-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Admin');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (005, 'Vivek', 'Bhati', 500000, TO_TIMESTAMP('2014-06-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Account');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (006, 'Diwan', 'Kumar', 200000, TO_TIMESTAMP('2014-06-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Vipul');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (007, 'Satish', 'Chauhan', 90000, TO_TIMESTAMP('2014-04-11 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Admin');

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (008, 'Geetika', 'Chauhan', 75000, TO_TIMESTAMP('2014-01-20 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Account');

SELECT * FROM Worker


CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_DATE TIMESTAMP,
    BONUS_AMOUNT INT
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES (1, TO_TIMESTAMP('2016-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5000);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES (2, TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3000);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES (3, TO_TIMESTAMP('2016-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4000);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES (1, TO_TIMESTAMP('2016-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4500);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES (2, TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3500);

SELECT * FROM Bonus


CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(50),
    AFFECTED_FROM TIMESTAMP
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (1, 'Manager', TO_TIMESTAMP('2016-02-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (2, 'Executive', TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (8, 'Executive', TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (5, 'Asst. Manager', TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (4, 'Asst. Manager', TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (7, 'Executive', TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (6, 'Lead', TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES (3, 'Lead', TO_TIMESTAMP('2016-06-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));


SELECT * FROM Title


-- 1.	Write An SQL Query To Fetch “FIRST_NAME” From Worker Table In Upper Case alias as WORKER_FIRSTNAME.
SELECT UPPER(FIRST_NAME) AS WORKER_FIRSTNAME
FROM Worker;

-- 2.	Write An SQL Query To Print The First Three Characters Of FIRST_NAME From Worker Table.
SELECT SUBSTR(FIRST_NAME, 1, 3) AS FIRST_THREE_CHARACTERS
FROM Worker;

-- 3.	Write An SQL Query To Find The Position Of The Alphabet (‘A’) In The First Name Column ‘Amitabh’ From Worker Table.
SELECT INSTR(FIRST_NAME, 'A') AS POSITION_OF_A
FROM Worker
WHERE FIRST_NAME = 'Amitabh';

-- 4. Write An SQL Query To Print The FIRST_NAME And LAST_NAME From Worker Table Into A Single Column COMPLETE_NAME. A Space Char Should Separate Them.
SELECT FIRST_NAME || ' ' || LAST_NAME AS COMPLETE_NAME
FROM Worker;

-- 5.	Write An SQL Query To Print All Worker Details From The Worker Table Order By FIRST_NAME Ascending And DEPARTMENT Descending.
SELECT *
FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- 6.	Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Contains ‘A’.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%A%';

-- 7.	Write An SQL Query To Print Details Of The Workers Whose FIRST_NAME Ends With ‘A’.
SELECT *
FROM Worker
WHERE FIRST_NAME LIKE '%a';

-- 8.	Write An SQL Query To Print Details Of The Workers Whose SALARY Lies Between 100000 And 500000.
SELECT *
FROM Worker
WHERE SALARY BETWEEN 100000 AND 500000;

-- 9.	Write An SQL Query To Fetch The Count Of Employees Working In The Department ‘Admin’.
SELECT COUNT(*) AS EMPLOYEE_COUNT
FROM Worker
WHERE DEPARTMENT = 'Admin';

-- 10.	Write An SQL Query To Fetch The No. Of Workers For Each Department In The Descending Order.
SELECT DEPARTMENT, COUNT(*) AS WORKER_COUNT
FROM Worker
GROUP BY DEPARTMENT
ORDER BY WORKER_COUNT DESC;

-- 11.	Write An SQL Query To Print Details Of The Workers Who Are Also Managers.
SELECT w.*
FROM Worker w
INNER JOIN Title t ON w.WORKER_ID = t.WORKER_REF_ID
WHERE t.WORKER_TITLE = 'Manager';

-- 12.	Write An SQL Query To Show Only Odd Rows From A Table
SELECT *
FROM (
    SELECT w.*, ROWNUM AS rn
    FROM Worker w
)
WHERE MOD(rn, 2) != 0;

-- 13.	Write An SQL Query To Show Records From One Table That Another Table Does Not Have.
SELECT * FROM worker
LEFT JOIN bonus ON worker.worker_id = bonus.worker_ref_id
WHERE bonus.worker_ref_id IS NULL;

-- 14. Write An SQL Query To Show The Top N (Say 10) Records Of A Table.
SELECT *
FROM (
    SELECT *
    FROM Worker
    ORDER BY SALARY DESC
)
WHERE ROWNUM <= 10;

-- 15. Write An SQL Query To Fetch The List Of Employees With The Same Salary.
SELECT first_name,salary FROM worker 
WHERE Salary IN (SELECT Salary FROM worker GROUP BY Salary HAVING COUNT(*) > 1);

-- 16. Write An SQL Query To Show All Departments Along With The Number Of People Working There.
SELECT DEPARTMENT, COUNT(*) AS NO_OF_EMPLOYEE FROM Worker GROUP BY DEPARTMENT;

-- 17. Write An SQL Query To Print The Name Of Employees Having The Highest Salary In Each Department.
SELECT department, first_name, salary FROM ( SELECT department, first_name, salary, ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS rn FROM worker) ranked;

-- 18. Write An SQL Query To Fetch Departments Along With The Total Salaries Paid For Each Of Them.
SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- 19. Consider the following relations for an order processing database application in a company.
-- i) Create the above tables by properly specifying the primary keys and the foreign keys.

CREATE TABLE CUSTOMER(
  Cust NUMBER(25) NOT NULL PRIMARY KEY,
  Cname VARCHAR2(25),
  City VARCHAR2(25)
);

-- Create ORDERR table
CREATE TABLE ORDERR(
  Orderr NUMBER(25) NOT NULL PRIMARY KEY,
  Odate DATE,
  Cust NUMBER(25),
  Ord_Amt NUMBER(25),
  CONSTRAINT fk_customer FOREIGN KEY (Cust) REFERENCES CUSTOMER(Cust)
);

-- Create ORDERR_ITEM table
CREATE TABLE ORDERR_ITEM(
  Orderr NUMBER(25) NOT NULL,
  Item NUMBER(25),
  qty NUMBER(25)
);

-- Create ITEM table
CREATE TABLE ITEM(
  Item NUMBER(25),
  Unit_Price NUMBER(25)
);

-- Create SHIPMENT table
CREATE TABLE SHIPMENT(
  Orderr NUMBER(25),
  Warehouse NUMBER(25) NOT NULL PRIMARY KEY,
  Ship_Date DATE
);

-- Create WAREHOUSE table
CREATE TABLE WAREHOUSE(
  Warehouse NUMBER(25),
  City VARCHAR2(25),
  CONSTRAINT fk_shipment FOREIGN KEY (Warehouse) REFERENCES SHIPMENT(Warehouse)
);

-- ii) Enter at least five tuples for each relation.

-- Insert data into CUSTOMER table
INSERT INTO CUSTOMER (Cust, Cname, City)
VALUES (234, 'Jake', 'Kolkata');

INSERT INTO CUSTOMER (Cust, Cname, City)
VALUES (345, 'Paul', 'Varanashi');

INSERT INTO CUSTOMER (Cust, Cname, City)
VALUES (626, 'Robie', 'Noida');

INSERT INTO CUSTOMER (Cust, Cname, City)
VALUES (328, 'Mischel', 'Delhi');

INSERT INTO CUSTOMER (Cust, Cname, City)
VALUES (457, 'Marie', 'Jadavpur');

-- Insert data into ORDERR table
INSERT INTO ORDERR (Orderr, Odate, Cust, Ord_Amt)
VALUES (100, TO_DATE('2023-06-13', 'YYYY-MM-DD'), 234, 5600);

INSERT INTO ORDERR (Orderr, Odate, Cust, Ord_Amt)
VALUES (101, TO_DATE('2023-01-04', 'YYYY-MM-DD'), 345, 45673);

INSERT INTO ORDERR (Orderr, Odate, Cust, Ord_Amt)
VALUES (102, TO_DATE('2023-02-24', 'YYYY-MM-DD'), 626, 9564);

INSERT INTO ORDERR (Orderr, Odate, Cust, Ord_Amt)
VALUES (103, TO_DATE('2023-05-27', 'YYYY-MM-DD'), 328, 3563);

INSERT INTO ORDERR (Orderr, Odate, Cust, Ord_Amt)
VALUES (104, TO_DATE('2023-07-09', 'YYYY-MM-DD'), 457, 8543);

-- Insert data into ORDERR_ITEM table
INSERT INTO ORDERR_ITEM (Orderr, Item, qty)
VALUES (100, 10, 12);

INSERT INTO ORDERR_ITEM (Orderr, Item, qty)
VALUES (101, 11, 34);

INSERT INTO ORDERR_ITEM (Orderr, Item, qty)
VALUES (102, 12, 56);

INSERT INTO ORDERR_ITEM (Orderr, Item, qty)
VALUES (103, 13, 76);

INSERT INTO ORDERR_ITEM (Orderr, Item, qty)
VALUES (104, 14, 36);

-- Insert data into ITEM table
INSERT INTO ITEM (Item, Unit_Price)
VALUES (10, 25000);

INSERT INTO ITEM (Item, Unit_Price)
VALUES (11, 45000);

INSERT INTO ITEM (Item, Unit_Price)
VALUES (12, 35000);

INSERT INTO ITEM (Item, Unit_Price)
VALUES (13, 15000);

INSERT INTO ITEM (Item, Unit_Price)
VALUES (14, 75000);

-- Insert data into SHIPMENT table
INSERT INTO SHIPMENT (Orderr, Warehouse, Ship_Date)
VALUES (100, 3546, TO_DATE('2023-01-16', 'YYYY-MM-DD'));

INSERT INTO SHIPMENT (Orderr, Warehouse, Ship_Date)
VALUES (101, 7546, TO_DATE('2023-04-02', 'YYYY-MM-DD'));

INSERT INTO SHIPMENT (Orderr, Warehouse, Ship_Date)
VALUES (102, 2453, TO_DATE('2023-01-20', 'YYYY-MM-DD'));

INSERT INTO SHIPMENT (Orderr, Warehouse, Ship_Date)
VALUES (103, 6432, TO_DATE('2023-06-11', 'YYYY-MM-DD'));

INSERT INTO SHIPMENT (Orderr, Warehouse, Ship_Date)
VALUES (104, 2423, TO_DATE('2023-07-09', 'YYYY-MM-DD'));

-- Insert data into WAREHOUSE table
INSERT INTO WAREHOUSE (Warehouse, City)
VALUES (3546, 'Kolkata');

INSERT INTO WAREHOUSE (Warehouse, City)
VALUES (7546, 'Varanashi');

INSERT INTO WAREHOUSE (Warehouse, City)
VALUES (2453, 'Noida');

INSERT INTO WAREHOUSE (Warehouse, City)
VALUES (6432, 'Delhi');

INSERT INTO WAREHOUSE (Warehouse, City)
VALUES (2423, 'Jadavpur');

-- iii) Produce a listing: CUSTNAME, NO_OF_ORDERS, AVG_ORDER_AMT, where the middle column is the total number of orders by the customer and the last column is the average order amount for that customer
SELECT CUSTOMER.Cname AS CUSTNAME, COUNT(ORDERR.Orderr) AS NO_OF_ORDERS, AVG(ORDERR.Ord_Amt) AS AVG_ORDER_AMT
FROM ORDERR
JOIN CUSTOMER ON CUSTOMER.Cust = ORDERR.Cust
GROUP BY CUSTOMER.Cname;

-- iv) List the Order# for the orders that were shipped from all the warehouses that the company has in a specific city
SELECT SHIPMENT.Orderr AS Order_id
FROM SHIPMENT
WHERE SHIPMENT.Warehouse IN (
    SELECT WAREHOUSE.Warehouse
    FROM WAREHOUSE
    WHERE WAREHOUSE.City = 'Kolkata'
);

-- v) Demonstrate how you delete Item# 10 from the ITEM table and make that field null in the ORDER- ITEM table.
DELETE FROM ITEM WHERE Item = 10;
UPDATE ORDERR_ITEM SET Item = NULL WHERE Item = 10;

-- 20. Create a table Emp(e_no, e_name, e_phone, e_addr,e_salary) to store records of 10 employees:
CREATE TABLE Emp (
  e_no VARCHAR2(20) PRIMARY KEY,
  e_name VARCHAR2(50),
  e_phone VARCHAR2(15),
  e_addr VARCHAR2(100),
  e_salary NUMBER(10, 2)
);

-- Insert data for employee 1
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E001', 'John Doe', '123-456-7890', '123 Main St', 50000.00);

-- Insert data for employee 2
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E002', 'Jane Smith', '987-654-3210', '456 Elm St', 60000.00);

-- Insert data for employee 3
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E003', 'Michael Johnson', '555-555-5555', '789 Oak St', 55000.00);

-- Insert data for employee 4
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E004', 'Sarah Williams', '333-444-5555', '987 Maple St', 62000.00);

-- Insert data for employee 5
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E005', 'David Lee', '777-888-9999', '234 Pine St', 53000.00);

-- Insert data for employee 6
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E006', 'Emily White', '222-111-3333', '567 Birch St', 58000.00);

-- Insert data for employee 7
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E007', 'Robert Brown', '666-777-8888', '789 Cedar St', 60000.00);

-- Insert data for employee 8
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E008', 'Jennifer Davis', '111-222-3333', '123 Walnut St', 59000.00);

-- Insert data for employee 9
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E009', 'William Moore', '444-555-6666', '345 Redwood St', 55000.00);

-- Insert data for employee 10
INSERT INTO Emp (e_no, e_name, e_phone, e_addr, e_salary)
VALUES ('E010', 'Linda Wilson', '888-999-1111', '678 Willow St', 62000.00);


-- i) Alter the data type of e_no from number to varchar
ALTER TABLE Emp
MODIFY e_no VARCHAR2(20);

-- ii) Alter table by setting e_no as primary key
ALTER TABLE Emp
ADD CONSTRAINT PK PRIMARY KEY (e_no);

-- iii) Alter table by adding a column e_pin
ALTER TABLE Emp
ADD e_pin VARCHAR(25);

-- iv) Update the phone number of an employee in the table
UPDATE Emp
SET e_phone = '987-654-3210'
WHERE e_no = 'E001';

-- 21. Create a table Dept(dept_no, dept_name,e_no, dept_loc,dept_hod) to store records of 10 departments
CREATE TABLE Dept (
  dept_no VARCHAR2(10) PRIMARY KEY,
  dept_name VARCHAR2(50),
  e_no VARCHAR2(20) REFERENCES Emp(e_no),
  dept_loc VARCHAR2(100),
  dept_hod VARCHAR2(50)
);

-- Insert data for department 1
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D001', 'HR Department', 'E001', 'New York', 'John Smith');

-- Insert data for department 2
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D002', 'Finance Department', 'E002', 'Chicago', 'Alice Johnson');

-- Insert data for department 3
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D003', 'Marketing Department', 'E003', 'Los Angeles', 'David Brown');

-- Insert data for department 4
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D004', 'IT Department', 'E004', 'San Francisco', 'Sarah Davis');

-- Insert data for department 5
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D005', 'Operations Department', 'E005', 'Dallas', 'Michael Wilson');

-- Insert data for department 6
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D006', 'Sales Department', 'E006', 'Houston', 'Emily Lee');

-- Insert data for department 7
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D007', 'Customer Service Department', 'E007', 'Miami', 'Robert Moore');

-- Insert data for department 8
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D008', 'Research and Development', 'E008', 'Seattle', 'Jennifer White');

-- Insert data for department 9
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D009', 'Quality Assurance Department', 'E009', 'Boston', 'William Brown');

-- Insert data for department 10
INSERT INTO Dept (dept_no, dept_name, e_no, dept_loc, dept_hod)
VALUES ('D010', 'Production Department', 'E010', 'Denver', 'Linda Johnson');

-- i) Create a foreign key reference from Dept to Emp using e_no
ALTER TABLE Dept
ADD CONSTRAINT fk_emp_dept FOREIGN KEY (e_no) REFERENCES Emp(e_no);

-- ii) Set dept_no as the primary key
ALTER TABLE Dept
ADD CONSTRAINT pk_dept PRIMARY KEY (dept_no);

-- iii) Update the dept_hod for a specific department (e.g., department with dept_no = 'D001')
UPDATE Dept
SET dept_hod = 'New_HOD_Name'
WHERE dept_no = 'D001';

-- iv) Delete a specific department (e.g., department with dept_no = 'D002')
DELETE FROM Dept
WHERE dept_no = 'D002';
