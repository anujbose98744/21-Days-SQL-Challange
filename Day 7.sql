SELECT service,
COUNT(*) AS patient_count
FROM patients
GROUP BY service
HAVING COUNT(*) > 250;

SELECT service,
COUNT(*) AS patient
FROM patients
WHERE age > 65
GROUP BY service
HAVING COUNT(*) > 70;

SELECT service,
ROUND(AVG(satisfaction), 2) AS avg_satisfaction,
COUNT(*) AS count
FROM patients
GROUP BY service
HAVING ROUND(AVG(satisfaction), 2) > 70 AND COUNT(*) > 50;

--Practice Questions:
-- 1. Find services that have admitted more than 500 patients in total.
SELECT service,
SUM(patients_admitted) AS total_patient_admitted
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted) > 500
ORDER BY SUM(patients_admitted) DESC;

--2. Show services where average patient satisfaction is below 75.
SELECT service,
AVG(patient_satisfaction) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction) > 75;

-- 3. List weeks where total staff presence across all services was less than 50.
SELECT week,
SUM(present) AS total_staff_presence
FROM staff_schedule
GROUP BY week
HAVING SUM(present) < 50;

-- Daily Challenge:

-- **Question:**
-- Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80.
-- Show service name, total refused, and average satisfaction.

SELECT service AS service_name,
SUM(patients_refused) AS total_patient_refused,
AVG(patient_satisfaction) AS avg_patient_satisfaction
FROM services_weekly
GROUP BY service_name
HAVING SUM(patients_refused)>100 AND AVG(patient_satisfaction) < 80;
