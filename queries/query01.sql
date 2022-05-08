SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM dept_emp;
SELECT * FROM titles;

-- 
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- 
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- retirement eligibility
SELECT first_name, last_name, hire_date
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND 
      (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	  
-- count
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND 
      (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- save query result into a table
DROP TABLE IF EXISTS retirement_info;

SELECT emp_no, first_name, last_name, hire_date
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND 
      (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	  
-- 
SELECT * 
FROM retirement_info
LIMIT 3;