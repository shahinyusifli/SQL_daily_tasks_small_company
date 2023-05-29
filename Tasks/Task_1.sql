-- List all the departments and the number of employees per each department
SELECT d.DEPARTMENT_NAME as "Names of departments", COUNT(*) as "Number of employees” 
FROM departments d
INNER JOIN employees e ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
GROUP by d.DEPARTMENT_NAME;

-- List the employees with the lowest salary per each department
SELECT e.FIRST_NAME, e.LAST_NAME, e.SALARY, d.DEPARTMENT_NAME
FROM employees e, departments d
WHERE e.DEPARTMENT_ID=d.DEPARTMENT_ID and (e.DEPARTMENT_ID, e.SALARY) IN
( 
SELECT e.DEPARTMENT_ID, MIN(e.SALARY)
FROM employees e
GROUP BY e.DEPARTMENT_ID
);


-- Display the number of employees per city having not less than 34 employees
SELECT l.CITY as "Cities", COUNT(*) as "Number of employees"
FROM departments d
LEFT JOIN employees e ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
LEFT JOIN locations l on l.LOCATION_ID = d.LOCATION_ID
GROUP by l.CITY
HAVING COUNT(*) > 34;

-- List the 2 jobs with the maximum number of employees and the respective minimum and maximum salary per job.
SELECT  j.JOB_TITLE as "Job", count(*) as "Number of employees",
j.MIN_SALARY as "Minimum salary", j.MAX_SALARY as "Maximum salary"
FROM employees e
INNER JOIN jobs j ON e.JOB_ID=j.JOB_ID
GROUP by j.JOB_TITLE
ORDER by count(*) DESC
LIMIT 2;
