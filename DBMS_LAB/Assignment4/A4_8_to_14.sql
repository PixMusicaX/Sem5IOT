-- 8.Show the employee details with a revised salary. The salary is incremented in the following way:
-- a. 10% for sales department
-- b. 20% for marketing department
-- c. No increment for others

SELECT f_name, l_name, dept, salary, CASE WHEN dept = 'Sales' THEN salary * 1.10 WHEN dept = 'Marketing' THEN salary * 1.20 ELSE salary END AS revised_salary FROM employee;

-- 9. Determine the tax for each employee in production department based on the monthly salary. The tax rate are as per the following data:

SELECT emp_id, f_name, salary, dept,
    CASE 
        WHEN salary BETWEEN 0 AND 19999 THEN 0
        WHEN salary BETWEEN 20000 AND 39999 THEN salary * 0.09
        WHEN salary BETWEEN 40000 AND 59999 THEN salary * 0.2
        WHEN salary BETWEEN 60000 AND 79999 THEN salary * 0.3
        ELSE salary * 0.45
    END AS tax
FROM employee WHERE dept = 'Production';

-- 10. Find the Cartesian product between Employee and Department table.

SELECT * FROM Employee
CROSS JOIN Department;

-- 11. Show the employee names and the respective department location.

SELECT employee.f_name, employee.l_name, department.d_loc FROM employee
JOIN department ON employee.dept = department.d_name;

-- 12. Give an example of the following joins considering employee and department tables.
-- k. Natural join

SELECT * FROM employee
NATURAL JOIN department;

-- l. Inner join

SELECT * FROM employee
INNER JOIN department ON employee.dept = department.d_name;

-- m. Left outer join

SELECT * FROM employee
LEFT OUTER JOIN department ON employee.dept = department.d_name;

-- n. Right outer join

SELECT * FROM employee
RIGHT OUTER JOIN department ON employee.dept = department.d_name;

-- o. Full outer join [full outer join doesn't exist as syntax in MySQL]

SELECT * FROM employee
LEFT OUTER JOIN department ON employee.dept = department.d_name
UNION
SELECT * FROM employee
RIGHT OUTER JOIN department ON employee.dept = department.d_name;

-- OracleSQL Variant
-- SELECT *
-- FROM employee
-- FULL OUTER JOIN department ON employee.dept = department.d_name;

-- 13. Write a query to find the address.  [you need to make another two tables for this, sigh.]

CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT
);

INSERT INTO countries (country_id, country_name, region_id)
VALUES
    (1, 'Argentina', 2),
    (2, 'Australia', 3),
    (3, 'Belgium', 1),
    (4, 'Brazil', 2),
    (5, 'Canada', 2),
    (6, 'Switzerland', 1),
    (7, 'China', 3),
    (8, 'Germany', 1);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(255),
    postal_code VARCHAR(20),
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES
    (1000, '1297 Via Cola di Rie', '93091', 'Calle della Te', 'Roma', 1),
    (1100, '2017 Shinjuku-ku', '9450', 'Kamiya-cho', 'Tokyo', 3),
    (1200, '2014 Jabberwocky Rd', '2011', 'Interiors Blvd', 'Hiroshima', 7),
    (1300, '2007 Zagora St', NULL, 'Southlake', 'Texas', 5),
    (1400, '2004 Charade Rd', '147', 'South San', 'California', 5),
    (1500, '26192 Spadina Ave', '26192', 'South Brun', 'New Jersey', 5),
    (1600, NULL, '99236', 'Seattle', 'Washington', 8);


SELECT locations.location_id, locations.street_address, locations.city, locations.state_province, countries.country_name 
FROM locations
NATURAL JOIN countries
LIMIT 0, 25;

-- 14. Write a query to find the name. [Refer to question and make you exact table, perfectionists (0 V 0).]

SELECT employee.f_name, employee.l_name, department.hod_id FROM employee
JOIN department ON employee.emp_id = department.hod_id;
