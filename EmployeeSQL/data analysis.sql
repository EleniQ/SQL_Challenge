--employee number, last name, first name, sex, salary for each employee.
SELECT * FROM department;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;



SELECT 
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.sex, 
	s.salary
FROM employees AS e
JOIN salaries AS s 
	ON e.emp_no = s.emp_no;

--first name, last name,hire date for employees who were hired in 1986.

SELECT first_name, last_name, sex, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--manager of department , department number, department name, employee number, last name, and first name.

SELECT 
	x.dept_no,
	d.dept_name,
	x.emp_no, 
	e.first_name,
	e.last_name
FROM dept_manager AS x
JOIN department AS d 
	ON x.dept_no = d.dept_no
JOIN employees AS e 
	ON e.emp_no = x.emp_no;	

--department number for employee , employee’s employee number, last name, first name, and department name.

SELECT
	x.dept_no,
	x.emp_no, 
	e.first_name,
	e.last_name,
	d.dept_name
FROM dept_manager AS x
JOIN department AS d 
	ON x.dept_no = d.dept_no
JOIN employees AS e 
	ON e.emp_no = x.emp_no;

--first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex 
FROM employees
where first_name = 'Hercules' 
and  last_name like 'B%';

--employee in Sales department, employee number, last name, and first name.

SELECT 
	e.emp_no, 
	e.first_name, 
	e.last_name
FROM employees AS e
JOIN dept_emp AS junct 
	ON e.emp_no = junct.emp_no
JOIN department AS d 
	ON junct.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--employee the Sales and Development, employee number, last name, first name, and department name.

SELECT
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	x.dept_name
FROM employees AS e
JOIN dept_emp AS junct 
	ON e.emp_no = junct.emp_no
JOIN department AS x 
	ON junct.dept_no = x.dept_no
WHERE x.dept_name = 'Sales' 
OR x.dept_name = 'Development'
ORDER BY last_name;


--frequency counts, in desc, employee last names (that is, how many employees share each last name).

SELECT last_name, 
COUNT(last_name) AS "frequency"
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;