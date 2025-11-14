SELECT DISTINCT
service
FROM patients;

SELECT DISTINCT
service,
CASE 
	WHEN age > 18 THEN 'Pediatric' 
	WHEN age BETWEEN 18 AND 65 THEN 'Adult'
	ELSE 'Senior'
	END AS age_group
FROM patients;

SELECT DISTINCT
service,
arrival_date
FROM patients
ORDER BY service, arrival_date;

-- Practice Questions:
-- 1.List all unique services in the patients table.
SELECT DISTINCT
service
FROM patients;

-- 2.Find all unique staff roles in the hospital.
SELECT DISTINCT
role AS staff_role
FROM staff;

-- 3.Get distinct months from the services_weekly table.
SELECT DISTINCT
CASE 
	WHEN month = 1 THEN 'January'
	WHEN month = 2 THEN 'February'
	WHEN month = 3 THEN 'March'
	WHEN month = 4 THEN 'April'
	WHEN month = 5 THEN 'May'
	WHEN month = 6 THEN 'June'
	WHEN month = 7 THEN 'July'
	WHEN month = 8 THEN 'August'
	WHEN month = 9 THEN 'September'
	WHEN month = 10 THEN 'October'
	WHEN month = 11 THEN 'November'
	WHEN month = 12 THEN 'December'
	END AS month
FROM services_weekly
ORDER BY month ASC;

-- Daily Challenge:
-- Question:
-- Find all unique combinations of service and event type from the services_weekly table 
-- where events are not null or none, along with the count of occurrences for each combination. 
-- Order by count descending.

SELECT 
service,
event,
COUNT(*) AS total_occurrences
FROM services_weekly
WHERE event IS NOT NULL 
AND event <> 'none'
GROUP BY service, event
ORDER BY total_occurrences DESC;
