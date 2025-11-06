SELECT * FROM patients
LIMIT 10;

SELECT * FROM patients
LIMIT 30 OFFSET 20;

--Practice Questions:
--1. Display the first 5 patients from the patients table.
SELECT * FROM patients
LIMIT 5;

--2. Show patients 11-20 using OFFSET.
SELECT * FROM patients
LIMIT 10 OFFSET 10;

--3. Get the 10 most recent patient admissions based on arrival_date.
SELECT * FROM patients
ORDER BY arrival_date DESC
LIMIT 10;

/*Daily Challenge:

**Question:** Find the 3rd to 7th highest patient satisfaction scores 
from the patients table, showing patient_id, name, service, and satisfaction. 
Display only these 5 records.*/

SELECT patient_id, name, service, satisfaction FROM patientS
ORDER BY satisfaction
LIMIT 7 OFFSET 2;
