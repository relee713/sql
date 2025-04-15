CREATE DATABASE klx;
USE klx;

DROP TABLE flights;
DROP TABLE terminals;
DROP TABLE airlines;

CREATE TABLE flights(
date VARCHAR(20), 
id CHAR(2), 
no_flights TINYINT,
PRIMARY KEY(date, id));

CREATE TABLE airlines(
id CHAR(2) PRIMARY KEY,
name VARCHAR(20),
terminal CHAR(1));

CREATE TABLE terminals(
terminal CHAR(1) PRIMARY KEY, 
gates TINYINT);

INSERT INTO flights(date, id, no_flights)
VALUES 
('11-Dec', 'UA', 34),
('11-Dec', 'NW', 17), 
('11-Dec', 'AA', 11),
('11-Dec', 'DL', 20), 
('11-Dec', 'JB', 6), 
('12-Dec', 'UA', 29), 
('12-Dec', 'DL', 20), 
('12-Dec', 'SW', 17);

INSERT INTO airlines(id, name, terminal)
VALUES
('UA', 'United', 'A'), 
('NW', 'Northwest', 'A'),
('AA', 'American', 'A'),
('DL', 'Delta', 'B'), 
('JB', 'Jet Blue', 'B'), 
('SW', 'Southwest', 'C');

INSERT INTO terminals(terminal, gates)
VALUES
('A', 20),
('B', 15), 
('C', 15);

SELECT a.id, a.name, a.terminal, t.gates
FROM airlines a
INNER JOIN terminals t
ON a.terminal = t.terminal;

SELECT a.terminal, a.id
FROM airlines a
JOIN terminals t
ON a.terminal = t.terminal 
JOIN flights f
ON a.id = f.id
WHERE no_flights = (SELECT MAX(no_flights) FROM flights);
