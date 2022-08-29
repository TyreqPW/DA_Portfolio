First, I went into excel and change every M to Male and F to Female in Sex column using Find and Replace

![ExcelMF](https://user-images.githubusercontent.com/112139192/187109115-8484b854-b827-4ce0-a1d8-6d4ac4dbc7eb.PNG)
![ExcelMF(fixed)](https://user-images.githubusercontent.com/112139192/187109171-746d6e46-7906-4a72-9e9d-2840a285d95b.PNG)
---
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

### Solution
* I use the ```CASE``` statement to find null values in DateofTermination and replacing them with 1 to get the Total number of people that are employed
*  ```WHERE``` clause for DateofTermination filtering if the values are NULL or not
* Use ```COUNT``` to see who is not employed
* Used another ```CASE``` statement and added the ```COUNT``` of DateofTermination to find the total
* ```GROUP BY``` to find the total of employed and not employed per department
---
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

### Solution
* Created two ```CTE``` tables named Males_tb 2 and Females_tb2 to find the total number for each Sex
* Using the ```CTE``` Females_tb2 table, created a nested subquery inside the ```SELECT``` statement to show the total Males
---
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

### Solution
* Use ```COUNT``` to get total race count ```GROUP BY``` RecruitmentSource and RaceDesc column
---
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

### Solution
* Use ```AVG``` function for EmpSatisfaction to find average employee satisfaction
* ```CAST``` to remove trailing zeros by 2
* ```GROUP BY``` PerformanceScore to show average employee satisfaction per performance score
---
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

### Solution
* Use ```AVG``` on EmpSatisfaction to find average employee satisfaction
* Use ```Cast``` to remove trailing zeros by 2
* ```GROUP BY``` Department to show average employee satisfaction per Department
---
## 6. Does employee satisfaction increase when salary increase?

```sql

SELECT EmpSatisfaction, CAST(AVG(Salary) as decimal(18,2)) Salary_Avg
FROM HRSheet
GROUP BY EmpSatisfaction
```
![Q6](https://user-images.githubusercontent.com/112139192/187103946-75a1dd3a-5341-4e6e-82b7-14ee17bee604.PNG)
![Q6(2)](https://user-images.githubusercontent.com/112139192/187103977-57b79577-5526-4e1b-a1e8-7408b2143a19.PNG)

* When Salary increases, so does employee satisfaction

### Solution
* ```AVG``` on Salary to find average Salary
* ```CAST``` to remove trailing zeros by 2
* ```GROUP BY``` EmpSatisfaction to show average salary per employee satisfaction
---
## 7. What is the percent difference between people who leave and stay per recruitment source?

```sql

SELECT RecruitmentSource,
(CASE 
	WHEN NotEmployed = 1 AND Employed = 0 THEN 0 
	ELSE CAST(CAST(NotEmployed as float)/ CAST(Employed + NotEmployed as float) as decimal(18,2))
	END) as PercentLeave
FROM(SELECT
RecruitmentSource,
SUM(CASE WHEN DateofTermination IS NULL THEN 1 ELSE 0 END) Employed,
COUNT(DateofTermination) NotEmployed
FROM HRSheet
WHERE DateofTermination IS NOT NULL OR DateofTermination IS NULL
group by RecruitmentSource) percent_per_recruitmentsource
ORDER BY PercentLeave desc
```
![Q7](https://user-images.githubusercontent.com/112139192/187104178-001cdf6a-d103-461e-98c6-7964b63ebca3.PNG)

* Over 50% of employees from Google Search, Diversity Job Fair and Other leave

### Solution
* Created a subquery in the FROM clause to find total employed and not employed ```GROUP BY``` RecruitmentSource using:
1. ```CASE``` statement to find who is employed
2. ```SUM``` function to get total employed
3. ```COUNT``` DateofTermination to get total not employed
4. ```WHERE``` clause to filter if DateofTermination is NULL or not
* Use ```CASE``` statement to filter out the 0 because when you divide by zero you get an error
* ```CAST``` both NotEmployed and Employed as float to get decimal
---
## 8. What is the average salary per gender per department?

```sql

with Males_tb as(
SELECT 
Department,
COUNT(Sex) Males,
CAST(AVG(Salary) as decimal(18,2)) Avg_Sal_Males
FROM HRSheet
WHERE Sex = 'Male'
GROUP BY Department
),

Females_tb as(
SELECT 
Department,
COUNT(Sex) Females,
CAST(AVG(Salary) as decimal(18,2)) Avg_Sal_Females
FROM HRSheet
WHERE Sex = 'Female'
GROUP BY Department
)

SELECT 
Females_tb.Department, 
Females, 
Avg_Sal_Females, 
Males, 
Avg_Sal_Males,
CAST(ROUND((CASE WHEN Avg_Sal_Males IS NULL THEN 0
ELSE ((Avg_Sal_Females-Avg_Sal_Males)/ Avg_Sal_Males)
END), 2) AS decimal(18,2)) as percent_diff
FROM Females_tb
FULL OUTER JOIN Males_tb
ON Females_tb.Department = Males_tb.Department
```
![Q8](https://user-images.githubusercontent.com/112139192/187106061-26155fe1-6fe6-4640-b8c9-8b10ea7d2bdc.PNG)

* Females make roughly 9% more on average in Sales department

### Solution
* Created two ```CTE``` tables called Males_tb and Females_tb
1. Find total Males and Females using ```COUNT```
2. Using ```AVG``` on Salary for both Males and Females table
3. ```GROUP BY``` Department
* Use ```CASE``` to Filter out 0 in Avg_Sal_Males column because dividing by 0 causes an error
* ```FULL OUTER JOIN``` Females_tb and Males_tb ```ON``` Department because the Females table has 1 row that isn't in the Males table
