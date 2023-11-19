-- Drop schema if exists
DROP SCHEMA IF EXISTS hib3 CASCADE;
-- Create schema
CREATE SCHEMA hib3;

-- Use schema
SET search_path TO hib3;

-- Create companies table
CREATE TABLE companies (
                           company_id SERIAL PRIMARY KEY,
                           company_name VARCHAR(45) NOT NULL,
                           company_country VARCHAR(45) NOT NULL
);

-- Create cars table
CREATE TABLE cars (
                      car_id SERIAL PRIMARY KEY,
                      name VARCHAR(45) NOT NULL,
                      year INT NOT NULL,
                      distance INT,
                      fuel VARCHAR(45) NOT NULL DEFAULT 'Бензин',
                      fuel_consumption VARCHAR(45) NOT NULL,
                      price INT NOT NULL,
                      company_id INT NOT NULL,
                      FOREIGN KEY (company_id) REFERENCES companies(company_id) ON DELETE CASCADE
);

-- Create people table
CREATE TABLE people (
                        person_id SERIAL PRIMARY KEY,
                        surname VARCHAR(45) NOT NULL,
                        name VARCHAR(45) NOT NULL,
                        age INT NOT NULL,
                        phone VARCHAR(45) NOT NULL,
                        mail VARCHAR(45) NOT NULL
);

-- Create users table
CREATE TABLE users (
                       user_id SERIAL PRIMARY KEY,
                       login VARCHAR(45) NOT NULL,
                       password VARCHAR(45) NOT NULL,
                       role VARCHAR(45) NOT NULL DEFAULT 'User',
                       person_id INT,
                       CONSTRAINT fk_user_person FOREIGN KEY (person_id) REFERENCES people(person_id) ON DELETE CASCADE
);
