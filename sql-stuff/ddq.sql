SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

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
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient`(patient_first_name,patient_last_name,patient_birth,patient_address,patient_email,patient_contact) VALUES ('John','Cena','1969-4-20','7292 SW Dictum Av. San Antonio MI 47096','jcena@gmail.com','503-888-4432'),('Larry','David','1981-6-23','3748 NW Jorge St. Austin TX 28732','ldavid@gmail.com','222-345-6758');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;	

DROP TABLE IF EXISTS `medication`;
CREATE TABLE medication (
    medication_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    medication_name varchar(255) NOT NULL,
	manufacturer varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication`(medication_name,manufacturer) VALUES ('Opium','LarryMeds'),('Marijuana','RiteAid');
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE pharmacy (
    pharmacy_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,

    pharmacy_name varchar(255) NOT NULL,
	pharmacy_address varchar(255) NOT NULL,
	pharmacy_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy`(pharmacy_name,pharmacy_address,pharmacy_contact) VALUES ('Wallgreens','2293 SE Jefferson St. Portland, OR','334-233-4839'),('Fred Meyer Pharmacy','3354 SW Washington Ave. Corvallis','234-382-3938');
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;		

DROP TABLE IF EXISTS `medication_pharmacy`;
CREATE TABLE `medication_pharmacy` (
	medication_pharmacy_id int AUTO_INCREMENT UNIQUE NOT NULL,
	medication_id int UNIQUE NOT NULL,
	pharmacy_id int UNIQUE NOT NULL,
	PRIMARY KEY (medication_id, pharmacy_id,medication_pharmacy_id),
	CONSTRAINT FOREIGN KEY(`medication_id`) REFERENCES `medication` (`medication_id`) ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY(`pharmacy_id`) REFERENCES `pharmacy` (`pharmacy_id`)  ON DELETE CASCADE
	) ENGINE=InnoDB;

LOCK TABLES `medication_pharmacy` WRITE;
/*!40000 ALTER TABLE `medication_pharmacy` DISABLE KEYS */;
INSERT INTO `medication_pharmacy`(medication_id,pharmacy_id) VALUES ('1','1'),('2','2');
/*!40000 ALTER TABLE `medication_pharmacy` ENABLE KEYS */;
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE doctor (
    doctor_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    doctor_first_name varchar(255) NOT NULL,
	doctor_last_name varchar(255) NOT NULL,
	doctor_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor`(doctor_first_name,doctor_last_name,doctor_contact) VALUES ('Jonathan','Kingsley','493-232-1023'),('Mary','Jane','420-666-6969');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `diagnosis`;
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
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis`(medication_id,patient_id,doctor_id,pharmacy_id,description,charge,diagnosis_date) VALUES ('1','1','1','1','AIDS','5000','2020-4-18'),('2','2','2','2','Malaria','200','2020-5-19');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;	

