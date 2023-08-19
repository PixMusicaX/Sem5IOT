-- 1. Create a table employee with attributes emp_id, f_name, l_name, job_type, salary, dept, commission, manager_id.

CREATE TABLE employee (
    emp_id INT,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    job_type VARCHAR(50),
    salary DECIMAL(10, 2),
    commission DECIMAL(10, 2),
    dept VARCHAR(50),
    manager_id INT
);

DESC employee;

-- 2. Make emp_id as the primary key of employee table.

ALTER TABLE employee
ADD PRIMARY KEY (emp_id);

-- 3. Make f_name and salary NOT NULL type.

ALTER TABLE employee
MODIFY f_name VARCHAR2(50) NOT NULL;

ALTER TABLE employee
MODIFY salary DECIMAL(10, 2) NOT NULL;

-- 4. Add a column date_of_joining in the employee table

ALTER TABLE employee
ADD date_of_joining DATE;

DESC employee;

-- 5. Create a table department with attribute d_name, d_loc and HOD_id where d_name is primary key.

CREATE TABLE department (
    d_name VARCHAR(50) PRIMARY KEY,
    d_loc VARCHAR(100),
    HOD_id INT
);

DESC department;

-- 6. Create a table location with attributes loc_id, city and contact_no.

CREATE TABLE location (
    loc_id INT PRIMARY KEY,
    city VARCHAR(50),
    contact_no VARCHAR(20)
);

DESC location;

-- 7. Enhance the size of the ‘city’ attribute by 5, in the location table.

ALTER TABLE location
MODIFY city VARCHAR(55);

-- 8. Delete the contact_no attribute from the location table.

ALTER TABLE location
DROP COLUMN contact_no;

DESC location;

-- 9. Make the department attribute of the employee table its foreign key referencing the department table.

ALTER TABLE employee
ADD CONSTRAINT FK_employee FOREIGN KEY (dept)
REFERENCES department(d_name);

-- 10. Rename the city attribute to ‘address’ in the location table.

ALTER TABLE location
RENAME COLUMN city TO address;

-- 11. Rename the location table name to ‘loc’.

ALTER TABLE location
RENAME TO loc;

-- 12. Insert the following rows in ‘loc’ table

-- loc_id   |   Address
-- ------------------------
-- 1        |   Kolkata
-- 2        |   Mumbai

INSERT INTO loc (loc_id, address) VALUES (1, 'Kolkata');
INSERT INTO loc (loc_id, address) VALUES (2, 'Mumbai');

SELECT * FROM loc;

-- 13. Truncate the table ‘loc’.

TRUNCATE TABLE loc;

SELECT * FROM loc;

-- 14. Drop the table ‘loc’.

DROP TABLE loc;

-- 15. Insert the rows [refer to question]

INSERT INTO department (d_name, d_loc, HOD_id) VALUES ('Sales', 'Kol', 4);
INSERT INTO department (d_name, d_loc, HOD_id) VALUES ('Accounts', 'Delhi', 6);
INSERT INTO department (d_name, d_loc, HOD_id) VALUES ('Production', 'Kol', 1);
INSERT INTO department (d_name, d_loc, HOD_id) VALUES ('Marketing', 'Kol', 2);
INSERT INTO department (d_name, d_loc, HOD_id) VALUES ('R & D', 'Marketing', 8);

SELECT * FROM department;
