--join the CSV files, you can use the following SQL queries:
--1.To list the details of each employee, including the employee number, last name, first name, sex, and salary:

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON e.emp_no = s.emp_no;

--2.To list the first name, last name, and hire date for employees hired in 1986:

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3.To list the manager of each department, including the department number, department name, manager's employee number, last name, and first name:

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
LEFT JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
LEFT JOIN employees AS e ON dm.emp_no = e.emp_no;

--4.To list the department of each employee, including the employee number, last name, first name, and department name:

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
LEFT JOIN employees AS e ON de.emp_no = e.emp_no
LEFT JOIN departments AS d ON de.dept_no = d.dept_no;

--5.To list the first name, last name, and sex for employees named "Hercules" with last names starting with "B":

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.To list all employees in the Sales department:

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;