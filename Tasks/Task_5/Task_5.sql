-- Create the function
CREATE OR REPLACE FUNCTION calculate_avg_salary(p_job_id IN employees.job_id%TYPE)
  RETURN NUMBER
IS
  avg_salary NUMBER;
BEGIN
  SELECT AVG(salary)
  INTO avg_salary
  FROM employees
  WHERE job_id = p_job_id;
  
  IF avg_salary IS NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'No employees found for the given job.');
  END IF;
  
  RETURN avg_salary;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001, 'No employees found for the given job.');
END;
/

-- Create the package specification
CREATE OR REPLACE PACKAGE salary_pkg IS
  FUNCTION calculate_avg_salary(p_job_id IN employees.job_id%TYPE)
    RETURN NUMBER;
END salary_pkg;
/

-- Create the package body
CREATE OR REPLACE PACKAGE BODY salary_pkg IS
  FUNCTION calculate_avg_salary(p_job_id IN employees.job_id%TYPE)
    RETURN NUMBER
  IS
    avg_salary NUMBER;
  BEGIN
    -- Implementation same as the function in step 1
  END calculate_avg_salary;
END salary_pkg;
/