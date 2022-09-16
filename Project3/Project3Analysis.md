First, I went into excel and replaced every abbreviation within the employment_type column, with the according words

![FindReplace](https://user-images.githubusercontent.com/112139192/190535867-9139507b-6725-48e3-a5bc-35eaada83701.PNG)
![FindReplace(fixed)](https://user-images.githubusercontent.com/112139192/190535871-3d25dc01-f374-47b3-a84f-c161c8ab0a8b.PNG)

Then replaced every abbrevation within the company_size column, with the according words

![Findreplacecompany](https://user-images.githubusercontent.com/112139192/190536163-3352ee46-d440-4a22-bbaf-d3eba786e554.PNG)
![Findreplacecompany(fixed)](https://user-images.githubusercontent.com/112139192/190536175-10506c01-219b-48f6-a5d2-9b5bb740362f.PNG)
---

## 1. What job has the most employees?

```SQL
SELECT 
job_title, 
COUNT(job_title) AS total
FROM [DSsalaries].[dbo].[ds_salaries]
GROUP BY job_title
ORDER BY total desc
```
![Q1](https://user-images.githubusercontent.com/112139192/190536417-42b30f06-b55f-46ce-b434-fa83be07cd64.PNG)

![Q1(chart)](https://user-images.githubusercontent.com/112139192/190536536-d943b995-ab34-40aa-bf85-9a26ca436b74.PNG)

* Data scientist is leading with 143 employees followed by Data engineer with 132 and Data analyist with 97

### Solution

* Projected job_title column from the ds_salaries table
* Used the  ```COUNT``` function to find the total number of employees for the job_title column
* ```GROUP BY```  job_title column to find the total per job title
* ```ORDER BY``` total alias in descending order 

## 2. What is the total number of employees for each employment type?

```SQL
SELECT 
employment_type,
COUNT(employment_type) AS total
FROM DSsalaries..ds_salaries
GROUP BY employment_type
ORDER BY total desc
```
![Q2](https://user-images.githubusercontent.com/112139192/190537280-d6ba67eb-2192-4a30-9d7a-c8f5e4f29cd2.PNG)

![Q2(chart)](https://user-images.githubusercontent.com/112139192/190537528-95312dbf-4efe-470e-9ba1-4b5630e71a5c.PNG)

* Full-Time is leading with the most employees at 588
* Freelance is the lowest at 4

### Solution

* Projected employment_type column from the ds_salaries table
* Used ```COUNT``` function to find total number of employees for employment_type with an alias as total
* ```GROUP BY``` employement_type column to find how many employees there are per employment type
* ```ORDER BY``` total alias in descending order

## 3. What country has the most employees per company location?

```SQL
SELECT 
company_location,
COUNT(company_location) AS total
FROM DSsalaries..ds_salaries
GROUP BY company_location
ORDER BY Total DESC
```
![Q3](https://user-images.githubusercontent.com/112139192/190538110-dda29c36-ed97-4fd3-aa82-f17931dfedb9.PNG)

![Q3(chart)](https://user-images.githubusercontent.com/112139192/190538667-0f50422c-6419-4139-923f-dcfa69befd67.PNG)

* United States is leading with 355, Great Britain with 47 and Canada with 30

### Solution

* Projected company_location column from the ds_salaries table
* Used ```COUNT``` fucntion to find total number of employees from the company_location column with an alias as total
* ```GROUP BY``` company_location column to find how many employees there are per company_location
* ```ORDER BY``` total alias in descending order

## 4. What is the average salary per experience level?

```SQL
SELECT 
experience_level,
COUNT(experience_level) AS count_of_employees,
CAST(AVG(salary_in_usd) AS decimal(18,2)) AS avg_salary
FROM DSsalaries..ds_salaries
GROUP BY experience_level
ORDER BY avg_salary DESC
```
![Q4](https://user-images.githubusercontent.com/112139192/190539261-359adf19-a880-41e9-b99f-f90bd44bf02a.PNG)

![Q4(chart)](https://user-images.githubusercontent.com/112139192/190539424-22810e6e-553d-425c-8e81-190545d2f562.PNG)

* Executive-level gets paid the most on average at almost $200,000
* Entry-level gets paid the least on average at roughly $62,000
* Senior-level gets paid of average at about $140,000 and has the most employees in that position but gets paid less than Executive-level by about $60,000

### Solution

* Projected experience_level column from the ds_salaries table
* ```COUNT``` function on experience_level column to find the total number of employees with an alias as count_of_employees
* Found the average salary using the ```AVG``` function on salary_in_usd column then used ```CAST``` function to convert the salary into a decimal with the alias as avg_salary
* ```GROUP BY``` experience_level column to find the average salary per experience level
* ```ORDER BY``` avg_salary in descending order

## 5. Did remote working increase from 2020 to 2022?

```SQL
SELECT 
work_year,
remote_ratio,
COUNT(remote_ratio) as count_of_remote_ratio
FROM DSsalaries..ds_salaries
GROUP BY work_year, remote_ratio
ORDER BY work_year ASC
```
![Q5](https://user-images.githubusercontent.com/112139192/190540316-32dab140-7885-444a-a8e3-6f5f4522462b.PNG)

![Q5(chart)](https://user-images.githubusercontent.com/112139192/190540386-d5ebb469-3838-46c1-a1e4-122a549a3205.PNG)

* From 2020 to 2022 working remote 100% increased from 36 to 228
* Working on the job also increased from 15 to 78
* Interestingly, working both remote and on job increased from 2020 to 2021, 21 to 26, but declined in 2022 past 2020 marks at 12

### Solution

* Projected work_year and remote_ratio column from ds_salaries table
* ```COUNT``` to find total number of employees for
* ```GROUP BY``` work_year and remote_ratio column to find total number of employees per work year and remote ratio
* ```ORDER BY``` work_year column in ascending order

## 6. What company size occurs the most

```SQL
SELECT 
company_size,
COUNT(company_size) as count_of_company_size
FROM DSsalaries..ds_salaries
GROUP BY company_size
ORDER BY company_size asc
```
![Q6](https://user-images.githubusercontent.com/112139192/190541505-5be5b242-362d-4b68-9ba3-af614077ede9.PNG)

![Q6(chart)](https://user-images.githubusercontent.com/112139192/190541950-aac0ea59-db58-4b1b-83d4-459f46f9031b.PNG)

## Solution

* Projected company_size column from ds_salaries table
* ```COUNT``` to find total number of employees
* ```GROUP BY``` company_size column to find total number of employees for each company size
* ```ORDER BY``` company size in ascending order

## 7. What is the percentage of jobs that work remote

