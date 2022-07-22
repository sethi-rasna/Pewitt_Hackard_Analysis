SELECT e.emp_no, 
e.First_name, 
e.last_name,
ti.titles,
ti.from_date,
ti.to_date
INTO titles_retirement
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
          AND (ti.to_date = '9999-01-01');



SELECT DISTINCT ON (tr.emp_no) tr.emp_no, 
tr.first_name,
tr.last_name,
tr.titles
INTO unique_employees
FROM titles_retirement AS tr
WHERE (tr.to_date = '9999-01-01')
ORDER BY tr.emp_no DESC;

SELECT ue.titles, COUNT(ue.titles) as title_count
INTO retiring_titles
FROM unique_employees AS ue
GROUP BY ue.titles 
ORDER BY title_count DESC;

SELECT e.emp_no, 
e.First_name, 
e.last_name,
e.birth_date,
ti.titles,
de.from_date,
de.to_date
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
 AND (ti.to_date = '9999-01-01');
     