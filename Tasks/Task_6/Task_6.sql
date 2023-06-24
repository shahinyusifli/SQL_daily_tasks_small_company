DECLARE
  CURSOR country_cursor IS
    SELECT c.COUNTRY_NAME as Country, Count(j.JOB_TITLE) as "Number of employees"
    FROM employees e
    INNER JOIN jobs j ON j.JOB_ID = e.job_id
    INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
    INNER JOIN locations l ON l.LOCATION_ID = d.LOCATION_ID
    INNER JOIN countries c ON l.COUNTRY_ID = c.COUNTRY_ID
    GROUP BY c.COUNTRY_NAME;
  
  country_rec country_cursor%ROWTYPE;
BEGIN
  FOR country_rec IN country_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('Country: ' || country_rec.Country || ', Number of employees: ' || country_rec."Number of employees");
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
