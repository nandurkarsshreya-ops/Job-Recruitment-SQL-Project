//SELECT, JOIN, GROUP BY COMMAND

--Shows all candidates and the jobs they applied for
SELECT c.name, j.job_role, a.status FROM candidates c JOIN applications a ON c.candidate_id=a.candidate_id JOIN jobs j ON a.job_id=j.job_id;

--Counts how many jobs each company has posted
 SELECT company_name, COUNT(job_id) AS total_jobs FROM companies co JOIN jobs j ON co.company_id=j.company_id GROUP BY company_name;


-- Show candidates who were selected for a job along with job role
  SELECT c.name, i.result, j.job_role FROM candidates c JOIN applications a ON c.candidate_id=a.candidate_id JOIN interviews i ON a.application_id=i.application_id JOIN jobs j ON a.job_id=j.job_id WHERE i.result='Selected';

-- List all candidates who have Python skill
   SELECT name, skills FROM candidates WHERE skills LIKE '%Python%';

   -- Count total applications for each job role
 SELECT j.job_role, COUNT(a.application_id) AS total_applications FROM jobs j JOIN applications a ON j.job_id=a.job_id GROUP BY j.job_role;

-- Duplicate of previous query, can be removed
 SELECT j.job_role, COUNT(a.application_id) AS total_applications FROM jobs j JOIN applications a ON j.job_id=a.job_id GROUP BY j.job_role;
