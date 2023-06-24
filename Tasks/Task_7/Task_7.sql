select *
from(
SELECT a.first_name, a.last_name, a.job_id
FROM employees A
WHERE A.salary &gt;(Select avg(salary) from employees) and a.salary &lt; (select max(salary) from
employees)
) b
where b.job_id=&quot;SY_ANA&quot;;