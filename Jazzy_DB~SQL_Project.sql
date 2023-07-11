--1. Write a query to display the employee id, employee name (first name and last name) for all employees who earn more than the average salary. 
select * from employees
select * from departments
select * from  regions;
select * from  locations;
select * from  jobs;
select * from countries

SELECT employee_id, first_name, last_name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Write a query to display the employee name (first name and last name), employee id, and salary of all employees who report to Payam. 

SELECT first_name, last_name,employee_id, salary FROM employees e
WHERE manager_id = (SELECT employee_idFROM employees WHERE first_name = 'Payam');

--3. Write a query to display the department number, name (first name and last name),
--job_id and department name for all employees in the Finance department.

SELECT d.department_id, e.first_name, e.last_name, e.job_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

--4. Write a query to display all the information of the employees whose salary is within
--the range of the smallest salary and 2500.

SELECT *
FROM employees
WHERE salary >= (
SELECT MIN(salary) FROM employees) AND salary <= 2500;


--5. Write a SQL query to find the first name, last name, department, city, and state 
--province for each employee.

SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--6. Write a SQL query to find all those employees who work in department ID 80 or 40.
--Return first name, last name, department number, and department name.

SELECT e.first_name, e.last_name, d.department_id, d.department_name FROM employees e
JOIN departments d ON e.department_id = d.department_id WHERE d.department_id IN (80, 40);

--7.  Write a query to display the employee name (first name and last name) and hire 
--date for all employees in the same department as Clara. Exclude Clara.

sELECT e.first_name, e.last_name, e.hire_date FROM employees e
JOIN departments d ON e.department_id = d.department_id WHERE d.department_id = (
SELECT department_id FROM employees WHERE first_name = 'Clara') AND e.first_name != 'Clara';

--8. Write a query to display the employee number, name (first name and last name), 
--and salary for all employees who earn more than the average salary and who work
---in a department with any employee with a J in their name.

SELECT e.employee_id, e.first_name, e.last_name, e.salary FROM employees e
WHERE e.salary > ( SELECT AVG(salary) FROM employees)
AND e.department_id IN (SELECT department_id FROM employees WHERE first_name LIKE '%J%');

--9. Write a SQL query to find those employees whose first name contains the letter ‘z’.
--Return first name, last name, department, city, and state province.

SELECT e.first_name, e.last_name, d.department_name, l.city, l.state_province FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.first_name LIKE '%z%';

--10. Write a SQL query to find all departments, including those without employees. Return first name, last name, department ID, department name.

SELECT e.first_name, e.last_name, d.department_id, d.department_name from departments d
LEFT JOIN employees e on d.department_id = e.department_id;


--11. Write a query to display the employee number, name (first name and last 
--name) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN.

sELECT e.first_name, e.last_name, d.department_id, d.department_name from departments d
LEFT JOIN employees e ON d.department_id = e.department_id;


--12. Write a query to display the employee number, name (first name and last 
--name) and job title for all employees whose salary is more than any salary of those
--employees whose job title is PU_MAN. Exclude job title PU_MAN.

SELECT employee_id, first_name, last_name, job_id FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'PU_MAN')
AND job_id <> 'PU_MAN';


--13. Write a query to display the employee number, name (first name and last 
--name) and job title for all employees whose salary is more than any average salary
--of any department.
SELECT employee_id, first_name, last_name, job_id
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--14. Write a query to display the department id and the total salary for those 
--departments which contains at least one employee.
SELECT department_id, SUM(salary) FROM employees
GROUP BY department_id
HAVING COUNT(*) > 0;

--15. Write a SQL query to find the employees who earn less than the employee of
--ID 182. Return first name, last name and salary.
SELECT first_name, last_name, salary FROM employees
WHERE salary < (SELECT salary FROM employees
WHERE employee_id = 182);

--16. Write a SQL query to find the employees and their managers. Return the first
--name of the employee and manager.
SELECT e.first_name as employee, m.first_name as manager
FROM employees e JOIN employees m
ON e.manager_id = m.manager_id;

--17. Write a SQL query to display the department name, city, and state province 
--for each department.

SELECT d.department_name, l.city, l.state_province from departments d JOIN locations l
ON d.location_id = l.location_id;

--18. Write a query to identify all the employees who earn more than the average 
--and who work in any of the IT departments.
SELECT e.employee_id, e.first_name, e.last_name, e.salary  fROM employees e JOIN departments d
ON e.department_id = d.department_id WHERE e.salary > (SELECT AVG(salary) FROM employees)
AND department_name = 'IT';

--19. Write a SQL query to find out which employees have or do not have a 
--department. Return first name, last name, department ID, department name.
SELECT e.first_name, e.last_name, e.department_id || '' AS department_id, d.department_name || '' AS department_name
from employees e LEFT JOIN departments d on e.department_id = d.department_id;

--20. Write a SQL query to find the employees and their managers, Those 
--managers do not work under any manager also appear in the list, Return the first 
--name of the employee and manager.

SELECT e.first_name as employee, m.first_name as manager FROM employees e LEFT JOIN employees m 
ON e.manager_id = m.manager_id where (e.manager_id IS NULL AND m.employee_id IS NULL)
OR (e.manager_id IS NOT NULL AND m.employee_id IS NOT NULL);

--21.  Write a query to display the name (first name and last name) for those 
--employees who gets more salary than the employee whose ID is 163.

SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees
WHERE employee_id = 163);

--22.  Write a query to display the name (first name and last name), salary, 
--department id, job id for those employees who works in the same designation as 
--the employee works whose id is 169.
SELECT first_name, last_name, salary, department_id, job_id FROM employees
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 169);

--23. Write a SQL query to find the employees who work in the same department 
--as the employee with the last name Taylor. Return first name, last name and 
--department ID.

SELECT e.first_name, e.last_name, e.department_id  from employees e JOIN employees t
ON e.department_id = t.department_id
WHERE t.last_name = 'Taylor';

--24. Write a SQL query to find the department name and the full name (first and 
--last name) of the manager.
sELECT d.department_name, CONCAT(CONCAT(e.first_name, ' '), e.last_name) as manager
from departments d JOIN employees eon d.manager_id = e.employee_id;

--25. Write a SQL query to find the employees who earn $12000 or more. Return 
--employee ID, starting date, end date, job ID and department ID.

SELECT j.employee_id, j.start_date, j.end_date, j.job_id, j.department_id
FROM job_history j JOIN employees e ON j.employee_id = e.employee_id
WHERE salary >= 12000;

--26. Write a query to display the name (first name and last name), salary, 
--department id for those employees who earn such amount of salary which is the 
--smallest salary of any of the departments.

SELECT first_name, last_name, salary, department_id FROM employees 
WHERE salary = (SELECT MIN(salary) FROM employees);

--27. Write a query to display all the information of an employee whose salary and
--reporting person id is 3000 and 121, respectively.
--SELECT * FROM employees
--WHERE manager_id = (SELECT manager_id FROM employees
--WHERE manager_id = 121 
--AND salary = 3000);

SELECT * FROM employees where salary = 3000 AND manager_id = 121;

--28. Display the employee name (first name and last name), employee id, and job
--title for all employees whose department location is Toronto.

SELECT first_name, last_name, employee_id, job_title FROM employees e JOIN jobs j
ON e.job_id = j.job_id WHERE department_id = (SELECT department_id 
FROM departments d JOIN locations l ON d.location_id = l.location_id
WHERE city = 'Toronto');

--29. Write a query to display the employee name( first name and last name ) and 
--department for all employees for any existence of those employees whose salary is
--more than 3700.

SELECT e.first_name, e.last_name, d.department_name from employees e JOIN departments d
ON e.department_id = d.department_id WHERE salary > 3700;

--30.  Write a query to determine who earns more than employee with the last 
--name 'Russell'.
SELECT * FROM employees where salary > (SELECT salary FROM employees WHERE last_name = 'Russel');

--31. Write a query to display the names of employees who don't have a manager.

SELECT first_name, last_name FROM employees WHERE manager_id IS NULL;

--32. Write a query to display the names of the departments and the number of 
--employees in each department.

SELECT COUNT(e.employee_id), d.department_name 
FROM departments d LEFT JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name;

--33. Write a query to display the last name of employees and the city where they 
--are located.

SELECT e.last_name, l.city FROM employees e JOIN departments d
ON e.department_id = d.department_id JOIN locations l
ON d.location_id = l.location_id;

--34. Write a query to display the job titles and the average salary of employees 
--for each job title.

SELECT job_id, AVG(salary) FROM employees
GROUP BY job_id;

--35. Write a query to display the employee's name, department name, and the 
--city of the department.

SELECT first_name, department_name, city 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id;

--36. Write a query to display the names of employees who do not have a 
--department assigned to them.

SELECT first_name, last_name From  employees where department_id IS NULL;

--37. Write a query to display the names of all departments and the number of 
--employees in them, even if there are no employees in the department.

SELECT COUNT(*) as total, d.department_name 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name;

--38. Write a query to display the names of employees and the department 
--names, but only include employees whose salary is above 10,000.

SELECT d.department_name, e.first_name, e.last_name 
FROM departments d  JOIN employees e
ON d.department_id = e.department_id
WHERE e.salary > 10000;

--39. Write a query to display department names and the average salary within 
--each department, but only for departments with an average salary above 7000.

SELECT d.department_name, AVG(e.salary) 
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING AVG(e.salary) > 7000;
SELECT * FROM departments;

--40. Write a query to display the names of employees who work in the 'IT' 
--department.

SELECT e.first_name, e.last_name 
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE department_name = 'IT';

--41. Write a query which is looking for the names of all employees whose salary is
--greater than 50% of their department’s total salary bill.

SELECT first_name, last_name
FROM employees e JOIN (
SELECT department_id, SUM(salary) as total FROM employees 
GROUP BY department_id) d
ON e.department_id = d.department_id
WHERE e.salary > (0.5 * d.total);

--42. Write a query to get the details of employees who are managers.

SELECT * FROM employees
WHERE employee_id IN (SELECT DISTINCT manager_id FROM employees);

--43.  Write a query in SQL to display the department code and name for all 
--departments which located in the city London.

SELECT department_name, department_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE city = 'London';

--44. Write a query in SQL to display the first and last name, salary, and 
--department ID for all those employees who earn more than the average salary and
--arrange the list in descending order on salary.

SELECT first_name, last_name, salary, department_id FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary desc;

--45. Write a query in SQL to display the first and last name, salary, and 
--department ID for those employees who earn more than the maximum salary of a 
--department which ID is 40.

SELECT first_name, last_name, salary, department_id FROM employees
WHERE salary > (SELECT MAX(salary) FROM employees
WHERE department_id = 40);

--46. Write a query in SQL to display the department name and Id for all 
--departments where they located, that Id is equal to the Id for the location where 
--department number 30 is located.

SELECT d.department_name, d.department_id
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE l.location_id = (SELECT location_id FROM departments
WHERE department_id = 30);

--47. Write a query in SQL to display the details of departments managed by 
--Susan.

SELECT d.department_id, d.department_name, d.location_id
FROM departments d JOIN  employees e
ON d.manager_id = e.employee_id
WHERE e.first_name = 'Susan';

--48. Write a query to display the department names and the location cities. Only 
--include departments that are located in a country with the country_id 'US'.

SELECT d.department_name, l.city
FROM departments d JOIN locations l
ON d.location_id = l.location_id
WHERE country_id = 'US';

--49. Write a query to display the first name and last name of employees along 
--with the name of the department they work in. Only include employees whose last 
--name starts with the letter 'S'.

SELECT e.first_name, e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.last_name LIKE 'S%';

--50. Write a query to display the department names and the number of 
--employees in each department. Only include departments with more than 2 
--employees, and order the result by the number of employees in descending order.

SELECT d.department_name, COUNT(e.employee_id)
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 2
ORDER BY COUNT(e.employee_id) desc;
