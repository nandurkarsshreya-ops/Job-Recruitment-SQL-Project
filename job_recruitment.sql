-- Job Recruitment Management System Full SQL

-- 1️⃣ Create Database
CREATE DATABASE IF NOT EXISTS recruitment_db; 
USE recruitment_db;

-- 2️⃣ Create Tables
CREATE TABLE candidates (
    candidate_id INT PRIMARY KEY, 
    name VARCHAR(50), 
    email VARCHAR(50), 
    phone VARCHAR(15), 
    skills VARCHAR(100), 
    experience INT
);

CREATE TABLE companies (
    company_id INT PRIMARY KEY, 
    company_name VARCHAR(50), 
    location VARCHAR(50)
);

CREATE TABLE jobs (
    job_id INT PRIMARY KEY, 
    company_id INT, 
    job_role VARCHAR(50), 
    salary INT, 
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE applications (
    application_id INT PRIMARY KEY, 
    candidate_id INT, 
    job_id INT, 
    status VARCHAR(20), 
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id), 
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

CREATE TABLE interviews (
    interview_id INT PRIMARY KEY, 
    application_id INT, 
    interview_date DATE, 
    result VARCHAR(20), 
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

-- 3️⃣ Insert Sample Data
INSERT INTO candidates VALUES 
(1,'Rahul Sharma','rahul@gmail.com','9876543210','Python, SQL',1),
(2,'Sneha Patil','sneha@gmail.com','9876543211','Java, SQL',2),
(3,'Amit Verma','amit@gmail.com','9876543212','C++, SQL',3);

INSERT INTO companies VALUES 
(1,'TCS','Mumbai'),
(2,'Infosys','Pune');

INSERT INTO jobs VALUES 
(1,1,'Software Engineer',400000),
(2,2,'Data Analyst',350000);

INSERT INTO applications VALUES 
(1,1,1,'Applied'),
(2,2,2,'Applied'),
(3,3,1,'Applied');

INSERT INTO interviews VALUES 
(1,1,'2026-03-28','Selected'),
(2,2,'2026-03-29','Rejected'),
(3,3,'2026-03-30','Selected');

-- 4️⃣ Example Queries

-- Candidates and their applied jobs
SELECT c.name, j.job_role, a.status 
FROM candidates c 
JOIN applications a ON c.candidate_id=a.candidate_id 
JOIN jobs j ON a.job_id=j.job_id;

-- Top companies by job postings
SELECT company_name, COUNT(job_id) AS total_jobs 
FROM companies co 
JOIN jobs j ON co.company_id=j.company_id 
GROUP BY company_name;

-- Selected candidates
SELECT c.name, i.result, j.job_role 
FROM candidates c 
JOIN applications a ON c.candidate_id=a.candidate_id 
JOIN interviews i ON a.application_id=i.application_id 
JOIN jobs j ON a.job_id=j.job_id 
WHERE i.result='Selected';

-- Candidates with Python skill
SELECT name, skills 
FROM candidates 
WHERE skills LIKE '%Python%';

-- Applications per job
SELECT j.job_role, COUNT(a.application_id) AS total_applications 
FROM jobs j 
JOIN applications a ON j.job_id=a.job_id 
GROUP BY j.job_role;

-- 5️⃣ Optional: Create VIEW
CREATE VIEW selected_candidates AS 
SELECT c.name, j.job_role, i.result 
FROM candidates c 
JOIN applications a ON c.candidate_id=a.candidate_id 
JOIN interviews i ON a.application_id=i.application_id 
JOIN jobs j ON a.job_id=j.job_id 
WHERE i.result='Selected';

-- 6️⃣ Optional: Create TRIGGER
CREATE TRIGGER update_status_after_interview 
AFTER INSERT ON interviews 
FOR EACH ROW 
UPDATE applications 
SET status=NEW.result 
WHERE application_id=NEW.application_id;