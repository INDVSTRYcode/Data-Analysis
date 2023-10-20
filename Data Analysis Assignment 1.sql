-- 1.) A.) Create the table named EMPLOYEE, insert the employee details below and assign a primary key.
CREATE DATABASE skha;
USE skha;
CREATE TABLE employee ( 
	emp_number INTEGER,
    emp_name VARCHAR(255),
    job VARCHAR(255),
    mgr INTEGER,
    hire_date DATE,
    sal FLOAT,
    comm FLOAT,
    dept_number INTEGER,
    PRIMARY KEY (emp_number)
    );

INSERT INTO employee (emp_number, emp_name, job, mgr, hire_date, sal, comm, dept_number)
VALUES 
	(8369, 'SMITH', 'CLERK', 8902, '1990-12-18', 800.00, NULL, 20),
    (8499, 'ANYA', 'SALESMAN', 8698, '1991-02-20', 1600.00, 300.00, 30),
    (8521, 'SETH', 'SALESMAN', 8698, '1991-02-22', 1250.00, 500.00, 30),
    (8566, 'MAHADEVAN', 'MANAGER', 8839, '1991-04-02', 2985.00, NULL, 20),
    (8654, 'MOMIN', 'SALESMAN', 8698, '1991-09-28', 1250.00, 1400.00, 30),
    (8698, 'BINA', 'MANAGER', 8839, '1991-05-01', 2850.00, NULL, 30),
    (8882, 'SHIVANSH', 'MANAGER', 8839, '1991-06-09', 2450.00, NULL, 10),
    (8888, 'SCOTT', 'ANALYST', 8566, '1992-12-09', 3000.00, NULL, 20),
    (8839, 'AMIR', 'PRESIDENT', NULL, '1991-11-18', 5000.00, NULL, 10),
    (8844, 'KULDEEP', 'SALESMAN', 8698, '1991-09-08', 1500.00, 0.00, 30);
    
-- 1.) B.) Return only the jobs from the table. List them only once.
SELECT DISTINCT e.job
FROM employee AS e;

-- 1.) C.) Return all records from the table.
SELECT * FROM employee AS e;

-- 1.) D.) Return employee name and salary of employees whose salaries are greater than or equal to 2200.
SELECT e.emp_name, e.sal
FROM employee AS e
WHERE e.sal >= 2200.00;

-- 1.) E.) Return employee name and salary of those employees who do not have their salary in the range of 2500 to 4000.
SELECT e.emp_name, e.sal
FROM employee AS e
WHERE e.sal NOT BETWEEN 2500.00 AND 4000.00;

-- 1.) F.) Return employee name whose name contains I as third character.
SELECT e.emp_name
FROM employee AS e
WHERE e.emp_name LIKE '__I%';

-- 1.) G.) Return employee name whose name contains M as first and H as third character.
SELECT e.emp_name
FROM employee AS e
WHERE e.emp_name LIKE 'M_H%';

-- 1.) H.) Count the number of employees in each department, with the department number along with the employee count.
SELECT COUNT(e.emp_name), e.dept_number
FROM employee AS e
GROUP BY e.dept_number;

-- 1.) I.) Return employee name and hire dates of employees hired after 1991-01-01. 
SELECT e.emp_name, e.hire_date
FROM employee AS e
WHERE e.hire_date > '1991-01-01';

-- 1.) J.) Calculate the average salary of all employees. 
SELECT AVG(e.sal)
FROM employee AS e;

-- 2.) A.) Create the following tables and name them student and project respectively. 
USE skha;
CREATE TABLE student (
	std_id INTEGER,
    fname VARCHAR(255),
    lname VARCHAR(255),
    credits INTEGER,
    dept VARCHAR(255),
    gender VARCHAR(255),
    PRIMARY KEY (std_id)
    );

INSERT INTO student (std_id, fname, lname, credits, dept, gender)
VALUES 
	(100, 'Mary', 'Cooper', 6000, 'Drama', 'F'),
    (101, 'Mike', 'Carpen', 5000, 'Maths', 'M'),
    (102, 'Ryan', 'Smith', 10000, 'Drama', 'M'),
    (103, 'Tom', 'Randall', 4800, 'Maths', 'M'),
    (104, 'Ashley', 'Brown', 5000, 'Science', 'F');

CREATE TABLE project (
	project_id INTEGER,
    std_id INTEGER,
    project_name VARCHAR(255),
    PRIMARY KEY (project_id)
    );

INSERT INTO project (project_id, std_id, project_name) 
VALUES 
	(1, 100, 'Shakespeare'),
    (2, 100, 'Greek Tragedy'),
    (3, 100, 'Disaster'),
    (4, 101, 'Trigonometry'),
    (5, 102, 'Wizard of Oz'),
    (6, 102, 'Creative Dramatics'),
    (7, 102, 'Modern Art'),
    (8, 106, 'Natural Language Processing'),
    (9, 104, 'Gravity');

-- 2.) B.) Return the project names along with the corresponding student details (first name, last name) for all projects. 
SELECT p.project_name, s.fname, s.lname
FROM project AS p
LEFT JOIN student AS s
ON s.std_id = p.std_id;

-- 2.) C.) Return the project names and the corresponding student details (first name, last name) for projects assigned to students in the "Maths" department. 
SELECT p.project_name, s.fname, s.lname
FROM project AS p
LEFT JOIN student AS s
ON s.std_id = p.std_id
WHERE s.dept = 'Maths';

-- 2.) D.) Return all students along with the project names (if any) they are assigned to.
SELECT CONCAT(s.fname, ' ', s.lname) AS student_name, p.project_name
FROM project AS p
RIGHT JOIN student AS s
ON s.std_id = p.std_id;

-- 2.) E.) Return all students and the project names (if any) they are assigned to, but only for the students in the Drama department.
SELECT CONCAT(s.fname, ' ', s.lname) AS student_name, p.project_name
FROM project AS p
RIGHT JOIN student AS s
ON s.std_id = p.std_id
WHERE s.dept = 'Drama';

-- 2.) F.) Return the total number of projects each student is assigned to, along with their details (first name, last name).
SELECT COUNT(p.project_name) , CONCAT(s.fname, ' ', s.lname) AS student_name
FROM project AS p
RIGHT JOIN student AS s
ON s.std_id = p.std_id
GROUP BY student_name;

-- 2.) G.) Return all students with the gender F, with their total credits.
SELECT CONCAT(s.fname, ' ', s.lname) AS student_name, s.gender, s.credits
FROM student AS s
WHERE gender = 'F';

-- 2.) H.) Return all students whose last name ends with "pen". 
SELECT CONCAT(s.fname, ' ', s.lname) AS student_name
FROM student AS s
WHERE s.lname LIKE '%pen';

-- 2.) I.) Return the names of students with the gender M, with more than 4999 credits, sorted alphabetically by their first names. 
SELECT CONCAT(s.fname, ' ', s.lname) AS student_name, s.gender, s.credits
FROM student AS s
WHERE gender = 'M' AND s.credits > 4999
ORDER BY s.fname;

-- 2.) J.) Reurn all students' details and sort them based on their credits in descending order.
SELECT *
FROM student as s
ORDER BY credits DESC;





    