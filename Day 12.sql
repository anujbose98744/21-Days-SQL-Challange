SELECT * FROM
services_weekly
WHERE event IS NULL;

SELECT * FROM
services_weekly
WHERE event IS NOT NULL;

SELECT
service,
week,
COALESCE(event, 'No event') AS event_status
FROM services_weekly;

SELECT
COUNT(*) AS total_rows,
COUNT(event) AS not_null_events,
COUNT(*) - COUNT(event) AS null_events
FROM services_weekly;

SELECT * FROM services_weekly
WHERE event IS NOT NULL AND event != '';

-- Practice Questions:
-- 1.Find all weeks in services_weekly where no special event occurred
SELECT 
DISTINCT week,
event AS event_status
FROM services_weekly
WHERE event = 'none' OR event IS NULL OR event = ''
ORDER BY week; 

-- 2. Count how many records have null or empty event values.
SELECT 
COUNT(*) AS total_value,
COUNT(event) AS not_null_value,
COUNT(*) - COUNT(event) AS null_value
FROM services_weekly;

-- 3. List all services that had at least one week with a special event.
SELECT 
COUNT(DISTINCT week),
event
FROM services_weekly
GROUP BY event
HAVING event != 'none';

-- Daily Challenge:
-- Question: 
-- Analyze the event impact by comparing weeks with events vs weeks without events. 
-- Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, 
-- and average staff morale. Order by average patient satisfaction descending.

SELECT 
COUNT(DISTINCT week) AS count_of_week,
AVG(patient_satisfaction) AS avg_patient_satisfaction,
AVG(staff_morale) AS avg_staff_morale,
CASE
	WHEN event IS NOT NULL AND event != 'none' AND event != '' THEN 'With Event'
	ELSE 'No Evnet'
	END AS event_status
FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;