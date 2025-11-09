SELECT service, 
COUNT(*) AS total_patients
FROM patients
GROUP BY service;

SELECT service,
COUNT(*) AS total_patients,
ROUND(AVG(age)) AS avg_age,
ROUND(AVG(satisfaction)) AS avg_satisfaction
FROM patients
GROUP BY service
ORDER BY total_patients DESC;

SELECT service,
CASE WHEN age >= 65 THEN 'Senior' ELSE 'Adult' END AS age_group,
COUNT(*) AS count 
FROM patients
GROUP BY service, age_group;

--Practice Questions:
-- 1. Count the number of patients by each service.
SELECT service,
COUNT(*) AS patient_count
FROM patients
GROUP BY service
ORDER BY patient_count ASC;

-- 2. Calculate the average age of patients grouped by service.
SELECT service,
ROUND(AVG(age)) AS avg_age
FROM patients
GROUP BY service;

-- 3. Find the total number of staff members per role.
SELECT role,
COUNT(*) AS total_staff
FROM staff
GROUP BY role;

--Daily Challenge:

-- **Question:** 
-- For each hospital service, calculate the total 
-- number of patients admitted, total patients refused, 
-- and the admission rate (percentage of requests that were admitted). 
-- Order by admission rate descending.

SELECT service,
SUM(patients_admitted) AS total_patient_admitted,
SUM(patients_refused) AS total_patient_refused,
ROUND(
        100.0 * SUM(patients_admitted)/SUM(patients_request),
        2
    ) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;