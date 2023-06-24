CREATE OR REPLACE PACKAGE region_pkg IS
  -- Insert a new region
  PROCEDURE insert_region(p_region_id IN regions.region_id%TYPE, p_region_name IN regions.region_name%TYPE);

  -- Update an existing region
  PROCEDURE update_region(p_region_id IN regions.region_id%TYPE, p_region_name IN regions.region_name%TYPE);

  -- Delete a region
  PROCEDURE delete_region(p_region_id IN regions.region_id%TYPE);

  -- Retrieve a region
  FUNCTION get_region(p_region_id IN regions.region_id%TYPE) RETURN regions%ROWTYPE;
END region_pkg;
/

CREATE OR REPLACE PACKAGE BODY region_pkg IS
  -- Insert a new region
  PROCEDURE insert_region(p_region_id IN regions.region_id%TYPE, p_region_name IN regions.region_name%TYPE) IS
  BEGIN
    INSERT INTO regions(region_id, region_name)
    VALUES (p_region_id, p_region_name);
  END insert_region;

  -- Update an existing region
  PROCEDURE update_region(p_region_id IN regions.region_id%TYPE, p_region_name IN regions.region_name%TYPE) IS
  BEGIN
    UPDATE regions
    SET region_name = p_region_name
    WHERE region_id = p_region_id;
  END update_region;

  -- Delete a region
  PROCEDURE delete_region(p_region_id IN regions.region_id%TYPE) IS
  BEGIN
    DELETE FROM regions
    WHERE region_id = p_region_id;
  END delete_region;

  -- Retrieve a region
  FUNCTION get_region(p_region_id IN regions.region_id%TYPE) RETURN regions%ROWTYPE IS
    l_region regions%ROWTYPE;
  BEGIN
    SELECT *
    INTO l_region
    FROM regions
    WHERE region_id = p_region_id;

    RETURN l_region;
  END get_region;
END region_pkg;
/
