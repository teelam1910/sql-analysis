-- Data Analysis
-- List the employee number, last name, first name, sex, and salary of each employee
SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    e.sex,
    s.salary
FROM
    employees AS e
JOIN
    salaries AS s ON e.emp_no = s.emp_no;
	

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT
    first_name,
    last_name,
    hire_date
FROM
    employees
WHERE
    DATE_PART('year', hire_date) = 1986;
	

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT
    d.dept_no AS department_number,
    d.dept_name AS department_name,
    dm.emp_no AS manager_employee_number,
    e.last_name AS manager_last_name,
    e.first_name AS manager_first_name
FROM
    departments AS d
JOIN
    dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN
    employees AS e ON dm.emp_no = e.emp_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT
    de.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    -- de.dept_no AS department_number,
    d.dept_name AS department_name
FROM
    dept_emp AS de
JOIN
    employees AS e ON de.emp_no = e.emp_no
JOIN
    departments AS d ON de.dept_no = d.dept_no;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT
	first_name, last_name, sex
FROM 
	employees as e
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name 
SELECT
    de.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    de.dept_no AS department_number,
    d.dept_name AS department_name
FROM
    dept_emp AS de
JOIN
    employees AS e ON de.emp_no = e.emp_no
JOIN
    departments AS d ON de.dept_no = d.dept_no
Where d.dept_name = 'Sales'; 


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT
    de.emp_no AS employee_number,
    e.last_name,
    e.first_name,
    de.dept_no AS department_number,
    d.dept_name AS department_name
FROM
    dept_emp AS de
JOIN
    employees AS e ON de.emp_no = e.emp_no
JOIN
    departments AS d ON de.dept_no = d.dept_no
Where d.dept_name IN ('Sales', 'Development'); 


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT
    last_name,
    COUNT(*) AS frequency_count
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency_count DESC;