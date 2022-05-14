-- patient entity

-- get all patient personal information to populate the patients dropdown table
SELECT * FROM patient;

-- get a single patient's data for the Update Patient form
SELECT * FROM patient WHERE patient_id = :patient_ID_selected_from_browse_patient_page;

-- add a new patient
INSERT INTO `patient`(patient_first_name,patient_last_name,patient_birth,patient_address,patient_email,patient_contact) VALUES (:patient_first_nameInput,:patient_last_nameInput,:patient_birthInput,:patient_addressInput,:patient_emailInput,:patient_contactInput);

-- update a patient's data based on submission of the Update patient form 
UPDATE `patient` SET patient_first_name = :patient_first_name_Input, patient_last_name= :patient_last_nameInput, patient_birth = :patient_birthInput, patient_address = :patient_addressInput, patient_email = patient_emailInput, patient_contact = patient_contactInput
WHERE patient_id = :patient_ID_from_the_update_form;

-- delete a patient
DELETE FROM patient WHERE patient_id = :patient_ID_selected_from_browse_patient_page;


-- medication entity

-- get all medication personal information to populate the medications dropdown table
SELECT * FROM medication;

-- get a single medication's data for the Update medication form
SELECT * FROM medication WHERE medication_id = :medication_ID_selected_from_browse_medication_page;

-- add a new medication
INSERT INTO `medication`(medication_name,pharmacy_contact) VALUES (:medication_nameInput,:pharmacy_contactInput);

-- update a medication's data based on submission of the Update medication form 
UPDATE `medication` SET medication_name = :medication_nameInput, pharmacy_contact = :pharmacy_contactInput
WHERE medication_id = :medication_ID_from_the_update_form;


-- delete a medication
DELETE FROM medication WHERE medication_id = :medication_ID_selected_from_browse_medication_page;


-- pharmacy entity

-- get all pharmacy personal information to populate the pharmacys dropdown table
SELECT * FROM pharmacy;

-- get a single pharmacy's data for the Update pharmacy form
SELECT * FROM pharmacy WHERE pharmacy_id = :pharmacy_ID_selected_from_browse_pharmacy_page;

-- add a new pharmacy
INSERT INTO `pharmacy`(pharmacy_name,pharmacy_address,pharmacy_contact) VALUES (:pharmacy_nameInput,:pharmacy_addressInput,:pharmacy_contactInput);

-- update a pharmacy's data based on submission of the Update pharmacy form 
UPDATE `pharmacy` SET pharmacy_name = :pharmacy_nameInput, pharmacy_address = :pharmacy_addressInput, pharmacy_contact = :pharmacy_contactInput
WHERE pharmacy_id = :pharmacy_ID_from_the_update_form;

-- delete a pharmacy
DELETE FROM pharmacy WHERE pharmacy_id = :pharmacy_ID_selected_from_browse_pharmacy_page;


-- medication_pharmacy entity

-- get all medication_pharmacy personal information to populate the medication_pharmacys dropdown table
SELECT * FROM medication_pharmacy;

-- get a single medication_pharmacy's data for the Update medication_pharmacy form
SELECT * FROM medication_pharmacy WHERE medication_id = medication_ID_selected_from_browse_medication_pharmacy_page AND pharmacy_id = :pharmacy_ID_selected_from_browse_medication_pharmacy_page;

-- add a new medication_pharmacy
INSERT INTO `medication_pharmacy`(medication_id,pharmacy_id) VALUES (:medication_idInput,:pharmacy_idInput,);

-- update a medication_pharmacy's data based on submission of the Update medication_pharmacy form 
UPDATE `medication_pharmacy` SET medication_id = :medication_idInput, medication_pharmacy_id = medication_pharmacy_idInput
WHERE medication_id = medication_ID_selected_from_browse_medication_pharmacy_page AND pharmacy_id = :pharmacy_ID_selected_from_browse_medication_pharmacy_page;

-- delete a medication_pharmacy
DELETE FROM medication_pharmacy WHERE medication_id = :medication_ID_selected_from_browse_medication_pharmacy_page AND pharmacy_id = :pharmacy_ID_selected_from_browse_medication_pharmacy_page;

-- diagnosis entity

-- get all diagnosis personal information to populate the diagnosis dropdown table
SELECT * FROM diagnosis;

-- get a single diagnosis's data for the Update diagnosis form
SELECT * FROM diagnosis WHERE diagnosis_id = :diagnosis_ID_selected_from_browse_diagnosis_page;

-- add a new diagnosis
INSERT INTO `diagnosis`(medication_id,patient_id,doctor_id,pharmacy_id,description,charge,diagnosis_date) VALUES (:medication_idInput,:patient_idInput,:doctor_idInput,:pharmacy_idInput,:descriptionInput,:chargeInput,:diagnosis_dateInput);

-- update a diagnosis's data based on submission of the Update diagnosis form 
UPDATE `diagnosis` SET medication_id = :medication_idInput, patient_id = :patient_idInput, doctor_id = :doctor_id, pharmacy_id = pharmacy_idInput, description = descriptionInput, charge = chargeInput, diagnosis_date = diagnosis_dateInput
WHERE diagnosis_id = :diagnosis_ID_from_the_update_form;

-- delete a diagnosis
DELETE FROM diagnosis WHERE diagnosis_id = :diagnosis_ID_selected_from_browse_diagnosis_page;




