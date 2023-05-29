-- According to the Jobs table (provided in company_db.sql script) what could you tell about the employees table for the System Analyst position (SY_ANA)? 
-- Answer:
-- Many informative results can come from the "employees table" using the "Jobs table" but I use them for finding how many employees can earn less and more than the minimum and earn more than maximum salary. I can say System analysis staff earn less than the minimum but only two of them can earn more than the minimum. Surprisingly, nobody can earn more than the maximum.
-- Query:
SELECT j.JOB_TITLE AS "JOB",
Count((CASE WHEN e.SALARY < j.MIN_SALARY THEN 1 END)) as "Number oemployees earn less than minumum", 
Count((CASE WHEN e.SALARY > j.MIN_SALARY THEN 1 END)) as "Number of employees earn more than minumum",
Count((CASE WHEN e.SALARY > j.MAX_SALARY THEN 1 END)) as "Number of employees earn more than maximum"
FROM employees e 
LEFT JOIN jobs j on e.JOB_ID=j.JOB_ID
WHERE e.JOB_ID='SY_ANA'
GROUP by e.JOB_ID;




