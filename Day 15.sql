SELECT 
	sw.service,
	sw.week,
	sw.patients_admitted,
	COUNT(DISTINCT s.staff_id) AS total_staff,
	SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
AND sw.week = ss.week
WHERE sw.week = 10
GROUP BY sw.service, sw.week, sw.patients_admitted;

SELECT 
	p.patient_id,
	p.name AS patient_name,
	p.service,
	p.arrival_date,
	COUNT(DISTINCT s.staff_id) AS Assigned_staff,
	AVG(ss.present) AS avg_staff_presence
FROM patients p
JOIN staff s ON p.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY p.patient_id, p.name, p.service, p.arrival_date;

-- Practice Questions:
-- 1. Join patients, staff, and staff_schedule to show patient service and staff availability
SELECT
	p.patient_id,
	p.name AS patient_name,
	p.service,
	p.arrival_date,
	COUNT(DISTINCT s.staff_id) AS Assigned_staff,
	AVG(ss.present) AS avg_staff_presence
FROM patients p
JOIN staff s ON p.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY p.patient_id, p.name, p.service, p.arrival_date;

-- 2. Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT 
	sw.service,
	sw.week,
	sw.patients_admitted,
	COUNT(DISTINCT s.staff_id) AS total_staff,
	SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS staff_present
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
AND sw.week = ss.week
WHERE sw.week = 10
GROUP BY sw.service, sw.week, sw.patients_admitted;

-- 3. Create a multi-table report showing patient admissions with staff information.
SELECT
	p.patient_id,
	p.name AS patient_name,
	p.service,
	p.arrival_date,
	COUNT(DISTINCT s.staff_id) AS Assigned_staff,
	AVG(ss.present) AS avg_staff_presence
FROM patients p
JOIN staff s ON p.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY p.patient_id, p.name, p.service, p.arrival_date;

-- Daily Challenge:
-- Question: Create a comprehensive service analysis report for week 20 showing: 
-- service name, 
-- total patients admitted that week, total patients refused, average patient satisfaction, 
-- count of staff assigned to service, 
-- and count of staff present that week. 
-- Order by patients admitted descending.

SELECT 
    sw.service AS service_name,
    sw.patients_admitted AS total_patients_admitted,
    sw.patients_refused AS total_patients_refused,
    ROUND(AVG(sw.patient_satisfaction), 3) AS avg_patient_satisfaction,
    COUNT(DISTINCT s.staff_id) AS assigned_staff,
    SUM(CASE WHEN ss.present = 1 AND ss.week = 20 THEN 1 ELSE 0 END) AS staff_present_week_20
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id AND ss.week = 20
WHERE sw.week = 20
GROUP BY sw.service, sw.patients_admitted, sw.patients_refused
ORDER BY total_patients_admitted DESC;