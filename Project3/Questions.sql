/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [DSsalaries].[dbo].[ds_salaries]


/* What job has the most employees? */

SELECT 
job_title, 
COUNT(job_title) AS total
FROM [DSsalaries].[dbo].[ds_salaries]
GROUP BY job_title
ORDER BY total desc

/* What is the total number of employees for each employment type? */

SELECT 
employment_type,
COUNT(employment_type) AS total
FROM DSsalaries..ds_salaries
GROUP BY employment_type
ORDER BY total desc

/* What country has the most employees per company location? */

SELECT 
company_location,
COUNT(company_location) AS total
FROM DSsalaries..ds_salaries
GROUP BY company_location
ORDER BY Total DESC

/* What is the average salary per experience level? */

SELECT 
experience_level,
COUNT(experience_level) AS count_of_employees,
CAST(AVG(salary_in_usd) AS decimal(18,2)) AS avg_salary
FROM DSsalaries..ds_salaries
GROUP BY experience_level
ORDER BY avg_salary DESC

/* Did remote working increase from 2020 to 2022? */

SELECT 
work_year,
remote_ratio,
COUNT(remote_ratio) as count_of_remote_ratio
FROM DSsalaries..ds_salaries
GROUP BY work_year, remote_ratio
ORDER BY work_year ASC

/* What company size occurs the most? */

SELECT 
company_size,
COUNT(company_size) as count_of_company_size
FROM DSsalaries..ds_salaries
GROUP BY company_size
ORDER BY count_of_company_size desc

/* What is the percentage of jobs that work remote? */

SELECT 
remote_ratio,
COUNT(remote_ratio) as count_of_remote_ratio,
ROUND(CAST(COUNT(remote_ratio) as float)/CAST((SELECT SUM(count_of_remote_ratio) AS total 
FROM 
(SELECT remote_ratio,COUNT(remote_ratio) as count_of_remote_ratio
FROM DSsalaries..ds_salaries 
GROUP BY remote_ratio) count_per_remote_ratio) as float),2) * 100 as percentage_total
FROM DSsalaries..ds_salaries
GROUP BY remote_ratio

/* What is the average salary per country? */

SELECT 
company_location,
CAST(AVG(salary_in_usd) as decimal(18,2)) AS avg_salary
FROM DSsalaries..ds_salaries
GROUP BY company_location
ORDER BY avg_salary desc

