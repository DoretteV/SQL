-- 1. 

CREATE TABLE actor(
    id numeric,
    movie text,
    actor text
);

COPY actor
FROM 'C:\YourDirectory\movies.txt'
WITH (FORMAT CSV, HEADER, DELIMITER ':');

--2

COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 
    ORDER BY housing_unit_count_100_percent DESC
     )
TO 'C:\YourDirectory\us_counties_housing_export_12.11.2023.txt'
WITH (FORMAT CSV, HEADER);

-- 3. Imagine you're importing a file that contains a column with these values:
      -- 17519.668
      -- 20084.461
      -- 18976.335
-- Will a column in your target table with data type numeric(3,8) work for these
-- values? Why or why not?

--No it wont work. The total numbers in the example is 8. 
--The correct data type numeric is (8,3)
