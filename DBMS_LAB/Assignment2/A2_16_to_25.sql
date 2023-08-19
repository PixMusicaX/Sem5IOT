-- 16. Insert the following rows in the employee table: [Refer to Question]

ALTER TABLE employee
DROP FOREIGN KEY FK_employee;

INSERT INTO employee
VALUES
(1,'Arun','Khan','Manager',90000,NULL,'Production',NULL,'1998-01-04'),
(2,'Barun','Kumar','Manager',80000,NULL,'Marketing',NULL,'1998-02-09'),
(3,'Chitra','Kapoor','Engineer',60000,NULL,'Production',1,'1998-01-08'),
(4,'Dheeraj','Mishra','Manager',75000,NULL,'Sales',4,'2001-12-27'),
(5,'Emma','Dutt','Engineer',55000,NULL,'Production',1,'2002-03-20'),
(6,'Floki','Dutt','Accountant',70000,NULL,'Accounts',NULL,'2000-07-16'),
(7,'Dheeraj','Kumar','Clerk',40000,NULL,'Accounts',6,'2016-07-01'),
(8,'Saul','Good','Engineer',60000,NULL,'R&D',NULL,'2014-09-06'),
(9,'Mou','Bhat','Clerk',30000,NULL,'Sales',4,'2001-03-08'),
(10,'Sunny','Deol','Salesman',20000,10000,'Marketing',2,'2001-03-31'),
(11,'Bobby','Deol','Engineer',35000,NULL,'R&D',8,'2017-10-17'),
(12,'Aamir','Khan','Salesman',15000,5000,'Marketing',2,'2013-01-11');

-- 17. Show the values of departmental table.

SELECT * FROM `employee` WHERE 1;

-- 18. Select the department names and their locations.

SELECT d_name, d_loc FROM department;

-- 19. Show the employees f_name , l_name , salary and the salary after 1000rs Bonus.

SELECT f_name, l_name, salary, salary + 1000 AS salary_with_bonus FROM employee;

-- 20. Show the employees annual salary with a 1000rs. Yearly bonus and the annual salary with a 100rs Monthly bonus.

SELECT f_name, l_name, salary, (salary * 12) + 1000 AS annual_salary_with_bonus, (salary + 100) * 12 AS annual_salary_with_monthly_bonus FROM employee;

-- 21. Show f_name as NAME and annual salary as ANNSAL from the employee table.

SELECT f_name AS NAME, salary * 12 AS ANNSAL FROM employee;

-- 22. Show the l_name as LasT AND 100rs. Incremented salary as NewSal.

SELECT l_name AS LasT, salary + 100 AS NewSal FROM employee;

-- 23. Show the emp_id, f_name, l_name, job_type of the employee getting highest salary.

SELECT emp_id, f_name, l_name, job_type FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- 24. Show the emp_id, f_name, l_name, job_type of the employee getting minimum salary.

SELECT emp_id, f_name, l_name, job_type FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee);

-- 25. Show the average salary of employees in the employee table.

SELECT AVG(salary) AS average_salary FROM employee;