🏥 Clinic Booking System – MySQL Database
📌 Project Overview

This project implements a Clinic Booking System database using MySQL.
It is designed to manage patients, doctors, appointments, services, and payments with proper relational constraints.

The database ensures:

Well-structured tables with appropriate data types.

Constraints (PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, CHECK).

Relationships (One-to-One, One-to-Many, Many-to-Many).

Sample data inserts for testing.

⚙️ Features

👨‍⚕️ Manage doctors and their specialties.

🧑‍🤝‍🧑 Register patients with personal details.

📅 Book appointments between patients and doctors.

🧾 Attach services (consultation, lab test, etc.) to appointments.

💰 Record payments (cash, card, mobile) for services.

🗂️ Database Schema
Tables

patients – Stores patient details.

doctors – Stores doctor profiles and specialties.

appointments – Manages patient-doctor bookings.

services – Defines medical services offered.

appointment_services – Many-to-Many relationship between appointments and services.

payments – Tracks payments for appointments.

🔑 Relationships

One-to-Many:

A patient → many appointments.

A doctor → many appointments.

Many-to-Many:

Appointments ↔ Services (via appointment_services).

One-to-One:

Each appointment → one payment record (if paid).
