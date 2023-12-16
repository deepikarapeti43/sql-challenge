--1.List the employee number, last name, first name, sex, and salary of each employee.

SELECT E.emp_no,E.last_name,E.first_name,E.sex,S.salary 
FROM employees E
JOIN salaries S
ON E.emp_no=S.emp_no LIMIT 10;

--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name,last_name,EXTRACT(YEAR FROM hire_date) AS hire_year
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date)=1986 LIMIT 10;

--3.List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT DM.dept_no AS "Manager dept no",D.dept_name AS "Manager dept name",E.emp_no AS "Manager emp no",
E.last_name AS "Manager last name",E.first_name AS "Manager first name"
FROM departments D
JOIN dept_manager DM
ON DM.dept_no=D.dept_no
JOIN employees E
ON DM.emp_no=E.emp_no LIMIT 10;

--4.List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name

SELECT DE.dept_no,E.emp_no,E.last_name,E.first_name,D.dept_name
FROM employees E
JOIN dept_emp DE
ON E.emp_no=DE.emp_no
JOIN departments D
ON DE.dept_no=D.dept_no LIMIT 10;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose
--last name begins with the letter B.

SELECT first_name,last_name,sex
FROM employees 
WHERE first_name='Hercules' and last_name LIKE 'B%' LIMIT 10;


--6.List each employee in the Sales department, including their employee number, last name, and first name.

SELECT E.emp_no,E.last_name,E.first_name,D.dept_name
FROM employees E
JOIN dept_emp DE
ON E.emp_no=DE.emp_no
JOIN departments D
ON DE.dept_no=D.dept_no 
WHERE D.dept_name='Sales' LIMIT 10;

--7.List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.

SELECT E.emp_no,E.last_name,E.first_name,D.dept_name
FROM employees E
JOIN dept_emp DE
ON E.emp_no=DE.emp_no
JOIN departments D
ON DE.dept_no=D.dept_no 
WHERE D.dept_name IN ('Sales','Development') LIMIT 10;

--8.List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).

SELECT COUNT(last_name),last_name
FROM employees 
GROUP BY last_name
ORDER BY last_name DESC LIMIT 10;
