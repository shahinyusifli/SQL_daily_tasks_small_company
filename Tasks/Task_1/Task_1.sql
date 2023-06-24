CREATE OR REPLACE PACKAGE BODY employee_info_pkg IS

  PROCEDURE get_department_employees IS
  BEGIN
    BEGIN
      FOR dept_rec IN (
        SELECT d.DEPARTMENT_NAME, COUNT(*) AS "Number of employees"
        FROM departments d
        INNER JOIN employees e ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
        GROUP BY d.DEPARTMENT_NAME
      ) LOOP
        DBMS_OUTPUT.PUT_LINE('Department: ' || dept_rec.DEPARTMENT_NAME || ', Number of employees: ' || dept_rec."Number of employees");
      END LOOP;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred in get_department_employees: ' || SQLERRM);
    END;
  END;

  PROCEDURE get_lowest_salary_employees IS
  BEGIN
    BEGIN
      FOR emp_rec IN (
        SELECT e.FIRST_NAME, e.LAST_NAME, e.SALARY, d.DEPARTMENT_NAME
        FROM employees e
        INNER JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
        WHERE (e.DEPARTMENT_ID, e.SALARY) IN (
          SELECT e.DEPARTMENT_ID, MIN(e.SALARY)
          FROM employees e
          GROUP BY e.DEPARTMENT_ID
        )
      ) LOOP
        DBMS_OUTPUT.PUT_LINE('Employee: ' || emp_rec.FIRST_NAME || ' ' || emp_rec.LAST_NAME || ', Salary: ' || emp_rec.SALARY || ', Department: ' || emp_rec.DEPARTMENT_NAME);
      END LOOP;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred in get_lowest_salary_employees: ' || SQLERRM);
    END;
  END;

  PROCEDURE get_city_employees_above_threshold IS
  BEGIN
    BEGIN
      FOR emp_rec IN (
        SELECT l.CITY, COUNT(*) AS "Number of employees"
        FROM departments d
        LEFT JOIN employees e ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
        LEFT JOIN locations l ON l.LOCATION_ID = d.LOCATION_ID
        GROUP BY l.CITY
        HAVING COUNT(*) > 34
      ) LOOP
        DBMS_OUTPUT.PUT_LINE('City: ' || emp_rec.CITY || ', Number of employees: ' || emp_rec."Number of employees");
      END LOOP;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred in get_city_employees_above_threshold: ' || SQLERRM);
    END;
  END;

  PROCEDURE get_top_2_jobs_employees IS
  BEGIN
    BEGIN
      FOR job_rec IN (
        SELECT j.JOB_TITLE AS "Job", COUNT(*) AS "Number of employees", MIN(j.MIN_SALARY) AS "Minimum salary", MAX(j.MAX_SALARY) AS "Maximum salary"
        FROM employees e
        INNER JOIN jobs j ON e.JOB_ID = j.JOB_ID
        GROUP BY j.JOB_TITLE
        ORDER BY COUNT(*) DESC
        FETCH FIRST 2 ROWS ONLY
      ) LOOP
        DBMS_OUTPUT.PUT_LINE('Job: ' || job_rec."Job" || ', Number of employees: ' || job_rec."Number of employees" || ', Minimum salary: ' || job_rec."Minimum salary" || ', Maximum salary: ' || job_rec."Maximum salary");
      END LOOP;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred in get_top_2_jobs_employees: ' || SQLERRM);
    END;
  END;

  PROCEDURE get_city_salary_statistics IS
  BEGIN
    BEGIN
      FOR data_rec IN (
        SELECT l.CITY AS "Cities",
               j.MIN_SALARY AS "Lowest_salary",
               j.MAX_SALARY AS "Highest salary",
               COUNT(*) AS "Total number of employees",
               COUNT(CASE WHEN e.SALARY = j.MIN_SALARY THEN 1 END) AS "Number of lowest salary employees",
               COUNT(CASE WHEN e.SALARY = j.MAX_SALARY THEN 1 END) AS "Number of highest salary employees",
               (COUNT(CASE WHEN e.SALARY = j.MIN_SALARY THEN 1 END) * 100 / COUNT(*)) AS "Percentage of lowest salary employees",
               (COUNT(CASE WHEN e.SALARY = j.MAX_SALARY THEN 1 END) * 100 / COUNT(*)) AS "Percentage of highest salary employees"
        FROM departments d
        LEFT JOIN employees e ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
        LEFT JOIN locations l ON l.LOCATION_ID = d.LOCATION_ID
        LEFT JOIN jobs j ON j.JOB_ID = e.JOB_ID
        GROUP BY l.CITY
      ) LOOP
        DBMS_OUTPUT.PUT_LINE('City: ' || data_rec."Cities");
        DBMS_OUTPUT.PUT_LINE('Lowest Salary: ' || data_rec."Lowest_salary");
        DBMS_OUTPUT.PUT_LINE('Highest Salary: ' || data_rec."Highest salary");
        DBMS_OUTPUT.PUT_LINE('Total number of employees: ' || data_rec."Total number of employees");
        DBMS_OUTPUT.PUT_LINE('Number of lowest salary employees: ' || data_rec."Number of lowest salary employees");
        DBMS_OUTPUT.PUT_LINE('Number of highest salary employees: ' || data_rec."Number of highest salary employees");
        DBMS_OUTPUT.PUT_LINE('Percentage of lowest salary employees: ' || data_rec."Percentage of lowest salary employees");
        DBMS_OUTPUT.PUT_LINE('Percentage of highest salary employees: ' || data_rec."Percentage of highest salary employees");
        DBMS_OUTPUT.PUT_LINE('---------------------------');
      END LOOP;
    EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred in get_city_salary_statistics: ' || SQLERRM);
    END;
  END;

END employee_info_pkg;
/
