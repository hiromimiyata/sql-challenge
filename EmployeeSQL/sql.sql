-- DROP TABLE IF EXISTS salaries, dept_manager, dept_emp, employees, titles, departments;

CREATE TABLE departments (
	dept_no VARCHAR (10) NOT NULL,
	dept_name VARCHAR (50) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

CREATE TABLE dept_emp (
	emp_no VARCHAR (10) NOT NULL,
	dept_no VARCHAR (10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	emp_no VARCHAR (10) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_manager;

CREATE TABLE titles (
	title_id VARCHAR (10) NOT NULL,
	title VARCHAR(50) NOT NULL,
	PRIMARY KEY (title_id)
);
SELECT * FROM titles;

CREATE TABLE employees (
  emp_no VARCHAR (10) NOT NULL,
  emp_title_id VARCHAR (50) NOT NULL,
  birth_date VARCHAR (50),
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  sex VARCHAR(5) NOT NULL,
  hire_date VARCHAR (50),
  PRIMARY KEY(emp_no)
);

SELECT * FROM employees;

CREATE TABLE salaries (
	emp_no VARCHAR (10) NOT NULL,
	salary VARCHAR (10) NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

-- Run this code after running and importing the tables above

ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

SELECT * FROM dept_manager;

-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no,employees.last_name, employees.first_name,employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT  employees.first_name,employees.last_name, employees.hire_date
FROM employees
WHERE hire_date LIKE '%/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.hire_date
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT employees.emp_no,employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT  employees.first_name,employees.last_name, employees.sex
FROM employees
WHERE last_name LIKE 'B%' AND first_name='Hercules' ;

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT   employees.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
WHERE dept_name='Sales'
;

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT   employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
INNER JOIN dept_emp ON
departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
WHERE dept_name='Sales' OR dept_name='Development'
;

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT employees.last_name, COUNT(last_name) AS "Duplicate Names"
FROM employees
GROUP BY last_name
ORDER BY "Duplicate Names" DESC;
