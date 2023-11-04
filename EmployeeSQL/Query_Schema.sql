-- SCHEMA: SQL_schema

-- DROP SCHEMA IF EXISTS "SQL_schema" ;

CREATE SCHEMA IF NOT EXISTS "SQL_schema"
    AUTHORIZATION postgres;
	
	
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