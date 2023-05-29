-- List the lowest and highest salary per city+, the total number of employees per city+, the number of employees earning the lowest salary-, the number of employees earning the highest salary-, the percentage of employees earning the highest salary per city and the percentage of employees earning the lowest salary per city-. This information should be shown as 1 row per city containing all the information requested. 
SELECT l.CITY as "Cities", j.MIN_SALARY as "Lowest_salary",
j.MAX_SALARY as "Highest salary", COUNT(*) as "Total number of employees",
COUNT(CASE WHEN e.SALARY = j.MIN_SALARY THEN 1 END) as "Number of lowest salary employees",
COUNT(CASE WHEN e.SALARY = j.MAX_SALARY THEN 1 END) as "Number of highest salary employees",
((COUNT(CASE WHEN e.SALARY = j.MIN_SALARY THEN 1 END)* 100) / COUNT(*) ) as "Percentage of lowest salary emplemployees ",
((COUNT(CASE WHEN e.SALARY = j.MAX_SALARY THEN 1 END)* 100) / COUNT(*) ) as "Percentage of highest salary emplemployees "

FROM departments d
LEFT JOIN employees e ON e.DEPARTMENT_ID=d.DEPARTMENT_ID
LEFT JOIN locations l on l.LOCATION_ID=d.LOCATION_ID
LEFT JOIN jobs j on j.JOB_ID=e.JOB_ID
GROUP by l.CITY;

-- Think yourself SQL statement which could be useful according data model for database users. Please substantiate your point of view and shortly explain what you did.
-- Answer:
-- I can say it is so challenging question because I must think about many aspects which are related to database users. I think growth is so important for every company and if you want to grow you must scale your business for getting a share from some specific market. Employers for each country can be useful for database users which audit can make calculations of revenue and cost per employee and human resource department can analyze the performance of staff based on each country according to their numbers.
-- Query:
SELECT c.COUNTRY_NAME as “Country”, Count(j.JOB_TITLE) as "Number of employees"
FROM employees e
INNER JOIN jobs j ON j.JOB_ID=e.job_id
INNER JOIN departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
INNER JOIN locations l on l.LOCATION_ID = d.LOCATION_ID
INNER JOIN countries c on l.COUNTRY_ID = c.COUNTRY_ID
GROUP by c.COUNTRY_NAME;


