DROP DATABASE db;
-- # Create a new database
CREATE DATABASE db;
USE db;

-- # Create a table with a primary key and one attribute
CREATE TABLE table_one (
    primary_key VARCHAR(10) PRIMARY KEY,
    attribute_one VARCHAR(10), 
    foreign_key VARCHAR(10)
);

-- # Create another table with a primary key to reference in table_one
CREATE TABLE table_two (
    foreign_key VARCHAR(10) PRIMARY KEY
);

-- # Insert data into table_one
INSERT INTO table_one (primary_key, attribute_one)
VALUES ('key1', 'value1'), ('key2', 'value2');

-- # Update data in a table
UPDATE table_one
SET attribute_one = 'new_value'
WHERE primary_key = 'key1';

-- # Delete data from a table
DELETE FROM table_one
WHERE primary_key = 'key2';

-- # Add a foreign key constraint to link table_two to table_one
ALTER TABLE table_one
ADD FOREIGN KEY (foreign_key) REFERENCES table_two(foreign_key);
