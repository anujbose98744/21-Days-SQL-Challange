SELECT 
p.patient_id,
p.name AS patient_name,
p.service,
s.staff_name,
s.role
FROM patients p INNER JOIN staff s ON p.service = s.service
ORDER BY p.service, p.name;

SELECT 
p.patient_id,
p.name AS patient_name,
p.service,
COUNT(s.staff_id) AS staff_count
FROM patients p INNER JOIN staff s ON p.service = s.service
GROUP BY p.patient_id, p.name, p.service
ORDER BY p.service, p.name, p.patient_id;

SELECT *
FROM services_weekly sw INNER JOIN staff_schedule ss ON 
ss.service  = sw.service
AND ss.week = sw.week;

-- Practice Questions:
-- 1.Join patients and staff based on their common service field (show patient and staff who work in same service).
SELECT 
p.patient_id,
p.name AS patient_name,
p.service,
s.staff_name
FROM patients p 
JOIN staff s ON p.service = s.service
ORDER BY p.name, p.service;

-- 2.Join services_weekly with staff to show weekly service data with staff information.
SELECT
s.staff_id,
s.staff_name,
s.role AS staff_role,
s.service
FROM staff s
JOIN services_weekly sw ON s.service = sw.service
ORDER BY s.staff_id, s.staff_name;

-- 3.Create a report showing patient information along with staff assigned to their service.
SELECT
p.patient_id,
p.name AS patient_name,
p.service,
s.staff_id,
s.staff_name,
s.role
FROM patients p
JOIN staff s ON p.service = s.service;

--### Daily Challenge:
-- Question: 
-- Create a comprehensive report showing patient_id, patient name, age, service, 
-- and the total number of staff members available in their service. 
-- Only include patients from services that have more than 5 staff members. 
-- Order by number of staff descending, 
-- then by patient name.

SELECT 
p.patient_id,
p.name AS patient_name,
p.age,
p.service,
COUNT(s.staff_id) AS staff_no
FROM patients p
JOIN staff s ON p.service = s.service
GROUP BY p.patient_id, p.name, p.age, p.service
HAVING COUNT(s.staff_id) > 5
ORDER BY staff_no DESC, patient_name DESC;

