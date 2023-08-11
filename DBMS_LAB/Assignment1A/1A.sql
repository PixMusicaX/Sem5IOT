-- 1. Create a table BTech_2nd with attributes E_no, Year, Sec, C_Roll, Name, DOB having E_no as primary key using constraint

CREATE TABLE BTech_2nd (
    E_no INT PRIMARY KEY,
    Year INT,
    Sec VARCHAR(10),
    C_Roll INT,
    Name VARCHAR(100),
    DOB DATE
);

DESC BTech_2nd;

-- 2. Add the columns Mob_No, DOA (date of admission) to the 1st table

ALTER TABLE BTech_2nd
ADD Mob_No VARCHAR(15),
ADD DOA DATE;

-- 3. Create an empty table BTech_3rd from the above existing table.

CREATE TABLE BTech_3rd AS
SELECT *
FROM BTech_2nd
WHERE 1 = 0;

DESC BTech_3rd;

-- 4. Drop the columns Mob No, DOA (date of admission) to the 2nd table.

ALTER TABLE BTech_3rd
DROP COLUMN Mob_No,
DROP COLUMN DOA;

DESC BTech_3rd;

-- 5. Make C_roll and DOA as not null in the 1st table.

ALTER TABLE BTech_2nd
MODIFY COLUMN C_Roll INT NOT NULL,
MODIFY COLUMN DOA DATE NOT NULL;

DESC BTech_2nd;

-- 6. Change the length of the Year and name attribute in the 2nd table.

ALTER TABLE BTech_3rd
MODIFY COLUMN Year INT(4),
MODIFY COLUMN Name VARCHAR(255);

DESC BTech_3rd;
