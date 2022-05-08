-- mentors count
DROP TABLE IF EXISTS mentor_count;

SELECT 
	d.dept_name,
	COUNT(de.dept_no) AS mentor_count
INTO mentor_count
FROM mentorship_eligibilty AS me
JOIN dept_emp de
	ON me.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
GROUP BY d.dept_no
ORDER BY d.dept_no;

-- retiring count
DROP TABLE IF EXISTS retiring_count;

SELECT 
	d.dept_name,
	COUNT(de.dept_no) AS retiring_count
INTO retiring_count
FROM retirement_info AS ri
JOIN dept_emp de
	ON ri.emp_no = de.emp_no
JOIN departments d
	ON de.dept_no = d.dept_no
GROUP BY d.dept_no
ORDER BY d.dept_no;

-- retiring-mentor count
DROP TABLE IF EXISTS retiring_mentor_count;

SELECT 
	rc.*,
	mc.mentor_count,
	rc.retiring_count / mc.mentor_count AS rmc_ratio
INTO retiring_mentor_count
FROM retiring_count AS rc
JOIN mentor_count AS mc
	ON rc.dept_name = mc.dept_name;