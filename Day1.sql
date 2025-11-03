SELECT * FROM patients LIMIT 5;

SELECT * FROM patients;

SELECT patient_id, name, age FROM patients;

SELECT name AS patient_name, age AS patient_age FROM patients;

--Retrieve all columns from the patients table.
SELECT * FROM patients

--Select only the patient_id, name, and age columns from the patients table.
SELECT patient_id, name, age FROM patients

--Display the first 10 records from the services_weekly table.
SELECT service AS service_weekly FROM patients LIMIT 10

/* Daily Challange
Question: List all unique hospital services available in the hospital.*/

SELECT DISTINCT service FROM patients;
