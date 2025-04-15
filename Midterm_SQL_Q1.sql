DROP DATABASE health;
CREATE DATABASE health;
USE health;

CREATE TABLE patient(
PatientID VARCHAR(20) PRIMARY KEY NOT NULL, 
PatientLastName VARCHAR(20), 
PatientFirstName VARCHAR(20), 
DOB DATE);

INSERT INTO patient(PatientID, PatientLastName, PatientFirstName, DOB)
VALUES ('111', 'Lee', 'Rachael', '2001-10-07'), 
('222', 'Carter', 'Michael', '2002-09-30'), 
('333', 'Lee', 'Virginia', '2003-09-21');

CREATE TABLE insurance(
Company VARCHAR(50) NOT NULL, 
Amount int, 
PatientID VARCHAR(20), 
PRIMARY KEY(Company, PatientID),
FOREIGN KEY(PatientID) REFERENCES patient (PatientID));

INSERT INTO insurance(Company, Amount, PatientID)
VALUES ('Cigna', 200, '111'), ('Medicare', 100, '222');

CREATE TABLE doctor(
MDID VARCHAR(20) PRIMARY KEY NOT NULL, 
MDLastName VARCHAR(20), 
MDFirstName VARCHAR(20), 
MDSpecialty VARCHAR(20));

INSERT INTO doctor(MDID, MDFirstName, MDLastName, MDSpecialty)
VALUES ('1111', 'Andrew', 'Lee', 'Opthalmology'), 
('2222', 'Hilary', 'Beaver', 'Opthalmology'), 
('3333', 'Michael', 'Carter', 'Radiology');

CREATE TABLE treatment(
MDID VARCHAR(20) NOT NULL,
PatientID VARCHAR(20) NOT NULL,
MedCondition VARCHAR(50), 
PRIMARY KEY (MDID, PatientID),
FOREIGN KEY (MDID) REFERENCES doctor(MDID),
FOREIGN KEY (PatientID) REFERENCES patient(PatientID));

INSERT INTO treatment(PatientID, MDID, MedCondition)
VALUES ('111', '1111', 'Glaucoma'), 
('222', '2222', 'Cataracts'), 
('333', '3333', 'Leukemia');





