-- Insert a new region
BEGIN
  region_pkg.insert_region(5, 'New Region');
  COMMIT;
END;

-- Update an existing region
BEGIN
  region_pkg.update_region(5, 'Updated Region');
  COMMIT;
END;

-- Delete a region
BEGIN
  region_pkg.delete_region(5);
  COMMIT;
END;

-- Retrieve a region
DECLARE
  l_region regions%ROWTYPE;
BEGIN
  l_region := region_pkg.get_region(1);
  DBMS_OUTPUT.PUT_LINE('Region ID: ' || l_region.region_id || ', Region Name: ' || l_region.region_name);
END;
