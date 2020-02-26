-- Adminer 4.7.6 PostgreSQL dump

\connect "umuzi";

DROP TABLE IF EXISTS "customers";
CREATE TABLE "public"."customers" (
    "customerid" bigint NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "gender" character varying,
    "address" character varying(200),
    "phone" integer,
    "email" character varying(100),
    "city" character varying(20),
    "country" character varying(50),
    CONSTRAINT "customers_pkey" PRIMARY KEY ("customerid")
) WITH (oids = false);

TRUNCATE "customers";
INSERT INTO "customers" ("customerid", "firstname", "lastname", "gender", "address", "phone", "email", "city", "country") VALUES
(1,	'John',	'Hibert',	'Male',	'284 chaucer st',	84789657,	'john@gmail.com',	'Johannesburg',	'South Africa'),
(2,	'Thando',	'Sithole',	'Female',	'240 Sect 1',	794445584,	'thando@gmail.com',	'Cape Town',	'South Africa'),
(4,	'Charl',	'Muller',	'Male',	'290A Dorset Ecke',	856872553,	'charl.muller@yahoo.com',	'Berlin',	'Germany'),
(5,	'Julia',	'Stein',	'Female',	'2 Wernerring',	672445058,	'js234@yahoo.com',	'Frankfurt',	'Germany'),
(3,	'Leon',	'Glen',	'Male',	'81 Everton Rd Gillits',	820832830,	'leon@gmail.com',	'Durban',	'South Africa');

DROP TABLE IF EXISTS "employeestable";
CREATE TABLE "public"."employeestable" (
    "employeeid" integer NOT NULL,
    "firstname" character varying(50),
    "lastname" character varying(50),
    "email" character varying(100),
    "jobtitle" character varying(20),
    CONSTRAINT "employeestable_pkey" PRIMARY KEY ("employeeid")
) WITH (oids = false);


DROP TABLE IF EXISTS "orders";
CREATE TABLE "public"."orders" (
    "orderid" integer,
    "productid" integer,
    "paymentid" integer,
    "fulfilledbyemployeeid" integer,
    "daterequired" date,
    "dateshipped" date,
    "status" character varying(20)
) WITH (oids = false);


-- 2020-02-26 09:46:17.577938+00