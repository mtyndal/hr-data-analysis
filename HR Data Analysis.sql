use hr;
select * from employees;
-- 1. How many employees are in the system?
SELECT COUNT(*)
FROM employees;
-- 2. Display the number of employees. Group by gender. What is the average pay of each group?
SELECT gender, avg(salary) avg_salary, COUNT(*)
FROM employees
GROUP BY gender;
-- 3. Who is the highest paid employee?
SELECT MAX(SALARY)
FROM employees; 

select * from employees
WHERE SALARY = 
(SELECT MAX(SALARY)
FROM employees); 
-- 4. Who is the lowest paid employee?
SELECT MIN(SALARY)
FROM employees; 

select * from employees
WHERE SALARY = 
(SELECT MIN(SALARY)
FROM employees); 
-- 5. Which employee(s) has worked for the company the longest? How much do they make?
select id, concat( first_name, ' ' , last_name) full_name, salary
from employees 
where TIMESTAMPDIFF(year, hire_date, CURRENT_TIMESTAMP) =
(SELECT
MAX(TIMESTAMPDIFF(year, hire_date, CURRENT_TIMESTAMP)) max_tenure
FROM employees)
ORDER BY salary desc;

-- 6. How many employees work in each division? Be sure not to include any null values. 
SELECT division_name, count(*) num_of_employees
FROM employees
where division_name IS NOT NULL
GROUP BY division_name
ORDER BY count(*) DESC;
