-- Select (Read) Queries

-- 1. Write a query to calculate the payments each sales agent is responsible for. Display the agent name and the total payments.
SELECT a.name, SUM(c.payments) AS "Total Payments"
FROM salesAgents a, customers c
WHERE a.agentID = c.agentID
GROUP BY a.agentID;

-- 2. Write a query to calculate payments for each sales agent by country of the sales agent. Display the agent country and total payments.
SELECT a.country, SUM(c.payments) AS "Total Payments"
FROM salesAgents a, customers c
WHERE a.agentID = c.agentID
GROUP BY a.country;

-- 3. Calculate the commission for each order. Display order id, customer name, agent name, and commission amount.
SELECT o.orderID, c.custName, a.name, SUM(a.commission) AS "Commission Amount"
FROM orders o, customers c, salesAgents a 
WHERE o.custID = c.custID AND c.agentID = a.agentID
GROUP BY o.orderID;

-- Update Queries

-- 1. In the customers table, for customers from NY update the city value to change it from “NY” to “New York”.
UPDATE customers
SET city = "New York"
WHERE city = "NY";

-- A. Now write an query to select all customers from New York City.
SELECT custName, city
FROM customers
WHERE city = "New York";

-- 2. Increase the commission for sales agents from Canada by 20%.
UPDATE salesAgents
SET commission = commission * 1.2
WHERE country = "CAN";

-- B. Calculate the commission for each order where the agent is from Canada. Display order id, customer name, agent name, and commission amount.
SELECT o.orderID, c.custName, a.name, SUM(a.commission) AS "Commission Amount"
FROM orders o, customers c, salesAgents a 
WHERE o.custID = c.custID AND c.agentID = a.agentID AND a.country = "CAN"
GROUP BY o.orderID;

-- 3. Update customers with level 0 to level 1.
UPDATE customers
SET level = 1
WHERE level = 0;

-- C. Select all customers names and cust id with level 1.
SELECT custName, custID, level
FROM customers
WHERE level = 1;

-- Delete Queries

-- 1. Delete sales agents from NH.
DELETE FROM salesAgents
WHERE state = "NH";

-- E. Write a query to select all columns for all sales agents
SELECT *
FROM salesAgents;

-- 2. Delete customers whose name begins with “W”.
DELETE FROM customers
WHERE custName LIKE 'W%';

-- F. Select all columns for all customers.
SELECT *
FROM customers;