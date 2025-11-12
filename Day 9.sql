SELECT 
    patient_id,
    name,
    arrival_date,
    departure_date,
    (departure_date - arrival_date) AS stay_days
FROM patients;

SELECT 
	patient_id,
	name,
	TO_CHAR(arrival_date, 'YYYY') AS arrival_year,
	TO_CHAR(arrival_date, 'MM') AS arrival_month
FROM patients;

SELECT * FROM patients
WHERE arrival_date BETWEEN '2025-01-01' AND '2025-6-21';

SELECT * FROM patients
WHERE TO_CHAR(arrival_date, 'MM') = '06';

-- Practice Questions:
-- 1. Extract the year from all patient arrival dates.
SELECT
patient_id,
name,
TO_CHAR(arrival_date, 'YYYY') as arrival_year
FROM patients;

-- 2. Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT 
	patient_id,
	name,
	(departure_date - arrival_date) AS stay_days
FROM patients;

-- 3. Find all patients who arrived in a specific month.
SELECT 
	patient_id,
	name,
	arrival_date
FROM patients
WHERE TO_CHAR(arrival_date, 'MM') = '05';

-- Daily Challenge:
-- Question: 
-- Calculate the average length of stay (in days) for each service, showing only services 
-- where the average stay is more than 7 days. Also show the count of patients 
-- and order by average stay descending.

SELECT service,
	COUNT(*) AS patient_count,
	AVG((departure_date - arrival_date)) AS avg_stay_days
	FROM patients
	GROUP BY service
	HAVING AVG((departure_date - arrival_date)) > 7
	ORDER BY avg_stay_days DESC;