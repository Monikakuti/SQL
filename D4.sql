-- JOINS

--| Type         | Description                                                              |
--| ------------ | ------------------------------------------------------------------------ |
--| `INNER JOIN` | Only matching records in both tables                                     |
--| `LEFT JOIN`  | All records from left table + matching from right (or NULLs if no match) |
--| `RIGHT JOIN` | All records from right table + matching from left                        |
--| `FULL JOIN`  | All records from both tables (match where possible, NULLs otherwise)     |


use Practice1

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    country VARCHAR(100),
    total_spent DECIMAL(10, 2)
);

INSERT INTO customer (customer_id, name, age, country, total_spent)
VALUES
(1, 'Alice', 25, 'USA', 500),
(2, 'Bob', 34, 'India', 800),
(3, 'Charlie', 28, 'UK', 350);

SELECT * FROM customer

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO orders (order_id, customer_id, product, amount)
VALUES
(101, 1, 'Laptop', 500),
(102, 2, 'Smartphone', 300),
(103, 3, 'Tablet', 450);

SELECT * FROM orders

--INNER JOIN – Only Matches from Both Sides
-- You want only customers who placed orders.
SELECT customer.name, orders.product
FROM customer
INNER JOIN orders ON customer.customer_id = orders.customer_id;

--LEFT JOIN – All Left Table + Matching Right
--You want all customers, even if they didn’t order.
SELECT customer.name,orders.product
FROM customer
LEFT JOIN orders ON customer.customer_id = orders.order_id

--RIGHT JOIN – All Right Table + Matching Left
--You want all orders, even if the customer is unknown (e.g., deleted from DB).
SELECT customer.name, orders.product
FROM customer
RIGHT JOIN orders ON customer.customer_id = orders.customer_id;

--FULL OUTER JOIN – All Records from Both Tables
-- You want everything, matched or unmatched.
SELECT customer.name, orders.product
FROM customer
FULL OUTER JOIN orders ON customer.customer_id = orders.customer_id;


--?? 1. INNER JOIN
--Task: Show the names of customers and the products they ordered. Only include those who have placed at least one order.
SELECT customer.name , orders.product
FROM customer
INNER JOIN orders ON customer.customer_id=orders.customer_id

--?? 2. LEFT JOIN
--Task: List all customer names along with their order amount. Show NULL if they haven’t made any purchase.
SELECT customer.name , orders.amount
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id

--?? 3. RIGHT JOIN
--Task: Show the product name and customer name for all orders — even if the customer is missing or unknown.
SELECT customer.name , orders.product
FROM customer
RIGHT JOIN orders
ON customer.customer_id=orders.customer_id

--?? 4. FULL OUTER JOIN 
--Task: Display customer names and their purchased products. Also include customers with no orders and products not linked to any customer.
SELECT customer.name , orders.product
FROM customer
FULL OUTER JOIN orders
ON customer.customer_id = orders.customer_id

--?? 5. Bonus Challenge: Aggregation + JOIN
--Task: Show each customer's name and the total amount they spent across all orders.
SELECT customer.name , SUM(amount) AS total_amount
FROM customer
INNER JOIN orders
ON customer.customer_id = orders.customer_id
GROUP BY customer.customer_id , customer.name

--| JOIN Type         | Think: "Must I include...?"                       | Example Use Case                                        |
--| ----------------- | ------------------------------------------------- | ------------------------------------------------------- |
--| ?? **INNER JOIN** | Only records with a match on both sides           | Show only customers who placed at least one order       |
--| ?? **LEFT JOIN**  | All from the left side, even if no match on right | Show all customers — even those who didn't place orders |
--| ?? **RIGHT JOIN** | All from the right side, even if no match on left | Show all orders — even if customer info is missing      |
--| ?? **FULL JOIN**  | All from both sides, matched where possible       | Combine full customer + order data, include everyone    |



--?? Real-Life Analogies (Easy to Remember)

--1. INNER JOIN — "Only Who Showed Up"
--You invited 50 people to a party. Only those who both RSVP’d and attended are in the photos.
--? Use when: You need only confirmed data (e.g., orders with existing customers).

--2. LEFT JOIN — "Your Full Contacts List"
--You’re sending invites from your contacts. Even if some haven’t replied, you still list them all.
--? Use when: You want to keep all base records (e.g., customers), and add extra info if available.

--3. RIGHT JOIN — "Orders Without Profiles"
--Someone made a purchase but deleted their profile. You still want to see what was bought.
--? Use when: You want to retain all transactions or actions — even if the person who did it is missing.

--4. FULL JOIN — "Everyone Matters"
--You're merging two lists — one of event attendees, one of feedback givers. You care about both lists.
--? Use when: You care about all possible records, no matter where they come from.



-----? Quick Summary Rules to Remember

--?? Use INNER JOIN when you're 100% sure both tables must have a match for your question.

--?? Use LEFT JOIN when your main focus is the left table (e.g., customers, employees).

--?? Use RIGHT JOIN when your main focus is the right table (e.g., logs, orders).

--?? Use FULL JOIN when both sides contain important, unmatched data.

