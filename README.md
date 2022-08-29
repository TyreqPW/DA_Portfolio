# Project 1: Human Resources Data Analysis

## Description:
The the single CSV file came from https://www.kaggle.com/datasets/rhuebner/human-resources-data-set.
The file was used for Human Resource Management students at New England College of Business to
work on data visualization on Tableau.

### :pushpin: Questions: :pushpin:
#### 1. How many people are employed and not employed per department?
#### 2. What is the sum of gender?
#### 3. What is the sum of races per recruitment source?
#### 4. What is the average employee satisfaction per performance score?
#### 5. What is the average employee satisfaction per department?
#### 6. Does employee satisfaction increase when salary increase?
#### 7. What is the percent difference between people who leave and stay per recruitment source?
#### 8. What is the average salary per gender per department?

## 1. How many people are employed and not employed per department?

```sql

SELECT Department,
SUM(CASE WHEN DateofTermination IS NULL THEN 1 ELSE 0 end) as StillEmployed, 
Count(DateofTermination) NotEmployed,
SUM(CASE WHEN DateofTermination IS NULL THEN 1 ELSE 0 end) + Count(DateofTermination) as Total
FROM HRSheet 
WHERE DateofTermination IS NOT NULL OR DateofTermination IS NULL 
GROUP BY Department
ORDER BY Department
```

![Q1](https://user-images.githubusercontent.com/112139192/187101924-c624ceb4-6d40-46d2-9547-e9bd3d9eed90.PNG)

* Not only Production has the most employed but also the most not employed
* Executive Office is the only department with 1 employee

## 2. What is the sum of gender?

```sql

with Males_tb2 as(
SELECT 
COUNT(Sex) Males
FROM HRSheet
WHERE Sex = 'Male'
),

Females_tb2 as(
SELECT 
COUNT(Sex) Females
FROM HRSheet
WHERE Sex = 'Female'
)

SELECT 
(SELECT * FROM Males_tb2) Males,
Females
FROM Females_tb2
```

![Q2](https://user-images.githubusercontent.com/112139192/187102148-8db698db-6913-4bac-a40e-248807cecf3c.PNG)

* There are more females than males

## 3. What is the sum of races per recruitment source?

```sql

SELECT RecruitmentSource, RaceDesc, COUNT(RaceDesc) RaceCount
FROM HRSheet
GROUP BY RecruitmentSource, RaceDesc
ORDER By RecruitmentSource
```

![Q3](https://user-images.githubusercontent.com/112139192/187102315-c790b0be-9fad-4aa9-b59f-de660a76ecb8.PNG)
![Q3(2)](https://user-images.githubusercontent.com/112139192/187102322-13b0fd64-8912-42de-bd6f-4058a1a59290.PNG)

* Most of the people hired came from Indeed
* Diversity Job Fair is the only recruitment source with 100% Black or African American 

## 4. What is the average employee satisfaction per performance score?

```sql

SELECT PerformanceScore, CAST(AVG(EmpSatisfaction) as decimal(18,2)) AVGSat
FROM HRSheet
GROUP BY PerformanceScore
ORDER BY AVGSat desc
```
![Q4](https://user-images.githubusercontent.com/112139192/187102468-3bc2f60f-4a1d-4b54-88ea-52d39856542c.PNG)
![Q4(2)](https://user-images.githubusercontent.com/112139192/187102475-b495f420-4954-4e36-8966-826606c7e074.PNG)

* Employees with performance scores that exceeds are the most satisfied followed behind fully meets
* Employees that are the least satisfied performance score is PIP

## 5. What is the average employee satisfaction per department?

```sql

SELECT Department, CAST(AVG(EmpSatisfaction) as decimal(18,2)) AVGSat
FROM HRSheet
GROUP BY Department
ORDER BY AVGSat desc
```
![Q5](https://user-images.githubusercontent.com/112139192/187102808-b107c722-7a8d-4a11-88c5-15e47955434a.PNG)
![Q5(2)](https://user-images.githubusercontent.com/112139192/187102982-b36104cc-b992-4819-bd53-45166e832cd1.PNG)

* Employees in Software Engineer department has the most satisfaction on average
* Executive Office has the least satisfaction (*maybe because there is 1 employee doing all the work*)



