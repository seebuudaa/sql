-- step 2

-- 1. SELECT all records from table Customers.
SELECT * FROM customers; 

-- 2 SELECT records only from the name column in the Customers table.
SELECT DISTINCT firstname FROM customers;

-- 3. Show the name of the Customer whose CustomerID is 1.
SELECT firstname  FROM customers WHERE customerid = 1;

-- 4. UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.
update customers
SET firstname = 'Lerato',
lastname = 'Mabitso'
WHERE customerid = 1;

-- 5. DELETE the record from the Customers table for customer 2 (CustomerID = 2).
DELETE FROM customers
WHERE customerid = 2;

-- 6. Select all unique statuses from the Orders table and get a count of the number of orders for each unique status.
SELECT status FROM orders;
SELECT COUNT(status) FROM orders;

-- 7.Return the MAXIMUM payment made on the PAYMENTS table.
SELECT CONCAT('R', max(amount)) as MAXIMUM FROM payments;

-- 8.Select all customers from the “Customers” table, sorted by the “Country” column.
SELECT * FROM customers 
order by country;

-- 9. Select all products with a price BETWEEN R100 and R600.
SELECT CONCAT('R', buyprice) as "BETWEEN"
FROM products 
WHERE buyprice 
BETWEEN 100 and 600;

-- 10. Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.
SELECT * FROM customers 
WHERE country = 'Germany' 
AND city = 'Berlin';

-- 11. Select all fields from “Customers” where city is “Cape Town” OR “Durban”.]]
SELECT * from Customers 
WHERE City ='Cape Town' 
or City = 'Durban';

-- 12. Select all records from Products where the Price is GREATER than R500. 
SELECT * FROM products WHERE 
buyprice > 500;

-- 13. Return the sum of the Amounts on the Payments table
SELECT CONCAT('R', sum(amount)) 
as sum
FROM payments;

-- 14. Count the number of shipped orders in the Orders table.
SELECT COUNT(status) FROM orders
as COUNTER
WHERE status = 'Shipped';

-- 15. Return the average price of all Products, in Rands and in Dollars (assume the exchange rate is R12 to the Dollar).
SELECT CONCAT('$', round(avg(buyprice)/12)) 
as average FROM products;

-- 16. Using INNER JOIN create a query that selects all Payments with Customer information.
SELECT payments.customerid,
customers.firstname,
customers.lastname, 
customers.gender,
customers.address,
customers.phone,
customers.email,
customers.city,
customers.country,
CONCAT('R', payments.amount) as amount FROM customers
INNER JOIN payments ON payments.CustomerID = Customers.CustomerID;

-- 17. Select all products that have turnable front wheels.
SELECT * FROM products
WHERE description LIKE '%Turnable front wheels%';

-- THE END!!
