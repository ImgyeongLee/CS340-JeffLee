DROP TABLE IF EXISTS `medication_pharmacy`;
DROP TABLE IF EXISTS `patient`;
DROP TABLE IF EXISTS `medication`;
DROP TABLE IF EXISTS `pharmacy`;
DROP TABLE IF EXISTS `doctor`;
DROP TABLE IF EXISTS `diagnosis`;

CREATE TABLE patient (
    patient_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    patient_first_name varchar(255) NOT NULL,
	patient_last_name varchar(255) NOT NULL,
	patient_birth date NOT NULL,
	patient_address varchar(255) NOT NULL,
	patient_email varchar(255) NOT NULL,
	patient_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
CREATE TABLE pharmacy (
    pharmacy_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,

    pharmacy_name varchar(255) NOT NULL,
	pharmacy_address varchar(255) NOT NULL,
	pharmacy_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
CREATE TABLE medication (
    medication_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    medication_name varchar(255) NOT NULL,
	manufacturer varchar(255) NOT NULL
	
	) ENGINE=InnoDB;

CREATE TABLE `medication_pharmacy` (
	medication_pharmacy_id int AUTO_INCREMENT UNIQUE NOT NULL,
	medication_id int UNIQUE NOT NULL,
	pharmacy_id int UNIQUE NOT NULL,
	PRIMARY KEY (medication_id, pharmacy_id, medication_pharmacy_id),
	FOREIGN KEY(`medication_id`) REFERENCES `medication` (`medication_id`) ON DELETE CASCADE,
	FOREIGN KEY(`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE CASCADE
	) ENGINE=InnoDB;
	
CREATE TABLE doctor (
    doctor_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    doctor_first_name varchar(255) NOT NULL,
	doctor_last_name varchar(255) NOT NULL,
	doctor_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
CREATE TABLE diagnosis (
	diagnosis_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
	medication_id int,
	patient_id int,
	doctor_id int,
	pharmacy_id int,
	description text,
	charge int,
	diagnosis_date date,
	CONSTRAINT FOREIGN KEY (`medication_id`) REFERENCES `medication` (`medication_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`) ON DELETE SET NULL ON UPDATE CASCADE

) ENGINE=InnoDB;
	
DESCRIBE patient;
DESCRIBE medication;
DESCRIBE pharmacy;
DESCRIBE doctor;
DESCRIBE medication_pharmacy;
DESCRIBE diagnosis;

DELETE from patient;
ALTER TABLE patient AUTO_INCREMENT =1;

DELETE from medication;
ALTER TABLE medication AUTO_INCREMENT =1;

DELETE from doctor;
ALTER TABLE doctor AUTO_INCREMENT =1;

DELETE from pharmacy;
ALTER TABLE pharmacy AUTO_INCREMENT =1;

DELETE from diagnosis;
ALTER TABLE diagnosis AUTO_INCREMENT =1;

DELETE from medication_pharmacy;
ALTER TABLE medication_pharmacy AUTO_INCREMENT =1;

INSERT INTO `patient`(patient_first_name,patient_last_name,patient_birth,patient_address,patient_email,patient_contact) VALUES ('John','Cena','1969-4-20','Reno NV','jcena@gmail.com','contact1');

INSERT INTO `medication`(medication_name,manufacturer) VALUES ('Opium','LarryMeds'),('Marijuana','RiteAid');

INSERT INTO `doctor`(doctor_first_name,doctor_last_name,doctor_contact) VALUES ('John','Smith','111-555-2222');

INSERT INTO `pharmacy`(pharmacy_name,pharmacy_address,pharmacy_contact) VALUES ('Wallgreens','Portland','340-546-1345');

INSERT INTO `medication_pharmacy`(medication_id,pharmacy_id) VALUES ('2','2');

INSERT INTO `diagnosis`(medication_id,patient_id,doctor_id,pharmacy_id,description,charge,diagnosis_date) VALUES ('1','1','1','1','He is sickkk','50','2020-4-18');


SELECT * FROM patient;
SELECT * FROM medication;
SELECT * FROM doctor;
SELECT * FROM pharmacy;
SELECT * FROM medication_pharmacy;
SELECT * FROM diagnosis;


