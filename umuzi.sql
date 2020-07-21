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
(3, 'Leon', 'Glen', 'Male', '81 Everton Rd Gillits',    '0820832830',   'Leon@gmail.com',   'Durban',   'South Africa'),
(4, 'Charl',    'Muller',   'Male', '290A Dorset Ecke', '+44856872553', 'Charl.muller@yahoo.com',   'Berlin',   'Germany'),
(5, 'Julia',    'Stein',    'Female',   '2 Wernerring', '+448672445058',    'js234@yahoo.com',  'Frankfurt',    'Germany'),
(1, 'Lerato',   'Mabitso',  'Male', '284 chaucer st',   '084789657',    'john@gmail.com',   'Johannesburg', 'South Africa');

CREATE TABLE "public"."employees" (
    "employeeid" integer NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "email" character varying(100),
    "jobtitle" character varying(20),
    CONSTRAINT "employees_pkey" PRIMARY KEY ("employeeid")
);

INSERT INTO "employees" ("employeeid", "firstname", "lastname", "email", "jobtitle") VALUES
(1, 'Kani', 'Matthew',  'mat@gmail.com',    'Manager'),
(2, 'Lesly',    'Cronje',   'LesC@gmail.com',   'Clerk'),
(3, 'Gideon',   'Maduku',   'm@gmail.com',  'Accountant');
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
(1, 1,  1,  2,  '05-09-2018',   '', 'Not shipped'),
(2, 1,  2,  2,  '04-09-2018',   '03-09-2018',   'Shipped'),
(3, 3,  3,  3,  '06-09-2018',   '', 'Not shipped');

CREATE TABLE "payments" (
    "customerid" integer,
    "paymentid" integer,
    "paymentdate" character varying(50),
    "amount" numeric(5,2),
    "currency" character varying(4)
);

INSERT INTO "payments" ("customerid", "paymentid", "paymentdate", "amount", "currency") VALUES
(1, 1,  '01-09-2018',   150.75, 'R'),
(5, 2,  '03-09-2018',   150.75, 'R'),
(4, 3,  '03-09-2018',   700.65, 'R');

CREATE TABLE "products" (
    "productid" integer NOT NULL,
    "productname" character varying(100),
    "description" character varying(300),
    "buyprice" numeric(10,2),
    "currency" character varying(4),
   PRIMARY KEY ("productid")
);

INSERT INTO "products" ("productid", "productname", "description", "buyprice", "currency") VALUES
(1, 'Harley Davidson Chopper',  'This replica features working kickstand,front suspension gear-shift lever',    150.75, 'R'),
(2, 'Classic Car',  'Turnable front wheels,steering function',  550.75, 'R'),
(3, 'Sports car',   'Turnable front wheels,steering function',  700.65, 'R');
