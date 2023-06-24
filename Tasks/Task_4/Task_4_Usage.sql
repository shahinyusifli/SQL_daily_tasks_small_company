-- Declare a variable to hold the retrieved employees
DECLARE
  employees_list employee_pkg.employee_list;
BEGIN
  -- Call the procedure to retrieve employees in department with ID 10
  employee_pkg.retrieve_employees(10, employees_list);

  -- Process the retrieved employees
  FOR i IN 1..employees_list.COUNT LOOP
    -- Access individual employee details using the record syntax
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || employees_list(i).employee_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || employees_list(i).first_name || ' ' || employees_list(i).last_name);
    -- Display other employee details as needed
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
