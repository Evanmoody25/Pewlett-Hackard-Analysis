--START OF CHALLENGE CODE

-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;
	
SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO most_recent_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

SELECT * FROM most_recent_titles

--retrieving counts of employees by most recent occupation and about to retire.
SELECT COUNT(mrt.emp_no),
mrt.title
INTO retiring_employees
FROM most_recent_titles as mrt
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_employees
