-- Package specification
CREATE OR REPLACE PACKAGE employee_pkg IS
  TYPE employee_type IS RECORD (
    employee_id employees.employee_id%TYPE,
    first_name employees.first_name%TYPE,
    last_name employees.last_name%TYPE,
    email employees.email%TYPE,
    phone_number employees.phone_number%TYPE,
    hire_date employees.hire_date%TYPE,
    job_id employees.job_id%TYPE,
    salary employees.salary%TYPE,
    commission_pct employees.commission_pct%TYPE,
    manager_id employees.manager_id%TYPE,
    department_id employees.department_id%TYPE
  );

  TYPE employee_list IS TABLE OF employee_type;

  PROCEDURE retrieve_employees(
    p_department_id IN departments.department_id%TYPE,
    p_employees OUT employee_list
  );
END employee_pkg;
/
-- Package body
CREATE OR REPLACE PACKAGE BODY employee_pkg IS
  PROCEDURE retrieve_employees(
    p_department_id IN departments.department_id%TYPE,
    p_employees OUT employee_list
  ) IS
  BEGIN
    SELECT emp.employee_id, emp.first_name, emp.last_name, emp.email,
           emp.phone_number, emp.hire_date, emp.job_id, emp.salary,
           emp.commission_pct, emp.manager_id, emp.department_id
    BULK COLLECT INTO p_employees
    FROM employees emp
    WHERE emp.department_id = p_department_id;
    
    IF p_employees.COUNT = 0 THEN
      RAISE_APPLICATION_ERROR(-20001, 'No employees found for the given department.');
    END IF;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'No employees found for the given department.');
  END retrieve_employees;
END employee_pkg;
/
