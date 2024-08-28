# JOINS

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOIN (by default just writing join will be an inner join)
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
    
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;


-- OUTER JOINS (has LEFT JOIN and RIGHT JOIN)
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- SELF JOIN
SELECT emp1.employee_id AS santa, 
emp1.first_name AS santa_n1,
emp1.last_name AS santa_n2,
emp2.employee_id AS gifted,
emp2.first_name AS gifted_n1,
emp2.last_name AS gifted_n2
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
-- JOINING MULTIPLE TABLES
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id;
    
# UNIONS
SELECT first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Higly Paid' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;



# CASE statements
SELECT first_name,
last_name,
age,
CASE
	WHEN age < 30 THEN 'Young'
    WHEN age BETWEEN 30 and 45 THEN 'Old'
    WHEN age > 45 THEN 'Adios Muchachos'
END AS Age_Bracket
FROM employee_demographics;


-- salary of less than 50000 to get 5% raise
-- salary of more than 50000 to get 7% raise
-- finance dept to get 10% BONUS
SELECT first_name,
last_name,
salary,
CASE
	WHEN salary <= 50000 THEN (salary * 0.05) + salary
    WHEN salary > 50000 THEN (salary * 0.07) + salary
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN (salary * 0.10)
END AS BONUS
FROM employee_salary;














