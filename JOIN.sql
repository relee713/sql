USE db;

-- # Create table_one (employees)
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);

-- # Create table_two (departments)
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- # Insert data into employees
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (1, 'Alice', 1), (2, 'Bob', 2), (3, 'Charlie', 1), (4, 'David', 3);

-- # Insert data into departments
INSERT INTO departments (department_id, department_name)
VALUES (1, 'HR'), (2, 'Finance'), (3, 'Engineering');

-- # INNER JOIN: Select all employees with their department names
SELECT employees.employee_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- # LEFT JOIN: Select all employees with department names (include employees without matching department)
SELECT employees.employee_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;

-- # RIGHT JOIN: Select all departments with employees (include departments without employees)
SELECT employees.employee_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;

-- # SELF JOIN: Select employees who work in the same department as another employee
SELECT e1.employee_name AS employee_1, e2.employee_name AS employee_2, e1.department_id
FROM employees e1
INNER JOIN employees e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id <> e2.employee_id;

-- # CROSS JOIN: Select all possible combinations of employees and departments
SELECT employees.employee_name, departments.department_name
FROM employees
CROSS JOIN departments;

-- # FULL OUTER JOIN using UNION of LEFT JOIN and RIGHT JOIN
SELECT employees.employee_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id
UNION
SELECT employees.employee_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;