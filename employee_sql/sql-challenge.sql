Homerwork.sql

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_id AS "Employee Number", e.last_name AS "Last Name", e.first_name AS "First Name", e.gender AS "Sex", s.salary AS "Salary"
FROM employees AS e
JOIN salary_ AS s ON e.emp_id = s.emp_id;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT  first_name AS "First Name", last_name AS "Last Name", hire_date AS "Hire Date"
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_id, d.dept_name, dm.emp_id, e.last_name, e.first_name
FROM departments_ as d
LEFT JOIN dept_managers_ as dm 
ON d.dept_id=dm.dept_id
LEFT JOIN employees as e
ON dm.emp_id=e.emp_id;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_employees_ as de
ON e.emp_id = de.emp_id
LEFT JOIN departments_ as d
ON de.dept_id = d.dept_id;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.gender
FROM employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_employees_ as de
ON e.emp_id = de.emp_id
LEFT JOIN departments_ as d
ON de.dept_id = d.dept_id
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


SELECT e.emp_id, e.last_name, e.first_name, d.dept_name
FROM employees as e
LEFT JOIN dept_employees_ as de
ON e.emp_id = de.emp_id
LEFT JOIN departments_ as d
ON de.dept_id = d.dept_id
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT e.last_name as "Last Name", COUNT(e.emp_id) as "Total Employees"
FROM employees as e
GROUP BY e.last_name ORDER BY "Total Employees" DESC;