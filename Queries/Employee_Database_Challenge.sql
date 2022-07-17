SELECT e.emp_no, 
e.First_name, 
e.last_name,
ti.title,
ti.from_date,
ti.to_date,
FROM employees AS e,
INNER JOIN titles AS ti,
JOIN 
