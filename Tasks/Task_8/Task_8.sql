DECLARE
  job_title employees.job_title%TYPE;
  less_than_minimum NUMBER;
  more_than_minimum NUMBER;
  more_than_maximum NUMBER;
BEGIN
  SELECT j.JOB_TITLE, 
         COUNT(CASE WHEN e.SALARY < j.MIN_SALARY THEN 1 END) AS "Number of employees earn less than minimum",
         COUNT(CASE WHEN e.SALARY > j.MIN_SALARY THEN 1 END) AS "Number of employees earn more than minimum",
         COUNT(CASE WHEN e.SALARY > j.MAX_SALARY THEN 1 END) AS "Number of employees earn more than maximum"
  INTO job_title, less_than_minimum, more_than_minimum, more_than_maximum
  FROM employees e
  LEFT JOIN jobs j ON e.JOB_ID = j.JOB_ID
  WHERE e.JOB_ID = 'SY_ANA'
  GROUP BY j.JOB_TITLE;

  DBMS_OUTPUT.PUT_LINE('Job Title: ' || job_title);
  DBMS_OUTPUT.PUT_LINE('Number of employees earn less than minimum: ' || less_than_minimum);
  DBMS_OUTPUT.PUT_LINE('Number of employees earn more than minimum: ' || more_than_minimum);
  DBMS_OUTPUT.PUT_LINE('Number of employees earn more than maximum: ' || more_than_maximum);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
