-- Create a trigger to enforce data integrity on INSERT and UPDATE operations
CREATE OR REPLACE TRIGGER regions_countries_integrity
BEFORE INSERT OR UPDATE ON countries
FOR EACH ROW
DECLARE
  l_region_count INTEGER;
BEGIN
  -- Check if the REGION_ID exists in the regions table
  SELECT COUNT(*) INTO l_region_count
  FROM regions
  WHERE region_id = :NEW.region_id;

  -- If the REGION_ID doesn't exist, raise an exception
  IF l_region_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Invalid REGION_ID. The specified region does not exist.');
  END IF;
END;
/
