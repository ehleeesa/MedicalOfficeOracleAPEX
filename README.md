As part of this project, I used Oracle APEX to create an application for managing a medical office.

The Homepage contains buttons that redirect the application to each respective page.

<img width="1653" height="810" alt="cabinetmedicall" src="https://github.com/user-attachments/assets/e4fb5d5d-d2d8-4a30-898a-f2c423f71d4b" />


A database was created with the following tables:

<img width="1622" height="1210" alt="cabinetmedicall1" src="https://github.com/user-attachments/assets/2c7e8193-785a-4c5f-ac95-a08bf5e5c428" />

The "Vizualizare medici" (EN: Doctors view) page contains all the doctors from the database and is a Classic Report page. On this page, we can see all the details about the doctors in the medical office.

<img width="1650" height="900" alt="cabinetmedicall2" src="https://github.com/user-attachments/assets/d7408ee0-f0dc-4d42-9afe-5ff074ccdc59" />


The "Pacienții unui medic" (EN: Patients view) page is a Master Detail page, where the master table is represented by the Doctors table, and the detail table is represented by the Appointments table, thus obtaining the appointments for the selected doctor.

<img width="1658" height="910" alt="aloo" src="https://github.com/user-attachments/assets/91c87c7f-5d1e-49fa-b3db-f440907845ad" />

On this "Vizualizare programări" (EN: Appointments view) page for a patient, we have a Page Item CNP, which takes the entered CNP and returns the appointments for the patient with that CNP.

<img width="1658" height="904" alt="LOO1" src="https://github.com/user-attachments/assets/e3810140-7c68-4970-b296-c804734bbdcc" />

For this purpose, I used the following SQL query: SELECT p.codPro, p.dataP, p.nume, p.medID, p.cabinet FROM cbProgramare p JOIN cbReteta r ON p.cnp = r.cnp WHERE r.cnp LIKE :P_CNP;

where P1_CNP is the Page Item CNP, as the CNP is the primary key in the patients table.

The "Raport medici" (EN: Doctors report) page:

<img width="1653" height="905" alt="RAPORTMEDICI" src="https://github.com/user-attachments/assets/bb119ed1-e5e4-41e6-bbb9-68c3fbd2f273" />

To count the appointments each doctor has, I used the following query: SELECT m.nume AS doctor_name, s.denumire AS specialty, g.denumire AS degree, COUNT(p.codPro) AS appointment_count FROM cbMedic m INNER JOIN cbProgramare p ON m.medID = p.medID INNER JOIN cbSpecialitate s ON m.codSpec = s.codSpec INNER JOIN cbGrad g ON m.codGrad = g.codGrad GROUP BY m.nume, s.denumire, g.denumire;

This query retrieves the doctor's name, their specialty, their degree, and the number of appointments they have.

This page is the "Adăugare programare" (EN: Add appointment) page, where the CNP and Doctor ID, being primary keys in other tables, should ideally be auto-completed:

<img width="1660" height="892" alt="ADAUGAREPROG" src="https://github.com/user-attachments/assets/9f57e272-c2cb-4015-9703-9a5e9a302a2e" />

The "Raport specializări" (EN: Statistics report for specialties) page:

<img width="1661" height="891" alt="RAPORTSPECIALIZ" src="https://github.com/user-attachments/assets/0f5bec1e-f5e8-48ce-a9d2-8746f9d14a86" />

For reporting the statistics of the specialties, I used the following query:

SELECT sp.codSpec, sp.denumire AS denumire_specialitate, COUNT(DISTINCT m.medID) AS numar_total_medici, COUNT(DISTINCT pr.cnp) AS numar_total_pacienti FROM cbSpecialitate sp LEFT JOIN cbMedic m ON sp.codSpec = m.codSpec LEFT JOIN cbProgramare pr ON m.medID = pr.medID GROUP BY sp.codSpec, sp.denumire;

to count the total number of patients and the total number of doctors by specialties.

In the context of developing the application for the medical office, using a database schema had several essential roles: organizing data, isolating and securing data, avoiding naming conflicts, facilitating management and maintenance, and improving performance.

<img width="1656" height="568" alt="DEVELOPING" src="https://github.com/user-attachments/assets/18f97fb2-fd05-4233-8d47-e98ad9bedfb8" />

The following project requirements have been met:

The implementation in APEX of the database tables, along with the necessary constraints to maintain database integrity (primary keys, foreign keys, value constraints);
A text file named CabinetSchema.sql was created, containing the necessary SQL DDL instructions;
Data has been added to the database tables using SQL INSERT statements: 8 doctors, 30 appointments, 40 prescriptions, 4 specialties, and 3 grades (resident, specialist, primary);
A text file named CabinetDate.sql was created, containing the necessary SQL DML instructions.
