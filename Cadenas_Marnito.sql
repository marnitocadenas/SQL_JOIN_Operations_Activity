CREATE DATABASE Cadenas_Marnito;


USE Cadenas_Marnito;


CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    city VARCHAR(50),
    contact_number VARCHAR(20)
);


CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_name VARCHAR(100),
    appointment_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);


INSERT INTO Patients VALUES
(101, 'Maria Santos', 'Cebu', '09123456781'),
(102, 'Juan Dela Cruz', 'Bohol', '09123456782'),
(103, 'Ana Reyes', 'Cebu', '09123456783'),
(104, 'Mark Lopez', 'Dumaguete', '09123456784'),
(105, 'Carla Gomez', 'Bohol', '09123456785');


INSERT INTO Appointments VALUES
(201, 101, 'Dr. Garcia', '2025-03-10', 'Completed'),
(202, 102, 'Dr. Ramos', '2025-03-11', 'Scheduled'),
(203, 101, 'Dr. Cruz', '2025-03-15', 'Scheduled'),
(204, 103, 'Dr. Garcia', '2025-03-18', 'Cancelled');


SELECT p.patient_name, a.doctor_name
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id;


SELECT p.patient_name, a.doctor_name, a.appointment_date
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
WHERE p.city = 'Cebu';


SELECT p.patient_name, a.doctor_name, a.appointment_date
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id
WHERE a.doctor_name = 'Dr. Garcia';


SELECT p.patient_name, a.doctor_name, a.appointment_date
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id = a.patient_id;


SELECT p.patient_name, a.doctor_name, a.appointment_date
FROM Patients p
RIGHT JOIN Appointments a
ON p.patient_id = a.patient_id;