-- get all Planet IDs and Names to populate the Patients dropdown table
SELECT * FROM patient;

-- get a single patient's data for the Update Patient form
SELECT * FROM patient WHERE patient_id = :patient_ID_selected_from_browse_patient_page;

-- add a new patient
INSERT INTO `patient`(patient_first_name,patient_last_name,patient_birth,patient_address,patient_email,patient_contact) VALUES (:patient_first_nameInput,:patient_last_nameInput,:patient_birthInput,:patient_addressInput,:patient_emailInput,:patient_contactInput);

-- update a patient's data based on submission of the Update patient form 
UPDATE `patient` SET patient_first_name = :patient_first_name_Input, patient_last_name= :patient_last_nameInput, patient_birth = :patient_birthInput, patient_address = :patient_addressInput, patient_email = patient_emailInput, patient_contact = patient_contactInput
WHERE patient_id = :patient_ID_from_the_update_form


-- delete a patient
DELETE FROM patient WHERE id = :patient_ID_selected_from_browse_patient_page
