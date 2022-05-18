SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- drop diagnosis here to prevent error
DROP TABLE IF EXISTS `diagnosis`;

DROP TABLE IF EXISTS `patient`;
CREATE TABLE patient (
    patient_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    patient_first_name varchar(255) NOT NULL,
	patient_last_name varchar(255) NOT NULL,
	patient_birth date NOT NULL,
    patient_address varchar(255) NOT NULL,
	patient_email varchar(255) NOT NULL,
	patient_contact varchar(255) NOT NULL
	) ENGINE=InnoDB;
	
LOCK TABLES `patient` WRITE;
INSERT INTO `patient`(patient_first_name,patient_last_name,patient_birth,patient_address,patient_email,patient_contact) 
	VALUES 
		('John','Cena','1969-04-20','7292 SW Dictum Ave. San Antonio, MI 47096','jcena@gmail.com','503-888-4432'),
		('Larry','David','1981-06-23','3748 NW Jorge St. Austin, TX 28732','ldavid@gmail.com','222-345-6758'),
		('Sarah','Jackson','1942-07-13','2768 E Juan Rd. Orlando, FL 98394','sarahjack@hotmail.com','276-794-3586'),
		('Loraine','Zheng','1999-12-25','1235 S Hillsdale Ave. Dublin, CA 283945','lzhang@yahoo.com','232-435-5853');
UNLOCK TABLES;	

DROP TABLE IF EXISTS `medication`;
CREATE TABLE medication (
    medication_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    medication_name varchar(255) NOT NULL,
	manufacturer varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
LOCK TABLES `medication` WRITE;
INSERT INTO `medication`(medication_name,manufacturer) VALUES ('Adderall','Pfizer'),('Marijuana','Johnson & Johnson'),('Benadryl','AbbVie'),('Tylenol','Merck & Co.');
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE pharmacy (
    pharmacy_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,
    pharmacy_name varchar(255) NOT NULL,
	pharmacy_address varchar(255) NOT NULL,
	pharmacy_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
LOCK TABLES `pharmacy` WRITE;
INSERT INTO `pharmacy`(pharmacy_name,pharmacy_address,pharmacy_contact) 
	VALUES 
		('Wallgreens','2293 SE Jefferson St. Portland, OR 11224','334-233-4839'),
		('Fred Meyer Pharmacy','3354 SW Washington Ave. Corvallis, OR 19423','234-382-3938'),
		('Kroger','8362 E Lincoln Ave. Fremont, CA 53891','283-483-2948'),
		('Albertsons','9832 W Monroe St. Boise, ID 29332','102-304-1092');
UNLOCK TABLES;		

DROP TABLE IF EXISTS `medication_pharmacy`;
CREATE TABLE `medication_pharmacy` (
	medication_id int NOT NULL,
	pharmacy_id int NOT NULL,
	PRIMARY KEY (medication_id, pharmacy_id),
	CONSTRAINT FOREIGN KEY(`medication_id`) REFERENCES `medication` (`medication_id`) ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY(`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`)  ON DELETE CASCADE
	) ENGINE=InnoDB;

LOCK TABLES `medication_pharmacy` WRITE;
INSERT INTO `medication_pharmacy`(medication_id,pharmacy_id) VALUES ('1','3'),('1','2'),('4','2'),('3','2');
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE doctor (
    doctor_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    doctor_first_name varchar(255) NOT NULL,
	doctor_last_name varchar(255) NOT NULL,
	doctor_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
LOCK TABLES `doctor` WRITE;
INSERT INTO `doctor`(doctor_first_name,doctor_last_name,doctor_contact) 
	VALUES 
		('Jonathan','Kingsley','493-232-1023'),
		('Mary','Jane','420-666-6969'),
		('Dom','Torreto','192-394-1029'),
		('Jimmy','Fallon','492-293-4922');
UNLOCK TABLES;	
	
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
	
LOCK TABLES `diagnosis` WRITE;
INSERT INTO `diagnosis`(medication_id,patient_id,doctor_id,pharmacy_id,description,charge,diagnosis_date) 
	VALUES 
	('1','1','4','1','AIDS','5000','2020-04-18'),
	('1','2','3','2','Malaria','200','2020-05-19'),
	('3','3','2','4','Common Cold','800','2021-05-21'),
	('2','3','1','4','Smallpox','300','2022-03-30');
UNLOCK TABLES;	
