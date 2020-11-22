-- How to query "how many columns are in the department table?"
SELECT * FROM salaries;

-- search for the first and last names of employees born between January 1, 1952, and December 31, 1955.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Create another query that will search for only 1952 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Create another query that will search for only 1953 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Create another query that will search for only 1954 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Create another query that will search for only 1955 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create a new table of retiring employees
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Who is retiring in our table? 
SELECT * FROM retirement_info;

-- Drop retirement table to create a new one with employee number
DROP TABLE retirement_info;

 -- Joining retirement_info and dept_emp tables (Left Join)
 SELECT retirement_info.emp_no,
     retirement_info.first_name,
 retirement_info.last_name,
     department_employees.to_date    
 FROM retirement_info
 LEFT JOIN department_employees
 ON retirement_info.emp_no = department_employees.emp_no;

-- Using Aliases instead of full table titles, refactoring "joining retirement_info and Department_Employees with left join"
 SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Refactoring Joining departments and dept_manager tables with aliases
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Use Left Join for retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee count by department number (with ORDER BY line)
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Create a new table of retiring employees refractored (add gender, create new temporary table)
SELECT emp_no,
    first_name,
last_name,
    gender
    INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Join emp_info to salaries table
SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
     AND (de.to_date = '9999-01-01');

     -- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

-- Adding departments to current_emp table, Department Retireess 
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name       
-- INTO dept_info 
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

--Create a query that will return only the information relevant to the Sales team.
SELECT re.emp_no,
	re.first_name,
	re.last_name,
	de.dept_name
INTO sales_info
FROM retirement_info AS re
INNER JOIN dept_info AS de
	ON(re.emp_no = de.emp_no)
WHERE de.dept_name = 'Sales'

-- view sales_info table
SELECT*FROM sales_info


-- sales and development merge
SELECT re.emp_no,
	re.first_name,
	re.last_name,
	de.dept_name
INTO sales_and_dev_info
FROM retirement_info AS re
INNER JOIN dept_info AS de
	ON(re.emp_no = de.emp_no)
WHERE de.dept_name IN ('Sales', 'Development')

-- view sales_and_dev info
SELECT*FROM sales_and_dev_info