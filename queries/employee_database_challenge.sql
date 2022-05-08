-- 
-- Deliverable 1: 
-- The number of retiring employees by title
-- 

-- retirement titles
DROP TABLE IF EXISTS retirement_titles;

SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
	ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, title;

--
-- distinct titles
DROP TABLE IF EXISTS unique_titles;

SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--
-- retiring titles
SELECT
	COUNT(title),
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- 
-- Deliverable 2:
-- Employees eligible for the Mentorship Program
-- 

-- Mentorship eligibilty
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employees AS e
LEFT JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
LEFT JOIN titles AS ti
	ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31') AND
	  (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

-- 
SELECT * FROM mentorship_eligibilty;

SELECT * FROM retirement_titles;

SELECT 
	COUNT(title) AS retiring_count,
	title
FROM retirement_titles
GROUP BY title;

--
SELECT 
	COUNT(title) AS mentorship_eligibilty,
	title
FROM mentorship_eligibilty
GROUP BY title;

