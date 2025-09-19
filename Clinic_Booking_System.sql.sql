-- Clinic Booking System Database
-- Author: Girmay G.
-- Date: 19 Setember 2025


-- Create Database
CREATE DATABASE  clinic_booking_db;

USE clinic_booking_db;

-- Table: Patients

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(30) NOT NULL,
    dob DATE,
    gender ENUM('male','female','other'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Table: Doctors

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Table: Appointments

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_time DATETIME NOT NULL,
    duration_minutes INT DEFAULT 30,
    status ENUM('scheduled','completed','cancelled') DEFAULT 'scheduled',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY ux_patient_doctor_time (patient_id, doctor_id, appointment_time)
) ENGINE=InnoDB;

-- Table: Services

CREATE TABLE  services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB;

-- Table: Appointment_Services (Many-to-Many)

CREATE TABLE appointment_services (
    appointment_id INT NOT NULL,
    service_id INT NOT NULL,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
      ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(service_id)
      ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Table: Payments

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    method ENUM('cash','card','mobile') NOT NULL,
    status ENUM('paid','pending','failed') DEFAULT 'pending',
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
      ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Sample Data Inserts (Optional)


INSERT INTO patients (first_name, last_name, email, phone, dob, gender)
VALUES ('Sara', 'Abebe', 'sara.abebe@example.com', '+251911000111', '1995-06-15', 'female');

INSERT INTO doctors (first_name, last_name, specialty, email, phone)
VALUES ('John', 'Doe', 'Cardiology', 'johndoe@example.com', '+251922333444');

INSERT INTO services (name, description, price)
VALUES ('General Consultation', 'Routine health checkup', 300.00);

INSERT INTO appointments (patient_id, doctor_id, appointment_time, duration_minutes, status)
VALUES (1, 1, '2025-09-25 10:30:00', 30, 'scheduled');

INSERT INTO appointment_services (appointment_id, service_id) VALUES (1, 1);

INSERT INTO payments (appointment_id, amount, method, status)
VALUES (1, 300.00, 'cash', 'paid');
