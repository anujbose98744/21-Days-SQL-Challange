SELECT
	s.staff_id,
	s.staff_name,
	s.role,
	s.service,
	COUNT(ss.week) AS staff_scheduled,
	SUM(COALESCE(ss.present, 0)) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service;

SELECT 
	s.*
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
WHERE ss.staff_id IS NULL;

SELECT 
	sw.service,
	sw.week,
	COUNT(p.patient_id) AS patient_count
FROM services_weekly sw
LEFT JOIN patients p ON sw.service = p.service
GROUP BY sw.service, sw.week;

-- Practice Questions:
-- 1. Show all staff members and their schedule information (including those with no schedule entries).
SELECT
	s.staff_id,
	s.staff_name,
	s.role,
	s.service,
	COUNT(ss.week) AS staff_scheduled,
	SUM(COALESCE(ss.present, 0)) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service;

-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).
SELECT DISTINCT
	sw.service,
	s.staff_id,
	s.staff_name
FROM services_weekly sw 
LEFT JOIN staff s ON sw.service = s.service;

--3. Display all patients and their service's weekly statistics (if available).
SELECT 
	p.patient_id,
	p.name AS patient_name,
	p.service
FROM patients p
LEFT JOIN services_weekly sw ON p.service = sw.service;

-- Daily Challenge:
-- Question:
-- Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and 
-- the count of weeks they were present (from staff_schedule). 
-- Include staff members even if they have no schedule records. 
-- Order by weeks present descending.
SELECT 
	s.staff_id,
	s.staff_name,
	s.role,
	s.service,
	SUM(COALESCE(ss.present, 0)) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY 
	s.staff_id,
	s.staff_name,
	s.role,
	s.service
ORDER BY weeks_present DESC;