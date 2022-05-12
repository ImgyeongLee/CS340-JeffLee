DROP TABLE IF EXISTS `medication_pharmacy`;
DROP TABLE IF EXISTS `Patient`;
DROP TABLE IF EXISTS `Medication`;
DROP TABLE IF EXISTS `Pharmacy`;
DROP TABLE IF EXISTS `Doctor`;
DROP TABLE IF EXISTS `diagnosis`;

CREATE TABLE Patient (
    patient_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    patient_first_name varchar(255) NOT NULL,
	patient_last_name varchar(255) NOT NULL,
	patient_birth date NOT NULL,
	patient_address varchar(255) NOT NULL,
	patient_email varchar(255) NOT NULL,
	patient_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
CREATE TABLE Pharmacy (
    pharmacy_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,

    pharmacy_name varchar(255) NOT NULL,
	pharmacy_address varchar(255) NOT NULL,
	pharmacy_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
CREATE TABLE Medication (
    medication_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    medication_name varchar(255) NOT NULL,
	manufacturer varchar(255) NOT NULL
	
	) ENGINE=InnoDB;

CREATE TABLE `medication_pharmacy` (
	medication_pharmacy_id int AUTO_INCREMENT UNIQUE NOT NULL,
	medication_id int UNIQUE NOT NULL,
	pharmacy_id int UNIQUE NOT NULL,
	PRIMARY KEY (medication_id, pharmacy_id,medication_pharmacy_id),
	FOREIGN KEY(`medication_id`) REFERENCES `Medication` (`medication_id`) ON DELETE CASCADE,
	FOREIGN KEY(`pharmacy_id`) REFERENCES `Pharmacy` (`pharmacy_id`) ON DELETE CASCADE
	) ENGINE=InnoDB;
	
CREATE TABLE Doctor (
    doctor_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    doctor_name varchar(255) NOT NULL,
	doctor_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
CREATE TABLE diagnosis (
	diagnosis_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
	medication_id int,
	patient_id int,
	doctor_id int,
	pharmacy_id int,
	description varchar(255),
	charge int,
	diagnosis_date date,
	CONSTRAINT FOREIGN KEY (`medication_id`) REFERENCES `Medication` (`medication_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (`patient_id`) REFERENCES `Patient` (`patient_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (`doctor_id`) REFERENCES `Doctor` (`doctor_id`) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FOREIGN KEY (`pharmacy_id`) REFERENCES `Pharmacy` (`pharmacy_id`) ON DELETE SET NULL ON UPDATE CASCADE

) ENGINE=InnoDB;
	
DESCRIBE Patient;
DESCRIBE Medication;
DESCRIBE Pharmacy;
DESCRIBE Doctor;
DESCRIBE medication_pharmacy;
DESCRIBE diagnosis;

DELETE from Patient;
ALTER TABLE Patient AUTO_INCREMENT =1;

DELETE from Medication;
ALTER TABLE Medication AUTO_INCREMENT =1;

DELETE from Doctor;
ALTER TABLE Doctor AUTO_INCREMENT =1;

DELETE from Pharmacy;
ALTER TABLE Pharmacy AUTO_INCREMENT =1;

DELETE from diagnosis;
ALTER TABLE diagnosis AUTO_INCREMENT =1;

DELETE from medication_pharmacy;
ALTER TABLE medication_pharmacy AUTO_INCREMENT =1;

INSERT INTO `Patient`(patient_first_name,patient_last_name,patient_birth,patient_address,patient_email,patient_contact) VALUES ('John','Cena','1969-4-20','Reno NV','jcena@gmail.com','contact1');

INSERT INTO `Medication`(medication_name,manufacturer) VALUES ('Opium','LarryMeds'),('Marijuana','RiteAid');

INSERT INTO `Doctor`(doctor_name,doctor_contact) VALUES ('Drsssssss','Kingsleys');

INSERT INTO `Pharmacy`(pharmacy_name,pharmacy_address,pharmacy_contact) VALUES ('Wallgreens','Portland','pharmacyline');

INSERT INTO `medication_pharmacy`(medication_id,pharmacy_id) VALUES ('1','1');

INSERT INTO `diagnosis`(medication_id,patient_id,doctor_id,pharmacy_id,description,charge,diagnosis_date) VALUES ('1','1','1','1','He is sick','50','2020-4-18');


SELECT * FROM Patient;
SELECT * FROM Medication;
SELECT * FROM Doctor;
SELECT * FROM Pharmacy;
SELECT * FROM medication_pharmacy;
SELECT * FROM diagnosis;


