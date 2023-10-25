-- List the employee number, last name, first name, sex, and salary of each employee.
Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
Join salaries s ON e.emp_no = s.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name, last_name, hire_date
from employees
where EXTRACT(YEAR FROM TO_DATE(hire_date, 'MM/DD/YY'))= 1986;

		   
--List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
from departments d
INNER JOIN dept_manager m ON m.dept_no = d.dept_no
INNER JOIN employees e ON e.emp_no= m.emp_no
ORDER BY d.dept_no

--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employees e
INNER JOIN dept_emp de ON de.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no= de.dept_no
ORDER BY e.emp_no


--List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT first_name, last_name, sex
from employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, last_name, first_name
from employees
WHERE emp_no IN (
	SELECT emp_no
	from dept_emp
	WHERE dept_no IN(
		SELECT dept_no
		from departments
		WHERE dept_name= 'Sales'))
ORDER BY emp_no;


--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
JOIN dept_emp de ON de.emp_no= e.emp_no
JOIN departments d ON d.dept_no=de.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;


--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)

SELECT last_name, COUNT(last_name) as frequency_counts
FROM employees
GROUP BY last_name
ORDER BY frequency_counts DESC;
