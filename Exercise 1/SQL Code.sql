Exercise 1

------------SQL query to retrieve all columns from the employee table
SELECT*  
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"


------SQL query to find all unique departments in the employee table

SELECT DISTINCT (department)
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"

-----SQL query to retrieve all employees’ first and last names , ordered by salary in descending order
SELECT
    first_name,
    last_name,
    salary
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
ORDER BY salary DESC;

----------SQL query to retrieve the top 5 highest-paid employees

SELECT
    first_name,
    last_name,
    salary
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
ORDER BY salary DESC
LIMIT 5;

-----SQL query to find employees who work in the IT department

SELECT
    first_name,
    last_name,
    department
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE department = 'IT';

-----SQL query to find employees who work in the Finance department AND have a salary greater than 58, 000.

SELECT
    first_name,
    last_name,
    department,
    salary
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE department = 'Finance'
AND salary>'50000';

-----Query to find employees who work in the HR department  OR the Marketing department

SELECT
    first_name,
    last_name,
    department
    
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE department = 'HR'OR department='Marketing';

-----Query to find employees who do not work in the IT department

SELECT
    first_name,
    last_name,
    department
    
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE NOT department = 'IT';

-----SQL query to find employees who are in HR, IT or Finance departments

SELECT
    first_name,
    last_name,
    department
    
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE department IN ('IT', 'HR','Finance');

-----SQL query where employees who are in IT department, have a salary greater than 50,000 and are located in New York:

SELECT
    first_name,
    last_name,
    department,
    Salary,
    city
    
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE department = 'IT'
AND salary > '50000'
AND city = 'New York';

-----SQL query to retrieve the first and last names of employees who work in the Finance or Marketing department, earn
 more than 52, 000 and order the results by salary in descending order

SELECT
    first_name,
    last_name,
    department,
    Salary    
    
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE department = 'IT'OR department = 'Marketing'
AND salary > '52000'
ORDER BY salary DESC;

-----SQL query to find all the unique cities where employees  work, excluding those in IT and HR departments

SELECT DISTINCT (CITY)
    first_name,
    last_name,
    department      
 
FROM
  "EMPLOYEES_DB"."PUBLIC"."EMPLOYEES"
WHERE NOT (department = 'IT'OR department = 'HR');
