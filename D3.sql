-- Day 3: Aggregation Functions + Grouping Data , HAVING 

| Function  | What it does  |
| --------- | ------------- |
| `COUNT()` | Counts rows   |
| `SUM()`   | Adds numbers  |
| `AVG()`   | Finds average |
| `MAX()`   | Finds maximum |
| `MIN()`   | Finds minimum |

use Practice;

-- TO VIEW 
SELECT * FROM customers;

--COUNT() – Number of customers
SELECT COUNT(*) AS total_customers
FROM customers;

--SUM() – Total spent by all customers
SELECT SUM(total_spent) AS total_sales
FROM customers;

--AVG() – Average customer age
SELECT AVG(age) AS average_age
FROM customers;

--MAX() and MIN() – Oldest and youngest
SELECT MAX(age) AS oldest, MIN(age) AS youngest
FROM customers;

--GROUP BY (Filter by Grouping)

--TOTAL SPENT PER COUNTRY
SELECT country, SUM(total_spent) AS total_by_country
FROM customers
GROUP BY country;

--AVERAGE AGE PER COUNTRY
SELECT country , AVG(age) AS avg_age
FROM customers
GROUP BY country;

-- HAVING – Filter groups after grouping
SELECT country, SUM(total_spent) AS total_by_country
FROM customers
GROUP BY country
HAVING SUM(total_spent) > 1000;

--Exercises

--Count how many customers are in the table.
SELECT COUNT(*) AS total_customers
FROM customers;


--Show the total amount spent by all customers.
SELECT SUM(total_spent) AS total_amount_spend
FROM customers;


--What’s the average age of customers from each country?
SELECT AVG(age) AS Avg_age , country
FROM customers
GROUP BY country;


--Find the total spending per country.
SELECT SUM(total_spent) AS total_spending , country
FROM customers
GROUP BY country;


--Show countries where the total spending is more than 1000.
SELECT SUM(total_spent) AS total_spending ,country
FROM customers
GROUP BY country
HAVING SUM(total_spent) > 1000;


--Find the maximum total_spent per country.
SELECT MAX(total_spent) AS total_spending , country
FROM customers
GROUP BY country;

--Show countries where average age is less than 35.
SELECT AVG(age) AS avg_age , country
FROM customers
GROUP BY country
HAVING AVG(age) < 35;
