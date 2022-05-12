DROP TABLE IF EXISTS `Patient`;
CREATE TABLE Patient (
    patient_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    patient_first_name varchar(255) NOT NULL,
	patient_last_name varchar(255) NOT NULL,
	patient_birth date NOT NULL,
	patient_email varchar(255) NOT NULL,
	patient_contact varchar(255) NOT NULL,
	patient_address varchar(255) NOT NULL
	) ENGINE=InnoDB;
	
LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient`(patient_first_name,patient_last_name,patient_birth,patient_email,patient_contact,patient_address) VALUES ('John','Cena','1969-4-20','jcena@gmail.com','503-888-4432','San Antonio, MI'),('Larry','David','1981-6-23','ldavid@gmail.com','222-345-6758','Austin, TX');
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;	

DROP TABLE IF EXISTS `Medication`;
CREATE TABLE Medication (
    medication_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    medication_name varchar(255) NOT NULL,
	manufacturer varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
LOCK TABLES `Medication` WRITE;
/*!40000 ALTER TABLE `Medication` DISABLE KEYS */;
INSERT INTO `Medication`(medication_name,manufacturer) VALUES ('Opium','LarryMeds'),('Marijuana','RiteAid');
/*!40000 ALTER TABLE `Medication` ENABLE KEYS */;
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `Pharmacy`;
CREATE TABLE Pharmacy (
    pharmacy_id int AUTO_INCREMENT NOT NULL PRIMARY KEY,

    pharmacy_name varchar(255) NOT NULL,
	pharmacy_address varchar(255) NOT NULL,
	pharmacy_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
LOCK TABLES `Pharmacy` WRITE;
/*!40000 ALTER TABLE `Pharmacy` DISABLE KEYS */;
INSERT INTO `Pharmacy`(pharmacy_name,pharmacy_address,pharmacy_contact) VALUES ('Wallgreens','Portland, OR','334-233-4839'),('Fred Meyer Pharmacy','Corvallis, OR','234-382-3938');
/*!40000 ALTER TABLE `Pharmacy` ENABLE KEYS */;
UNLOCK TABLES;		

DROP TABLE IF EXISTS `medication_pharmacy`;
CREATE TABLE `medication_pharmacy` (
	medication_pharmacy_id int AUTO_INCREMENT UNIQUE NOT NULL,
	medication_id int UNIQUE NOT NULL,
	pharmacy_id int UNIQUE NOT NULL,
	PRIMARY KEY (medication_id, pharmacy_id,medication_pharmacy_id),
	FOREIGN KEY(`medication_id`) REFERENCES `Medication` (`medication_id`) ON DELETE CASCADE,
	FOREIGN KEY(`pharmacy_id`) REFERENCES `Pharmacy` (`pharmacy_id`) ON DELETE CASCADE
	) ENGINE=InnoDB;

LOCK TABLES `medication_pharmacy` WRITE;
/*!40000 ALTER TABLE `medication_pharmacy` DISABLE KEYS */;
INSERT INTO `medication_pharmacy`(medication_id,pharmacy_id) VALUES ('1','1');
/*!40000 ALTER TABLE `medication_pharmacy` ENABLE KEYS */;
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `Doctor`;
CREATE TABLE Doctor (
    doctor_id int AUTO_INCREMENT UNIQUE NOT NULL PRIMARY KEY,
    doctor_name varchar(255) NOT NULL,
	doctor_contact varchar(255) NOT NULL
	
	) ENGINE=InnoDB;
	
LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor`(doctor_name,doctor_contact) VALUES ('Dr. Jonathan Kingsley','493-232-1023'),('Dr. Mary Jane','420-666-6969');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;	
	
DROP TABLE IF EXISTS `diagnosis`;
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
	
LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis`(medication_id,patient_id,doctor_id,pharmacy_id,description,charge,diagnosis_date) VALUES ('1','1','1','1','AIDS','5000','2020-4-18'),('2','2','2','2','Malaria','200','2020-5-19');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;	

