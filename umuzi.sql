CREATE DATABASE Umuzi;

CREATE TABLE "public"."customers" (
    "customerid" integer NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "gender" character varying(20),
    "address" character varying(200),
    "phone" character varying(20),
    "email" character varying(100),
    "city" character varying(30),
    "country" character varying(50),
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customerid")
);

INSERT INTO "customers" ("customerid", "firstname", "lastname", "gender", "address", "phone", "email", "city", "country") VALUES
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd Gillits',	'0820832830',	'Leon@gmail.com',	'Durban',	'South Africa'),
(4,	'Charl',	'Muller',	'Male',	'290A Dorset Ecke',	'+44856872553',	'Charl.muller@yahoo.com',	'Berlin',	'Germany'),
(5,	'Julia',	'Stein',	'Female',	'2 Wernerring',	'+448672445058',	'js234@yahoo.com',	'Frankfurt',	'Germany'),
(1,	'Lerato',	'Mabitso',	'Male',	'284 chaucer st',	'084789657',	'john@gmail.com',	'Johannesburg',	'South Africa');


CREATE TABLE "public"."employees" (
    "employeeid" integer NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "email" character varying(100),
    "jobtitle" character varying(20),
    CONSTRAINT "employees_pkey" PRIMARY KEY ("employeeid")
);


INSERT INTO "employees" ("employeeid", "firstname", "lastname", "email", "jobtitle") VALUES
(1,	'Kani',	'Matthew',	'mat@gmail.com',	'Manager'),
(2,	'Lesly',	'Cronje',	'LesC@gmail.com',	'Clerk'),
(3,	'Gideon',	'Maduku',	'm@gmail.com',	'Accountant');

CREATE TABLE "public"."orders" (
    "orderid" integer,
    "productid" integer,
    "paymentid" integer,
    "fulfilledbyemployeeid" integer,
    "daterequired" character varying(30),
    "dateshipped" character varying(30),
    "status" character varying(20)
);

INSERT INTO "orders" ("orderid", "productid", "paymentid", "fulfilledbyemployeeid", "daterequired", "dateshipped", "status") VALUES
(1,	1,	1,	2,	'05-09-2018',	'',	'Not shipped'),
(2,	1,	2,	2,	'04-09-2018',	'03-09-2018',	'Shipped'),
(3,	3,	3,	3,	'06-09-2018',	'',	'Not shipped');


CREATE TABLE "public"."payments" (
    "customerid" integer,
    "paymentid" integer,
    "paymentdate" character varying(50),
    "amount" numeric(5,2),
    "currency" character varying(4)
);


INSERT INTO "payments" ("customerid", "paymentid", "paymentdate", "amount", "currency") VALUES
(1,	1,	'01-09-2018',	150.75,	'R'),
(5,	2,	'03-09-2018',	150.75,	'R'),
(4,	3,	'03-09-2018',	700.65,	'R');


CREATE TABLE "public"."products" (
    "productid" integer DEFAULT nextval('products_productid_seq') NOT NULL,
    "productname" character varying(100),
    "description" character varying(300),
    "buyprice" numeric(10,2),
    "currency" character varying(4),
    CONSTRAINT "products_pkey" PRIMARY KEY ("productid")
);

TRUNCATE "products";
INSERT INTO "products" ("productid", "productname", "description", "buyprice", "currency") VALUES
(1,	'Harley Davidson Chopper',	'This replica features working kickstand,front suspension gear-shift lever',	150.75,	'R'),
(2,	'Classic Car',	'Turnable front wheels,steering function',	550.75,	'R'),
(3,	'Sports car',	'Turnable front wheels,steering function',	700.65,	'R');

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
