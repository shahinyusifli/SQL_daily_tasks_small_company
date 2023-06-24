-- Valid insert
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('US', 'United States', 1);
-- The trigger will allow the insertion since REGION_ID 1 exists in the regions table

-- Invalid insert
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('UK', 'United Kingdom', 5);
-- The trigger will raise an exception since REGION_ID 5 does not exist in the regions table

-- Valid update
UPDATE countries
SET region_id = 2
WHERE country_id = 'US';
-- The trigger will allow the update since REGION_ID 2 exists in the regions table

-- Invalid update
UPDATE countries
SET region_id = 10
WHERE country_id = 'US';
-- The trigger will raise an exception since REGION_ID 10 does not exist in the regions table
