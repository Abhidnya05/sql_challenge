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

CREATE TABLE Dept_emp (
  emp_no INTEGER PRIMARY KEY,
  dept_no VARCHAR(30) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_emp

CREATE TABLE Dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no INTEGER,
  FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES Dept_emp(emp_no)
);

SELECT * FROM Dept_manager

CREATE TABLE Employees (
  emp_no INTEGER,
  emp_title_id VARCHAR PRIMARY KEY,
  birthdate DATE,
  first_name VARCHAR,
  last_name VARCHAR,
  sex VARCHAR,
  hire_date DATE,
  FOREIGN KEY (emp_no) REFERENCES Dept_emp(emp_no)
);

SELECT * FROM Employees


CREATE TABLE Salaries (
  emp_no INTEGER,
  salary INTEGER,
  FOREIGN KEY (emp_no) REFERENCES Dept_emp(emp_no)
);

SELECT * FROM Salaries

CREATE TABLE Title (
  title_ID VARCHAR,
  title VARCHAR,
  FOREIGN KEY (title_ID) REFERENCES Employees(emp_title_id)
);

SELECT * FROM Title
