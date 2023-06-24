-- Declare a variable to hold the average salary
DECLARE
  avg_salary NUMBER;
BEGIN
  -- Call the function to calculate the average salary for the job with ID 'IT_PROG'
  avg_salary := salary_pkg.calculate_avg_salary('IT_PROG');
  
  -- Display the result
  DBMS_OUTPUT.PUT_LINE('Average Salary: ' || avg_salary);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
