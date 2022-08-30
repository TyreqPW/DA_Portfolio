/****** Script for SelectTopNRows command from SSMS  ******/

/* Count of Males and Females */

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

/* Find who is still employed (207) */

SELECT Department, SUM(CASE WHEN DateofTermination IS NULL THEN 1 ELSE 0 end) as StillEmployed
FROM HRSheet 
WHERE DateofTermination IS NULL
GROUP BY Department


/* Find who is not employed (104)*/

SELECT Department, Count(DateofTermination) Terminated
FROM HRSheet
WHERE DateofTermination IS NOT NULL
GROUP BY Department

/* Join both employed and nonemployed quieres (311) */

SELECT Department,
SUM(CASE WHEN DateofTermination IS NULL THEN 1 ELSE 0 end) as StillEmployed, 
Count(DateofTermination) NotEmployed,
SUM(CASE WHEN DateofTermination IS NULL THEN 1 ELSE 0 end) + Count(DateofTermination) as Total
FROM HRSheet 
WHERE DateofTermination IS NOT NULL OR DateofTermination IS NULL 
GROUP BY Department
ORDER BY Department

/* Count Race per RecruitmentSource */

SELECT RecruitmentSource, RaceDesc, COUNT(RaceDesc) RaceCount
FROM HRSheet
GROUP BY RecruitmentSource, RaceDesc
ORDER By RecruitmentSource

/* Average employee satisfaction for PerformanceScore */
SELECT PerformanceScore, CAST(AVG(EmpSatisfaction) as decimal(18,2)) AVGSat
FROM HRSheet
GROUP BY PerformanceScore
ORDER BY AVGSat desc

/* Average employee satisfaction per Department */
SELECT Department, CAST(AVG(EmpSatisfaction) as decimal(18,2)) AVGSat
FROM HRSheet
GROUP BY Department
ORDER BY AVGSat desc

/* Will Employee satisfaction increase depending on Salary? */
SELECT EmpSatisfaction, CAST(AVG(Salary) as decimal(18,2)) Salary_Avg
FROM HRSheet
GROUP BY EmpSatisfaction

/* Percent Left for RecruitmentSource */
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

/* Count of Gender and Average Salary Per Department */
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
END), 2) as decimal(18,2)) as percent_diff
FROM Females_tb
FULL OUTER JOIN Males_tb
ON Females_tb.Department = Males_tb.Department


/* Average number of days till Termination (1264) or (3.5) Years */
SELECT 
AVG(num_days) Avg_Day__Till_Termination
FROM(SELECT DateofHire,
DateofTermination,
DATEDIFF(day, DateofHire, DateofTermination) num_days
FROM HRSheet
WHERE DateofTermination IS NOT NULL) avg_num_days_till_termination

