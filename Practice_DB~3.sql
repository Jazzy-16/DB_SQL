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


-----------------------------------------------------
SELECT CONCAT(CONCAT(UPPER(first_name),' '), LOWER(job_id)) AS concatenated_info
FROM employees;

SELECT UPPER(last_name) AS last_name
FROM employees;

SELECT LOWER(email) AS Email_Address
FROM employees;

SELECT UPPER(first_name),
LOWER(last_name) ,
INITCAP(email) 
FROM employees;


SELECT UPPER(first_name) AS "First Name",
UPPER(last_name) AS "Last Name",
LOWER(job_id) AS "Job Title"
FROM employees;

SELECT CONCAT(CONCAT(first_name, UPPER(' IS THE NAME' )and their job is: '), job_title, ))'' AS row_format
FROM employees;