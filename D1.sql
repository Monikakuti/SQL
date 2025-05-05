--SQL Basics — SELECT, FROM, WHERE

use Practice;

-- CREATE TABLE CUSTOMERS
CREATE TABLE customers (
  customer_id INT,
  name VARCHAR(50),
  age INT,
  country VARCHAR(50),
  total_spent INT
);

--INSERTING THE VALUES
INSERT INTO customers VALUES
(1, 'Alice Brown', 29, 'USA', 450),
(2, 'Rahul Singh', 35, 'India', 800),
(3, 'Emily Zhang', 41, 'China', 620),
(4, 'David Smith', 22, 'USA', 150),
(5, 'Priya Mehta', 30, 'India', 950);


-- TO VIEW 
SELECT * FROM customers;

--VIEW ONLY NAME AND COUNTRY 
SELECT name , country 
FROM customers;

--FILTER CUSTOMERS FROM INDIA
SELECT * FROM customers
WHERE country='India';

--CUSTOMERS OLDER THAN 30
SELECT name,age
FROM customers
WHERE age > 30;

--CUSTOMERS WHO SPENT LESS THAN 500
SELECT name,total_spent 
FROM customers
WHERE total_spent < 500;

--SHOW THE NAME AND AGE OF CUSTOMERS FROM THE USA.
SELECT name,age 
FROM customers
WHERE country='USA';

--GET THE NAME OF CUSTOMERS WHO SPENT MORE THAN 600.
SELECT name
FROM customers
WHERE total_spent > 600;

--SHOW ALL DETAILS OF CUSTOMERS AGED LESS THAN 30.
SELECT * FROM customers
WHERE age < 30;