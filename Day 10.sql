SELECT 
name, 
satisfaction,
	CASE
	WHEN satisfaction >= 90 THEN 'Excellent'
	WHEN satisfaction >= 75 THEN 'Good'
	WHEN satisfaction >= 60 THEN 'Fair'
	ELSE 'Needs Improvement'
	END AS satisfaction_category
FROM patients;

SELECT
name,
	CASE
	WHEN age < 18 THEN 'Pedistric'
	WHEN age BETWEEN 18 AND 65 THEN 'Adult'
	ELSE 'Senior'
	END AS age_group
FROM patients;

SELECT
service,
COUNT(*) AS total,
SUM(CASE WHEN satisfaction >= 80 THEN 1 ELSE 0 END) AS high_satisfaction_score,
SUM(CASE WHEN satisfaction < 60 THEN 1 ELSE 0 END) AS low_satisfaction_score
FROM patients
GROUP BY service;

-- Practice Questions:
-- 1. Categorise patients as 'High', 'Medium', or 'Low' satisfaction based on their scores.
SELECT 
patient_id,
name,
satisfaction,
	CASE 
	WHEN satisfaction >= 90 THEN 'High'
	WHEN satisfaction >= 75 THEN 'Good'
	WHEN satisfaction > 60 THEN 'Low' 
	END AS satisfaction_level
FROM patients;

-- 2. Label staff roles as 'Medical' or 'Support' based on role type.
SELECT 
staff_name,
	CASE 
	WHEN role = 'doctor' THEN 'Medical'
	ELSE 'Support'
	END AS Role
FROM staff;

-- 3. Create age groups for patients (0-18, 19-40, 41-65, 65+).
SELECT
patient_id,
name,
age,
	CASE 
	WHEN age > 0 AND age <= 18 THEN 'Minor'
	WHEN age > 19 AND age <= 40 THEN 'Adult'
	WHEN age > 41 AND age <= 65 THEN 'Senior'
	ELSE 'Old'
	END AS age_group
FROM patients;

-- Daily Challenge:
-- **Question:** 
-- Create a service performance report showing service name, total patients admitted, 
-- and a performance category based on the following: 'Excellent' 
-- if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. 
-- Order by average satisfaction descending.
SELECT 
service AS service_name,
SUM(patients_admitted) AS total_patient_admitted,
AVG(patient_satisfaction) AS avg_patient_satisfaction,
	CASE 
	WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
	WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
	WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
	ELSE 'Needs Improvement'
	END AS satisfaction_index
FROM services_weekly
GROUP BY service
ORDER BY avg_patient_satisfaction DESC;
