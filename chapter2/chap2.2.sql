-- 1
SELECT last_name, school
FROM teachers
ORDER BY school ASC, last_name;

-- 2
SELECT *
FROM teachers
WHERE first_name LIKE 'S%'
	AND (salary > 40000);

-- 3	
SELECT *
FROM teachers
WHERE hire_date > '2010-01-01'
ORDER BY salary DESC;