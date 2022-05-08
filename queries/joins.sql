-- joins
-- employees & dept_emp
SELECT 
	e.emp_no,
	e.first_name ||' '|| e.last_name AS employee_name, 
	de.dept_no,
	e.hire_date
FROM employees e
JOIN dept_emp de
	ON de.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND
      (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31');
	  
-- 
SELECT 
	ri.emp_no,
	ri.first_name ||' '|| ri.last_name AS employee_name,
	ri.hire_date,
	de.dept_no
FROM retirement_info AS ri
JOIN dept_emp AS de
	ON de.emp_no = ri.emp_no;

-- 
-- left join
-- 
-- Joining departments and dept_manager tables
SELECT
	d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments d
INNER JOIN dept_manager dm
	ON d.dept_no = dm.dept_no;
	
-- left join retirement_info and dept_emp tables
DROP TABLE IF EXISTS current_emp;

SELECT
	ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info ri
INNER JOIN dept_emp de
	ON de.emp_no = ri.emp_no
WHERE de.to_date = '9999-01-01';

-- check table 
SELECT COUNT(*) FROM current_emp;