﻿use Practice1;


--🧩 1. WHERE — Filter rows before any grouping
--🧠 Use it when you want to filter individual rows from the table — before any calculation or grouping happens.
--✅ Syntax:
SELECT *
FROM employees
WHERE salary > 30000;
--📌 When to use:
--Filter raw data
--Apply conditions on normal columns (not on aggregates)

--🧩 2. GROUP BY — Group rows to apply aggregation
--🧠 Use this when you want to group rows together and calculate something (like COUNT, SUM, AVG, MAX, etc.)
--✅ Syntax:
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
--📌 When to use:
--When you're using aggregate functions: SUM(), COUNT(), AVG(), etc.
--When you want results per category (like per department, per city)

--🧩 3. ORDER BY — Sort the result
--🧠 Use this when you want to sort the output, either ascending (default) or descending.
--✅ Syntax:
SELECT name, salary
FROM employees
ORDER BY salary DESC;
--📌 When to use:
-- your final output (high to low salary, A to Z name, etc.)
--Works with both grouped and non-grouped results

-- Combined Example:
SELECT department, COUNT(*) AS emp_count
FROM employees
WHERE salary > 20000
GROUP BY department
ORDER BY emp_count DESC;
--✔️ WHERE filters rows with salary > 20000
--✔️ GROUP BY groups them by department
--✔️ ORDER BY sorts the result by employee count (high to low)


--Aggregate Functions
--?? Here's what you’ll learn now:
--COUNT() – Count number of rows
--SUM() – Total of a column
--AVG() – Average value
--MAX() / MIN() – Highest / Lowest
--GROUP BY – Group rows by category (like by department

--🔁 WHERE = before GROUP BY
--🔁 HAVING = after GROUP BY

--COUNT
--?? COUNT(*) = count all rows
--?? AS total_employees = rename the output column

SELECT COUNT(*) AS total_employees FROM employees;

--SUM() — Total salary of all employees
SELECT SUM(salary) AS total_salary FROM employees;

--AVG() — Average salary
SELECT AVG(salary) AS average_salary FROM employees;

--GROUP BY — Group data by category 
--Average salary per department
SELECT department, AVG(salary) AS avg_salary 
FROM employees
GROUP BY department;

--COUNT per department
SELECT department , COUNT(department) AS total_no
FROM employees
GROUP BY department;

--PRACTICE
-- Total salary paid per department
SELECT department , SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Highest salary per department
SELECT department , MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- Number of employees earning above 55000
SELECT COUNT(name) AS no_of_emp
FROM employees
WHERE salary > 55000;

--Department with the lowest average salary
SELECT TOP 1 department , AVG(salary) AS low_avg_salary
FROM employees
GROUP BY department
ORDER BY low_avg_salary ASC;


--?? Basic SELECT & WHERE Practice
--Show names of employees whose salary is between 50000 and 70000.
SELECT name FROM employees
WHERE salary BETWEEN 50000 AND 70000;

--Show all employees who don’t work in the Sales department.
SELECT * FROM employees 
WHERE department != 'Sales';

--Show all employees whose name starts with 'A'.
--We’ll use LIKE to match patterns in text. The % symbol is a wildcard that means "any number of characters".
--Hint: Use LIKE 'A%' to find all names starting with A. 
--'%A'- any string that ends with the letter 'A'

SELECT name FROM employees
WHERE name LIKE'A%';

--Show all employees in IT or HR departments.
-- Hint: IN allows you to match multiple values in a single condition.
SELECT * FROM employees
WHERE department in ('IT','HR');

-- ORDER BY & Filtering
--Show top 3 highest-paid employees in the HR department.

SELECT TOP 3 name FROM employees
WHERE department='HR'
ORDER BY salary DESC;

--Show all employees, sorted by department A–Z, and then by salary high to low.
SELECT * FROM employees
ORDER BY department ASC , salary DESC;

--Show names and salaries of the bottom 2 earners in the company.
SELECT TOP 2 name FROM employees
ORDER BY salary ASC;

--Aggregate Functions
--What is the average salary across all employees?
SELECT AVG(salary) AS avg_salary FROM employees;

--What is the total number of departments?
--You can use COUNT(DISTINCT ...) to get the unique number of departments.
--Hint: DISTINCT helps to count only unique values.
SELECT COUNT(DISTINCT department) AS total_departments FROM employees;

--How many employees earn more than the average salary?
SELECT COUNT(*) AS num_employees_above_avg
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--GROUP BY Practice
--Show total salary paid per department.
SELECT department , SUM(salary) AS total_salary 
FROM employees
GROUP BY department;

--Show number of employees in each department.
SELECT department , COUNT (*) as no_of_emp
FROM employees
GROUP BY department;

--Show the maximum salary per department.
SELECT department , MAX(salary) AS max_salary
FROM employees
GROUP BY department;

--Show average salary per department, sorted from highest to lowest.
SELECT department , AVG(salary) AS avg_salary
FROM employees
GROUP BY department 
ORDER BY avg_salary DESC;

--?? What’s the difference between WHERE vs HAVING?

--WHERE                        	    HAVING
--Filters rows before grouping	    Filters groups after aggregation
--Used with SELECT * FROM table  	Used with GROUP BY + aggregate functions


--?? HAVING Clause Practice
--Show departments where the average salary is greater than 60000.
SELECT department , AVG(salary) as avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) >60000;

--Show departments with more than 2 employees.
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;


--Show departments whose total salary payout is above 100000.
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- Show all employees who earn more than the average salary of all employees
SELECT * FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);

--Show the employee(s) with the highest salary
SELECT * FROM employees
WHERE salary = (
    SELECT MAX(salary) FROM employees
);
