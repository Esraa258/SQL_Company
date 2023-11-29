--Structured query language(SQL): it is a programming language designed for working with datasets especially data from RDBMS to create, manipulate and retrieve data from database
--NoSQL database have their own SQL-Like query languages, such as CQL--> Cassandra, Cypher-->Neo4j, APIs can also be used to query data


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------SQL---------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Data Definition Language(DDL): define the structure of a database (Create/drop tables, Alter(add/drop column) ...)
--[CREATE - ALTER - DROP - TRUNCATE]
-- DROP--> drop table, Schema, Database

--- Create the table contracts ---
CREATE Table contracts
(contract_ID int Primary Key, Contract_Startdate char(50));

--- Add a column to the table contracts---
ALTER Table contracts ADD Contract_Type char(50) NOT NUll;

--- Delete a column from the table contracts---
ALTER Table contracts DROP COLUMN Contract_Type;

--- Delete the table contracts ---
 DROP Table contracts;
 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRUNCATE:
-- Delete all data from the table but keeps the structure of the table
-- Delete data Unconditionally (Doesn't have WHERE clause)
-- Can't be rolled back (because it's a DDL-->auto commit)
-- Deallocate the Physical memory assigned to data
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE Table Project
(project_number int Primary Key, project_name char (50) NOT NUll);

INSERT INTO project(project_number, project_name)
VALUES(110, 'Zohr Project'), (105, 'Meleiha Project'), (210, 'Nooros'); 

SELECT*
FROM Project;

TRUNCATE TABLE Project;     -- -->Truncate delete data but keep the table structure

SELECT*
FROM Project;

DROP TABLE Project;         -- -->Drop delete the table
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data Control Language(DCL): Control access to database
--[GRANT - REVOKE]

-- GRANT SELECT on table project to Sarah;
-- GRANT ALL on table project to Alber;
-- ""GRANT ALL--> DML (Insert, Update, Delete, Select)
-- GRANT SELECT on table project to Esraa WITH GRANT OPTION;
-- ""Esraa can share her privileges with other users""

-- REVOKE UPDATE on table project from Mary;
-- REVOKE ALL on table project from Sally;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE  employee
(Fname varchar(10), 
Lname varchar(10), 
ID int Primary Key NOT NULL, 
Bdate varchar(10), 
loc varchar(50), 
Sex varchar(10), 
Salary int, 
SuperID int, 
Dno int);

CREATE TABLE  departments
(Dname varchar(10), 
Dno int, 
MGRID int,
MGRStart_Date varchar(10));
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Data Manipulation Language(DML): used to query, edit, add and delete row-level data from database tables
-- [INSERT - UPDATE - DELETE - SELECT]
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert --> Record level
INSERT INTO employee(Fname, Lname, ID, Bdate, loc, Sex, Salary, SuperID, Dno)
VALUES('Ahmed', 'Ali', 112233, '1/1/1965', '15 Al fahmy St. Giza', 'M', 13000, 223344, 10); 

INSERT INTO employee(Fname, Lname, ID, Bdate, loc, Sex, Salary)
VALUES('Amr', 'Omran', 321654, '9/14/1963', '44 helioplis,Cairo', 'M', 25000);
INSERT INTO employee(Fname, Lname, ID, Bdate, Sex, dno)
VALUES('Asmaa', 'Ali', 102661, '18/10/1985', 'F', 10);

INSERT INTO employee VALUES('Hanaa', 'Sobhy', 123456, '3/18/1973', '38 Abdel Khalik Tharwat', 'F', 8000, 223344, 10),
('Kamel', 'Mohamed', 223344, '10/15/1970', '38 Mohy el dien abo el ezz', 'M', 18000, 321654, 10),
('Edward', 'Hanna', 512463, '8/19/1972', '18 Abaas el akaad st.', 'M', 15000, 321654, 30),
('Maged', 'Raouf', 521634, '6/4/1980', '18 shobra st.', 'M', 10000, 968574, 30),
('Mariam', 'Adel', 669955, '12/6/1982', '269 El haram st.', 'F', 7500, 512463, 20),
('Noha', 'Mohamad', 968574, '1/2/1975', '55 Orabi st.', 'F', 16000, 321654, 20),
('Ahmed', 'Hassan', 102672, '8/8/1988', '20 el-haram st.', 'M', 20000, 112233, 30),
('Moheb', 'Rafaat', 102674, '5/6/1984', '6 Makram Ebid st.', 'M', 16000, 112233, 30);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO departments VALUES
('DP1', 10, 223344, '1/1/2005'),
('DP2', 20, 968574, '1/3/2006'),
('DP3', 30, 512463, '1/6/2006');

INSERT INTO departments(Dname, Dno)
Values('DP4', 40);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM employee;

SELECT *
FROM departments;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- WHERE, HAVING: Slicing data--> finding data based on a specific condition
-- HAVING:condition on aggregate function
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- update --> Column level
-- Update salary for the employee whose ID is 102661 to be 12000
UPDATE employee
SET Salary=12000
WHERE ID=102661;

-- update the salary and department number for the employee ID is 102674 to be 17000 in department 10
UPDATE employee
SET Salary=17000, dno=10
WHERE ID=102674;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Delete --> Delete one or more rows from the table (Record Level)
-- Delete: 
--Delete all data but keep the structure of the table (if it doesn't have WHERE clause)
--can include a WHERE Clause to delete data conditionally
--can be rolled back since it is a DML statement
--Keeps the physical memory assigned to data until a commit or roll back is issued
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Delete  the data of the employee whose ID is 102672
DELETE FROM employee
WHERE ID=102672;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM employee;

-- Display the employee ID, first name and department name 
SELECT ID, Fname, dno
FROM employee;

-- Display employee's data who earn higher than 15000
SELECT *
FROM employee
WHERE salary > 15000;

-- Display the first names of the employess who earn greater than or equal 15000 and smaller than or equal 25000
SELECT Fname
FROM employee
WHERE Salary >= 15000 AND Salary <= 25000;

---- OR--
--SELECT Fname
--FROM employee
--WHERE Salary BETWEEN 15000 AND 25000;

-- Display the ID and first names of the employees who are supervised by supervisor ID 321654 or 223344
SELECT ID, Fname
FROM employee
WHERE SuperID=321654 OR SuperID=223344;

-- OR--
--SELECT ID, Fname
--FROM employee
--WHERE SuperID IN (321654, 223344);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Like: filtering patterns to perform partial matches of data values
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Display the names of the employees whose first name has the second letter O
SELECT *
FROM employee
WHERE Fname LIKE '%o%';

-- Display the full data of employees whose last name is Mohamed
SELECT *
FROM employee
WHERE Lname LIKE 'Moham%d';


-- Display the first names of the employees and their bonus which is 10% of their salary
SELECT Fname, Salary*0.1 as Bonus
FROM employee;

-- Display the full name of the employees who earn more than 1000000 annually
SELECT Fname+' '+Lname as [Full name]
FROM employee
WHERE Salary*12 > 100000;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ORDER BY: Sorting data
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Display the first name and the ID of the employees ordered by the first name
SELECT Fname, ID
FROM employee
ORDER BY Fname;     --Default Sorting order-->acendingly

-- Display the first name and the ID of the employees ordered by the first name descendingly
SELECT Fname, ID
FROM employee
ORDER BY Fname DESC;

-- Display the full data of the employees sorted by their department number ascendingly and then sorted by the salary descendingly
SELECT *
FROM employee
ORDER BY dno ASC, Salary DESC;

-- Display the departments that currently have hired employees
SELECT DISTINCT dno
FROM employee;

-- Display the departments and the supervisors within each department
SELECT DISTINCT dno, superID
FROM employee;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------JOIN------------------------
-- INNER JOIN / Equal Join --> matched record
-- OUTER JOIN--> LEFT OUTER JOIN, RIGHT OUTER JOIN, FULL OUTER JOIN
-- SELF JOIN--> unary/recursive relationship
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INNER JOIN / Equal Join --> return matched records
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Display the employee name and the department name that he manages
SELECT fname, dname
FROM employee, departments
WHERE MGRID=ID;    --Join Condition= number of tables-1  --Relationship between PK & Fk

-- Display the employee name and the department name that he works for
SELECT fname, dname
FROM employee e INNER JOIN departments d
ON e.dno = d.dno;

--OR--
--SELECT fname, dname
--FROM employee as e , departments as d
--WHERE e.dno = d.dno;

--OR--
--SELECT fname, dname
--FROM employee e , departments d
--WHERE e.dno = d.dno;

--OR--
--SELECT fname, dname
--FROM employee , departments
--WHERE employee.dno = departments.dno;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------OUTER JOIN---------------------
-- Left Outer Join: return full data from the left table
-- Right Outer Join: return full data from the right table
-- Full Outer Join: return full data from both tables
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Display the employee names and the department name that he works for *if exist*
SELECT Fname, dname
FROM employee e LEFT OUTER JOIN departments d
ON e.dno = d.dno;

-- Display the department name and the employee names that works for it *if exist*
SELECT Fname, dname
FROM employee e RIGHT OUTER JOIN departments d
ON e.dno = d.dno;

-- Display the employee names and the corresponding departments names *if exist*
SELECT Fname, dname
FROM employee e FULL OUTER JOIN departments d
ON e.dno = d.dno;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Self Join --> for unary (recursive) relationship - (Join the table with itself)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- in our table we have employees who manages other employees--
-- Diplay the employee name and the name of his/her supervisor
SELECT e.fname, s.fname
FROM employee e, employee s
WHERE e.superID = s.ID;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------- OPERATORS --------
-- Single row operator (Take one value after them):    >   <   =   
-- Multi row operator (Take multi value after them): in   all  any
-- all,any always come with other comparaison operators:    > all, <all, >= all, <=all, >any, <any, >=any, <=any
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------SubQuery/NestedQuery-----------
-- Display the employees data who earn higher than Ahmed Ali
SELECT * 
FROM employee
WHERE Salary > (SELECT Salary FROM employee WHERE Fname='Ahmed' AND Lname='Ali');

--Display the employees data who earn higher than *all* the employees in department 10
SELECT *
FROM employee
WHERE Salary > ALL (SELECT Salary FROM employee WHERE dno=10);

--Display the employees data who earn higher than *any* employees in department 10
SELECT *
FROM employee
WHERE Salary > ANY (SELECT Salary FROM employee WHERE dno=10);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Aggregate Functions(Built-in Functions): SUM, MAX, MIN, COUNT, AVG     ----> Ignore Null Values
-- Aggregation Functions: helps to provide an overview of the dataset

--stddev: measure how spread out the numbers are in a dataset (Standard Deviation)
--COUNT: count the number of rows (records) in the dataset
--Distinct: unique values
--MIN-MAX: identifying extreme values in a data column - can be used on non-numerical columns
--SUM: Calculating the sum of a numeric column
--AVG: Calculating the average value of a numeric column
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- Display the std to see how spread out the salary of employees is (the greater the std value, the wider the spread)-->in mysql
--SELECT stddev(salary) as std
--FROM employee

-- Display maximum and minimum salary for the company
SELECT MAX(salary) as max, MIN(salary) as min
FROM employee;

-- Display the count of rows in the dataset
SELECT COUNT(*)
FROM employee;

-- Display the total number of unique/distinct superID
SELECT COUNT(DISTINCT SuperID)
FROM employee;

-- Display the count of employees and the count of salaries
SELECT COUNT(ID) as emp, COUNT(Salary) as sal
FROM employee;

-- Display the count of employees and the count of their supervisors
SELECT COUNT(ID) as emp, COUNT(superID) as super     --aggregate function(count) ignore NULL
FROM employee;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--GROUP BY: Grouping data based on a commonality
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Display the average salary for each department given that its maximum salary is greater than 18000
SELECT AVG(Salary) as avg_salary
FROM employee
GROUP BY dno   --for each department
HAVING Max(Salary) > 18000;

-- Display the department name and the max salary for each department given that its average is greater than 1200, Sort the result by department name
--(6)         --(4)   
SELECT Dname, MAX(salary) as max
FROM employee e, departments d    --(1)
WHERE e.dno = d.dno               --(2)
GROUP BY Dname                    --(3)
--(5)  --(4)
HAVING AVG(salary) > 1200
ORDER BY Dname;                   --(7)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- DBMS Execution Sequence in the Back End---
--1- Call Tables  (FROM)
--2- Where conditions (WHERE)
--3- GROUP BY
--4- Aggregate Functions
--5- HAVING
--6- SELECT
--7- ORDER BY
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- View: Logical Table contains no data of its own, view is like a window through which data from tables can be viewed or changed.
--       it is stored as a SELECT satatement in the data dictionary (Metadata)
-- Advantages:     Limit data access, present different views of the same data
--                 view can save complex queries --> Make Complex queries easy
--                 provide data independence
-- 
-- Views Types: 
--             simple view: one table, Doesn't contain function, Doesn't contain group of data, I can do DML operations through a view
--             Complex view: one/more table, contain function, contain group of data, DML operations through a view (Not Always)--> I can SELECT, but it isn't easy to Insert/Update/Delete because of Functions& aggregation
--
-- Base Tables: are tables on which a view is based 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create a view to display employee names and department name in which they work on
CREATE VIEW VW_EmpDept
AS
SELECT Fname, Lname, Dname
FROM employee, departments
WHERE ID = MGRID;

-- Retrieve data from view (VW_EmpDept)
SELECT *
FROM VW_EmpDept;

-- CREATE VIEW WITH CHECK OPTION-->Check the WHERE condition each time I make any DML(Insert/update any data) on the view
-- Create a view to display employee names, and salary with check option salary>5000
CREATE VIEW VW_Empsal
AS
SELECT Fname, Salary
FROM employee
WHERE Salary>5000
WITH CHECK OPTION;

SELECT *
FROM VW_Empsal;

-- Modifying View
-- CREATE OR REPLACE VIEW
CREATE OR ALTER VIEW VW_Empsal
AS
SELECT Fname, Salary
FROM employee
WHERE Salary>5000 AND DNO=20
WITH CHECK OPTION;

SELECT *
FROM VW_Empsal;

-- Removing View
DROP VIEW VW_Empsal;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Indexes: used to speed-up the retrieval of data - used by DBMS Engine - can overhead on DML(insert, update, delete) - may be defined on multiple columns
-- Create Index when: retrieving data heavily  - columns contain large number of NULL - Columns are used in search conditions and joins [To avoid Full scan table]
-- Don't Create Index when: Tables are updated Frequently [To avoid rebuild index]
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Syntax
-- Create Index:
-- CREATE INDEX index_name ON Table_name(cloumn_name)

--Delete Index:
-- DROP INDEX index_name