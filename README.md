# Job Recruitment Management System (SQL Project)

## Overview
This project is a relational database system built with **MySQL** to manage the job recruitment process. It tracks **candidates, companies, job postings, applications, and interviews**. The system demonstrates database design, normalization, and SQL query skills.

## Features
- Manage candidates and their skills
- Manage companies and job postings
- Track candidate applications and interview results
- Analyze selected candidates, job applications, and top companies
- Demonstrates SQL JOINs, GROUP BY, views, and triggers

## Database Structure
**Tables:**
1. `candidates` – Stores candidate information and skills  
2. `companies` – Stores company details  
3. `jobs` – Stores job postings for each company  
4. `applications` – Tracks candidate applications for jobs  
5. `interviews` – Tracks interview schedules and results  

**Relationships:**  
- Each job belongs to a company  
- Each application links a candidate to a job  
- Each interview links to an application  

*(Include your ER diagram here as `ER_diagram.png` for clarity)*

## How to Run
1. Open **MySQL Command Line Client**.  
2. Run the SQL file:  
   ```sql
   source job_recruitment.sql;
