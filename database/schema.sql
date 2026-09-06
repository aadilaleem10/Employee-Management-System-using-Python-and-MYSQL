-- =========================================================
-- Employee Management System - MySQL Database Setup Script
-- =========================================================
-- Run this file in MySQL to create the database, table,
-- and (optionally) load sample data that matches the demo
-- run shown in the notebook.
--
-- Usage (from a terminal):
--   mysql -u root -p < schema.sql
--
-- Or from inside the MySQL shell:
--   SOURCE schema.sql;
-- =========================================================

-- 1. Create the database
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- 2. Drop the table if it already exists (clean re-run)
DROP TABLE IF EXISTS employee;

-- 3. Create the employee table
CREATE TABLE employee (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    name     VARCHAR(100)  NOT NULL,
    position VARCHAR(100)  NOT NULL,
    salary   DECIMAL(10,2) NOT NULL,
    status   VARCHAR(20) NOT NULL DEFAULT 'ACTIVE'
);

-- 4. Seed sample data (matches the example records used in the notebook demo)
INSERT INTO employee (name, position, salary) VALUES
('Aadil',   'Manager',           70000.00),
('Afraz',   'Data Analyst',      40000.00),
('Rayaan',  'Receptionist',      30000.00),
('Kaushik', 'Electrician',       20000.00),
('Afnan',   'Accountant',        50000.00),
('Afzal',   'Employer',          60000.00),
('Ray',     'Engineer',          20000.00),
('Rahman',  'Python Programmer', 50000.00);

-- 5. Verify
SELECT * FROM employee ORDER BY id;
