USE hr_employee_attrition;

-- 1. Data validation
SELECT COUNT(*) AS total_rows FROM hr_employee_attrition;
SELECT employee_number, COUNT(*) AS duplicate_count FROM hr_employee_attrition GROUP BY employee_number HAVING COUNT(*)>1;
SELECT SUM(age IS NULL) AS missing_age, SUM(attrition IS NULL) AS missing_attrition,
       SUM(department IS NULL) AS missing_department, SUM(job_role IS NULL) AS missing_job_role
FROM hr_employee_attrition;

-- 2. Overall KPIs
SELECT COUNT(*) AS total_employees,
       SUM(attrition='Yes') AS employees_left,
       SUM(attrition='No') AS active_employees,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct,
       ROUND(AVG(age),2) AS average_age,
       ROUND(AVG(monthly_income),2) AS average_monthly_income
FROM hr_employee_attrition;

-- 3. Attrition by department
SELECT department, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY department ORDER BY attrition_rate_pct DESC;

-- 4. Attrition by job role
SELECT job_role, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY job_role ORDER BY attrition_rate_pct DESC;

-- 5. Attrition by gender
SELECT gender, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY gender ORDER BY attrition_rate_pct DESC;

-- 6. Attrition by age group
SELECT age_group, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY age_group ORDER BY age_group;

-- 7. Attrition by overtime
SELECT overtime, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY overtime ORDER BY attrition_rate_pct DESC;

-- 8. Attrition by income band
SELECT income_band, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY income_band ORDER BY attrition_rate_pct DESC;

-- 9. Attrition by education field
SELECT education_field, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY education_field ORDER BY attrition_rate_pct DESC;

-- 10. Work-life balance
SELECT work_life_balance, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY work_life_balance ORDER BY work_life_balance;

-- 11. Attrition by marital status
SELECT marital_status, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY marital_status ORDER BY attrition_rate_pct DESC;

-- 12. Overtime x department
SELECT department, overtime, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY department,overtime ORDER BY department,overtime;

-- 13. Average monthly income by attrition status
SELECT attrition, COUNT(*) AS employees, ROUND(AVG(monthly_income),2) AS avg_monthly_income
FROM hr_employee_attrition GROUP BY attrition;

-- 14. Years at company band
SELECT years_at_company_band, COUNT(*) AS total_employees, SUM(attrition='Yes') AS employees_left,
       ROUND(100.0*SUM(attrition='Yes')/COUNT(*),2) AS attrition_rate_pct
FROM hr_employee_attrition GROUP BY years_at_company_band ORDER BY attrition_rate_pct DESC;
