# sql_challenge

Departments
-
dept_no VARCHAR PK
dept_name VARCHAR

Dept_emp
-
emp_no INTEGER PK
dept_no VARCHAR FK >- Departments.dept_no

Dept_manager
-
dept_no VARCHAR FK >- Departments.dept_no
emp_no INTEGER FK >- Dept_emp.emp_no

Employees
-
emp_no INTEGER FK >- Dept_emp.emp_no
emp_title_id VARCHAR PK
birth_date DATE
first_name VARCAHR
last_name VARCHAR
sex VARCHAR
hire_date  DATE

Salaries
-
emp_no INTEGER FK >- Dept_emp.emp_no
salary INTEGER

Title
-
title_id VARCHAR FK >- Employees.emp_title_id
title VARCHAR

CREATE TABLE Departments (
  dept_no VARCHAR(30) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);
SELECT * FROM Departments

CREATE TABLE Title (
  title_ID VARCHAR(30) PRIMARY KEY,
  title VARCHAR(30)
);
SELECT * FROM Title

CREATE TABLE Employees (
  emp_no INTEGER PRIMARY KEY,
  emp_title_id VARCHAR,
  birthdate DATE,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  sex VARCHAR(30),
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES Title(title_ID)
);
SELECT * FROM Employees

CREATE TABLE Dept_emp (
  emp_no INTEGER,
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
SELECT * FROM Dept_emp

CREATE TABLE Dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no INTEGER,
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
SELECT * FROM Dept_manager

CREATE TABLE Salaries (
  emp_no INTEGER,
  salary INTEGER,
  FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
SELECT * FROM Salaries

--- Query 1
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Employees.sex, Salaries.salary
FROM Employees
LEFT JOIN Salaries
ON Salaries.emp_no = Employees.emp_no

--- Query 2
SELECT Employees.first_name, Employees.last_name, Employees.hire_date
FROM Employees
WHERE hire_date >= '1986-01-01' AND hire_date <=  '1986-12-31'

--- Query 3
SELECT Dept_manager.dept_no, Dept_manager.emp_no, Departments.dept_name, Employees.first_name, Employees.last_name
FROM Dept_manager
LEFT JOIN Departments
ON Departments.dept_no = Dept_manager.dept_no
LEFT JOIN Employees
ON Employees.emp_no = Dept_manager.emp_no

--- Query 4
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Dept_emp.dept_no, Departments.dept_name
FROM Employees
LEFT JOIN Dept_emp
ON Dept_emp.emp_no = Employees.emp_no
LEFT JOIN Departments
ON Departments.dept_no = Dept_emp.dept_no

--- Query 5
SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--- Query 6
CREATE VIEW sales AS
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Dept_emp.dept_no, Departments.dept_name
FROM Employees
LEFT JOIN Dept_emp
ON Dept_emp.emp_no = Employees.emp_no
LEFT JOIN Departments
ON Departments.dept_no = Dept_emp.dept_no
WHERE Departments.dept_name = 'Sales';

SELECT sales.emp_no, sales.first_name, sales.last_name
FROM sales;

--- Query 7
CREATE VIEW development AS
SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Dept_emp.dept_no, Departments.dept_name
FROM Employees
LEFT JOIN Dept_emp
ON Dept_emp.emp_no = Employees.emp_no
LEFT JOIN Departments
ON Departments.dept_no = Dept_emp.dept_no
WHERE Departments.dept_name = 'Sales' OR Departments.dept_name = 'Development';

SELECT development.emp_no, development.first_name, development.last_name, development.dept_name
FROM development;

--- Query 8
SELECT COUNT(Employees.last_name) as "number", Employees.last_name
FROM Employees
GROUP BY last_name
ORDER BY "number" DESC;
