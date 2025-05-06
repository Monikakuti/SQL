-- Day 2: Filtering with LIKE, BETWEEN, IN, Sorting with ORDER BY, and Aliases (AS)

use Practice;

-- TO VIEW 
SELECT * FROM customers;

--LIKE (Search with Patterns)
SELECT * FROM customers
WHERE name LIKE 'A%'; -- Starts with A
                      -- %A = Ends with A
                      -- %A% = Contains A anywhere

--BETWEEN (Filter a Range)
SELECT * FROM customers
WHERE age BETWEEN 25 AND 35;


--IN (Multiple Options in One Filter)
SELECT * FROM customers
WHERE country IN ('India', 'USA');
-- Both give same output
SELECT * FROM customers
WHERE country = 'India' OR country = 'USA';


--ORDER BY (Sort Results)
SELECT * FROM customers
ORDER BY total_spent DESC;    --ASC = ascending (default), DESC = descending

--AS (Aliases for Clean Output)
SELECT name AS customer_name, total_spent AS amount_spent       -- (AS) Aliases give nicknames to columns for better display
FROM customers;

-- Exercise

--Get the names of customers whose names contain "a".
SELECT name 
FROM customers
WHERE name LIKE'%A%';


--Show all customers aged between 30 and 40.
SELECT * FROM customers
WHERE age BETWEEN 30 AND 40;


--Get details of customers from India or China.
SELECT * FROM customers
WHERE country IN ('India','China');


--Show all customers sorted by age (youngest first).
SELECT * FROM customers
ORDER BY age ASC;


--Select name and country, but alias them as customer_name and location.
SELECT name AS Customer_name , country AS Location
FROM customers;


--Get the names of customers whose name starts with ‘P’.
SELECT name 
FROM customers
WHERE name LIKE 'P%';


--Show all customers whose name ends with ‘h’.
SELECT * FROM customers
WHERE name LIKE '%h';


--Find customers whose age is not between 25 and 35.
SELECT * FROM customers
WHERE age NOT BETWEEN 25 AND 35;


--Display the names of customers from countries other than USA and India.
SELECT name 
FROM customers
WHERE country NOT IN ('USA','India');


--Show the name and total_spent of customers who spent between 500 and 900.
SELECT name , total_spent 
FROM customers
WHERE total_spent BETWEEN 500 AND 900;


--List all customers, sorted by total_spent from highest to lowest.
SELECT * FROM customers
ORDER BY total_spent  DESC;


--Show customers whose names contain the letter ‘e’.
SELECT * FROM customers
WHERE name LIKE '%e%';


--Display the age and country of customers, sorted by country alphabetically.
SELECT age , country
FROM customers
ORDER BY country ASC;


--Select name and country, but display them as "Customer" and "Country_Name".
SELECT name AS Customer , country AS Country_Name 
FROM  customers ;


--Show all details of customers who spent less than 800 and are from India.
SELECT * FROM customers
WHERE total_spent < 800 AND country ='India';