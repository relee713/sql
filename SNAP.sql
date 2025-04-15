DROP DATABASE SNAP;
CREATE DATABASE SNAP;
USE SNAP;
-- Location Dimension Table
CREATE TABLE Location (
    Location_Key INT PRIMARY KEY,
    County VARCHAR(100),
    Region VARCHAR(100),
    FIPS VARCHAR(10)
);

-- Households Dimension Table
CREATE TABLE Households (
    Household_Key INT PRIMARY KEY,
    Households_Total INT,
    Households_PA INT,
    Households_NPA INT,
    Persons_Total INT,
    Persons_PA INT,
    Persons_NPA INT
);

-- Calendar Dimension Table
CREATE TABLE Calendar (
    CalendarKey DATE PRIMARY KEY,
    Day INT,
    Week INT,
    Month INT,
    Quarter INT,
    Year INT
);

-- Issuance Dimension Table
CREATE TABLE Issuance (
    Issuance_Key INT PRIMARY KEY,
    Issuance_Total INT,
    Issuance_PA INT,
    Issuance_NPA INT
);

-- Eligibility Dimension Table
CREATE TABLE Eligibility (
    Eligibility_Key INT PRIMARY KEY,
    Total_Eligible INT,
    Total_Rate DECIMAL(5, 2),
    Total_Ranking INT,
    Working_Poor_Eligible INT,
    Working_Poor_Rate DECIMAL(5, 2),
    Working_Poor_Ranking INT
);

-- SNAP Fact Table
CREATE TABLE SNAP_Fact (
    Location_Key INT,
    Household_Key INT,
    CalendarKey DATE,
    Issuance_Key INT,
    Eligibility_Key INT,
    Monthly_Household_SNAP INT,
    Monthly_Persons_SNAP INT,
    PRIMARY KEY (Location_Key, Household_Key, CalendarKey, Issuance_Key, Eligibility_Key),
    FOREIGN KEY (Location_Key) REFERENCES Location(Location_Key),
    FOREIGN KEY (Household_Key) REFERENCES Households(Household_Key),
    FOREIGN KEY (CalendarKey) REFERENCES Calendar(CalendarKey),
    FOREIGN KEY (Issuance_Key) REFERENCES Issuance(Issuance_Key),
    FOREIGN KEY (Eligibility_Key) REFERENCES Eligibility(Eligibility_Key)
);
