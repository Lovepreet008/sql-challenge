DROP TABLE departments;
DROP TABLE dept_emp;
DROP TABLE employees;
DROP TABLE dept_manager;
DROP TABLE salaries;

-- create departments table

CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR(30)NOT NULL
)

Select * from departments;


-- create salaries table

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	salary INTEGER
)

Select * from salaries;

-- create dept_emp table

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	PRIMARY KEY (emp_no, dept_no)
)

Select * from dept_emp;

--create employees table

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(6),
	hire_date VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no)
	
)
Select * from employees;

--create dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES salaries(emp_no),
	PRIMARY KEY (emp_no, dept_no)
	
)

Select * from dept_manager;


