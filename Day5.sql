SELECT 
COUNT(*) AS total,
AVG(age) AS avg_age,
MIN(age) AS youngest,
MAX(age) AS oldest,
SUM(satisfaction) AS total_satisfaction
FROM patients
WHERE service = 'emergency';

SELECT ROUND(AVG(age)) AS avg_age
FROM patients;

SELECT(COUNT(DISTINCT service)) AS unique_services
FROM patients;

--Practice Questions:
--1. Count the total number of patients in the hospital.
SELECT
COUNT(*) AS total_patients
FROM patients;

--2. Calculate the average satisfaction score of all patients.
SELECT
ROUND(AVG(satisfaction), 2) AS satisfaction_score
FROM patients;

--3. Find the minimum and maximum age of patients.
SELECT
MAX(age) AS max_age,
MIN(age) AS min_age
FROM patients

-- Daily Challenge:
-- **Question:** Calculate the total number of patients admitted, total patients refused, 
-- and the average patient satisfaction across all services and weeks. 
-- Round the average satisfaction to 2 decimal places.

SELECT
SUM(patients_admitted) AS total_patients_admitted,
SUM(patients_refused) AS total_patients_refused,
ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction
FROM services_weekly;