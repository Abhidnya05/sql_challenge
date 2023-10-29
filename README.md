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
