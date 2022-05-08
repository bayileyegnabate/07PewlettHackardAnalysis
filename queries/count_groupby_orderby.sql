-- Count, Group By, and Order By
-- 

-- employee count by department number
DROP TABLE IF EXISTS current_emp_count;

SELECT
	de.dept_no,
	COUNT(ce.emp_no)
INTO current_emp_count
FROM current_emp AS ce
LEFT JOIN dept_emp AS de
	ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- 
SELECT * FROM employees;

-- create more list
-- 
-- employee information: emp_no, name, gender, salary
SELECT
	e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	de.to_date,
	s.salary
FROM employees as e
LEFT JOIN salaries as s
	ON e.emp_no = s.emp_no
	LEFT JOIN dept_emp as de
		ON de.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND
	  (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31') AND
	  (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- list of current managers per department
DROP TABLE IF EXISTS manager_info;
SELECT 
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager as dm
INNER JOIN current_emp as ce
	ON dm.emp_no = ce.emp_no
	LEFT JOIN departments as d
		ON dm.dept_no = d.dept_no;

-- department retirees: include employee's department in current-emp
DROP TABLE IF EXISTS dept_current_emp;

SELECT
	ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_current_emp
FROM current_emp ce
LEFT JOIN dept_emp de
	ON ce.emp_no = de.emp_no
	LEFT JOIN departments d
		ON de.dept_no = d.dept_no
ORDER BY de.dept_no, ce.emp_no;
		
SELECT * FROM retirement_info;

-- sales
DROP TABLE IF EXISTS sales;
SELECT
	ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO sales
FROM retirement_info ri
INNER JOIN dept_emp de
	ON ri.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- sales and development
DROP TABLE IF EXISTS development_sales;
SELECT
	ri.emp_no,
	ri.first_name,
	ri.last_name,
	d.dept_name
INTO development_sales
FROM retirement_info ri
INNER JOIN dept_emp de
	ON ri.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY d.dept_name;




-- SELECT 
-- 	ce.*,
-- 	d.dept_name
-- FROM current_emp as ce
-- LEFT JOIN dept_emp as de
-- 	ON ce.emp_no = de.emp_no
-- 	LEFT JOIN departments as d
-- 		ON de.dept_no = d.dept_no
-- ORDER BY d.dept_no, ce.emp_no;



-- -- emp_info + dept_no
-- DROP TABLE IF EXISTS emp_info;
-- SELECT
-- 	e.emp_no,
-- 	e.first_name,
-- 	e.last_name,
-- 	e.gender,
-- 	s.salary,
-- 	de.to_date,
-- 	d.dept_name
-- INTO emp_info
-- FROM employees as e
-- LEFT JOIN salaries as s
-- 	ON e.emp_no = s.emp_no
-- 	LEFT JOIN dept_emp as de
-- 		ON de.emp_no = e.emp_no
-- 		LEFT JOIN departments d
-- 			ON d.dept_no = de.dept_no
-- WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND
-- 	  (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31') AND
-- 	  (de.to_date = '9999-01-01')
-- ORDER BY d.dept_no, e.emp_no;

-- 
