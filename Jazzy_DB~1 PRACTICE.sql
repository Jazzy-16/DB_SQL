-- SELECT <columnName> FROM <tableName>;

SELECT * FROM employees;

-- SUGGESTED FORMAT --
SELECT * FROM JOBS;

select * from employees;

SeLeCt * FrOm eMploYEES;


SELECT * FROM regions;


SELECT manager_id FROM employees;


SELECT first_name, hire_date FROM employees;

-- Write a querty to retrieve all the information from the phone number, job id, and manager id from employees table

select phone_number, job_id, manager_id from employees;



SELECT * FROM employees
WHERE job_id = 'IT_PROG';









--1. FROM   -> First retrieves the table.
--2. WHERE  -> filters the rows in the table, or tables.
--3. SELECT -> selects the specific column from the table.



-- Write the query to get the department name column for department id = 50 from departments table.

select department_name, department_id from departments
WHERE department_id = 50;


SELECT * FROM EMPLOYEES
WHERE first_name = 'Neena'
AND last_name = 'King'
AND JOB_ID = 'AD_PRES';


-- Write a query and retrieve first_name with Bruce and David;

SELECT * FROM EMPLOYEES
WHERE first_name != 'David';

SELECT * FROM EMPLOYEES
WHERE salary in (17000, 9000, 3100, 2900);

SELECT * FROM EMPLOYEES
WHERE first_name in ('Neena', 'Alexander');


SELECT * FROM EMPLOYEES
WHERE salary <> 17000
or salary <> 9000
or salary <> 3100
or salary <> 2900;


--Write the query to get all columns from the employees' table if the department id is 50 and the job id is "ST_MAN"

SELECT * FROM employees
WHERE department_id = 50
AND job_id = 'ST_MAN';

--Write the query to get all columns from the employees' table if the department id is 50 or the job id is "ST_MAN"

SELECT * FROM employees
WHERE department_id = 50
OR job_id = 'ST_MAN';

--Write the query to get all columns from the employees' table if the department id is 70 or the salary is more than 5000

SELECT * FROM employees
WHERE department_id = 70
OR salary > 5000;


--Write the query to get all columns from the employees' table if the department id is 70 and the salary is more than 5000

SELECT * FROM employees
WHERE department_id = 70
AND salary > 5000;


--Write the query to find the employees who are not displayed in step 4.

SELECT * FROM employees
WHERE department_id <> 70
or salary <= 5000;

SELECT * FROM employees
WHERE NOT (department_id = 70 AND salary > 5000 );

SELECT * FROM employees
WHERE salary  BETWEEN 1000 AND 10000 ;

SELECT * FROM employees
WHERE salary  BETWEEN 6000 AND 10000
AND hire_date >  '7-JUN-97';

Select last_name ||'@gmail.com' as gmailAccount from employees;

Select last_name ||'@gmail.com' as "Gmail Account" from employees;

SELECT * 
FROM employees 
WHERE salary > 5000 
ORDER BY salary ASC, hire_date DESC;

-------------------------------------------------------------
Write a query that returns those employees who have  commission less than their salary

SELECT * FROM employees
WHERE commission_pct < salary;

-- 2.	Write a query that returns all employees that have a salary greater than 2500 and also work in department_id no 20

SELECT * FROM employees
WHERE salary > 2500
and DEPARTMENT_ID = 20;

-- 3.	Write a query that returns all employees that are not AD_VP nor SA_REP and have a salary greater than or equal to 2000

SELECT * FROM employees
WHERE job_id NOT IN  ( 'AD_VP', 'SA_REP' )
AND salary >= 2000;

-- 4.	Write a query to retrieve the first names and last names of all employees along with their job IDs, and concatenate them into a job_id column
--      in the format: <first_name> <last_name> works as a <job_id>. Alias this column as "Full Info".

SELECT first_name, last_name, first_name || ' ' || last_name || ' works as a ' || job_id AS "Full Info" FROM employees;

SELECT first_name, last_name, concat(concat(concat(first_name, ' ' ), concat(last_name, ' works as a ')), job_id) as "Full Info" FROM employees;

-- 5.	Write a query prints first name column as salary, and prints every name in a cell as " Steven makes $24000 per month "

SELECT first_name || ' makes $' || salary || ' per month' as "monthly salary" from employees;

-- 6. -- 5.	Write a query prints first name column as salary, and prints every name in a cell as " Steven makes $24000 per year "

SELECT first_name || ' makes $' || (salary * 12)  || ' per year' as "yearly salary" from employees;
