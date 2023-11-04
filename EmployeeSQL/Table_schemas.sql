-- SCHEMA: SQL_schema

-- DROP SCHEMA IF EXISTS "SQL_schema" ;

CREATE SCHEMA IF NOT EXISTS "SQL_schema"
    AUTHORIZATION postgres;
	
	
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