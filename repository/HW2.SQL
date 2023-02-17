-- 1 customer
CREATE TABLE customer( 
    cus_code integer, 
    cus_lname varchar(20), 
    cus_fname varchar(20), 
    cus_initial char, 
    cus_areacode integer,
    cus_phone integer,
    PRIMARY KEY(cus_code)
);

INSERT INTO customer(cus_code, cus_lname ,cus_fname,cus_initial,cus_areacode, cus_phone)
VALUES(10010, 'Ramas', 'Paul', 'A', 615, 8442573);

INSERT INTO customer(cus_code, cus_lname ,cus_fname,cus_initial,cus_areacode, cus_phone)
VALUES(10011, 'Dunne', 'Leona', 'K', 713, 8941238);

INSERT INTO customer(cus_code, cus_lname ,cus_fname,cus_initial,cus_areacode, cus_phone)
VALUES(10012, 'Smith', 'Kathy', 'W', 615, 8942285);

INSERT INTO customer(cus_code, cus_lname ,cus_fname,cus_initial,cus_areacode, cus_phone)
VALUES(10013, 'Olowski', 'Paul','F', 615, 2221672);

INSERT INTO customer(cus_code, cus_lname ,cus_fname,cus_initial,cus_areacode, cus_phone)
VALUES(10014, 'Orlando', 'Myron', NULL, 615, 2971228);

-- 2.invoice:

CREATE TABLE invoice( 
    inv_number integer, 
    cus_code integer, 
    inv_date DATE, 
    PRIMARY KEY(inv_number),
    FOREIGN KEY(cus_code) 
    REFERENCES customer(cus_code)
);

INSERT INTO invoice(inv_number, cus_code,inv_date)
VALUES(1001, 10011, '2018-01-03');
INSERT INTO invoice(inv_number, cus_code,inv_date)
VALUES(1002, 10014, '2016-08-04');
INSERT INTO invoice(inv_number, cus_code,inv_date)
VALUES(1003, 10012, '2017-03-20');
INSERT INTO invoice(inv_number, cus_code,inv_date)
VALUES(1004, 10014, '2018-01-13');

-- 2.List the invoice number and invoice date for all invoices of customer Kathy Smith.
SELECT inv_number, inv_date
FROM invoice
INNER JOIN customer
ON customer.cus_lname = 'Smith' AND customer.cus_fname = 'Kathy';

-- 3.line:
CREATE TABLE line( 
    inv_number integer,  
    prod_code integer  ,
    line_units integer, 
    PRIMARY KEY(inv_number, prod_code),
    FOREIGN KEY(inv_number) 
    REFERENCES Invoice(inv_number),
    FOREIGN KEY(prod_code) 
    REFERENCES Product(prod_code) 
);

INSERT INTO line(inv_number,prod_code,line_units)
VALUES(1001,  12321, 1);
INSERT INTO line(inv_number,prod_code,line_units)
VALUES(1001,  65781, 3);
INSERT INTO line(inv_number,prod_code,line_units)
VALUES(1003,  83456, 2);
INSERT INTO line(inv_number,prod_code,line_units)
VALUES(1002,  34256, 6);
INSERT INTO line(inv_number,prod_code,line_units)
VALUES(1003,  12321, 5);
INSERT INTO line(inv_number, prod_code,line_units)
VALUES(1002,  12321, 6);
INSERT INTO line(inv_number, prod_code,line_units)
VALUES(1001,  83456, 3);
-- 4.product:
CREATE TABLE product( 
    prod_code integer, 
    prod_desc varchar(50), 
    prod_price integer, 
    prod_quant integer,
    vend_code integer,
    PRIMARY KEY(prod_code),
    FOREIGN KEY(vend_code) 
    REFERENCES Vendor(vend_code) 
);

INSERT INTO product(prod_code, prod_desc, prod_price, prod_quant, vend_code)
VALUES(12321, 'hammer', 189 ,20, 232);
INSERT INTO product(prod_code, prod_desc, prod_price, prod_quant, vend_code)
VALUES(65781, 'chain', 12, 45, 235);
INSERT INTO product(prod_code, prod_desc, prod_price, prod_quant, vend_code)
VALUES(34256, 'tape', 35, 60, 235);
INSERT INTO product(prod_code, prod_desc, prod_price, prod_quant, vend_code)
VALUES(83456, 'saw', 165, 15, 236);
INSERT INTO product(prod_code, prod_desc, prod_price, prod_quant, vend_code)
VALUES(12333, 'hanger', 200 ,10, 232);

-- 1.List the Product Code, Description, and Quantity for all products, sorted by Description.
SELECT prod_code, prod_desc, prod_quant
FROM product
ORDER BY prod_desc DESC;

-- 3.List the product code and product quantity for products in invoice number 1001, with line_units 3.
SELECT product.prod_code, product.prod_desc, product.prod_quant
FROM product
INNER JOIN line
ON product.prod_code = line.prod_code AND line.inv_number = 1001 AND line.line_units=3;

-- 4.List all product description and product price supplied by vendor whose vendor contact name is Anderson.
SELECT prod_desc, prod_price
FROM product
INNER JOIN vendor
ON product.vend_code = vendor.vend_code AND vendor.vend_contact = 'Anderson';


-- 5.Produce a list of product description, vendor name, and vendor phone for all products with quantity greater than 60
SELECT product.prod_desc, vendor.vend_name,vendor.vend_phone
FROM product
INNER JOIN vendor
ON product.vend_code = vendor.vend_code AND product.prod_quant = 60;

-- 5.vendor:
CREATE TABLE vendor( 
    vend_code integer,
    vend_name varchar(30),
    vend_contact varchar(30),
    vend_areacode integer,
    vend_phone integer,
    PRIMARY KEY(vend_code)
);

INSERT INTO vendor(vend_code, vend_name, vend_contact, vend_areacode, vend_phone)
VALUES(232, 'Bryson', 'Smith', 615, 2233234);
INSERT INTO vendor(vend_code, vend_name, vend_contact, vend_areacode, vend_phone)
VALUES(235, 'SuperLoo', 'Anderson', 615, 2158995);
INSERT INTO vendor(vend_code, vend_name, vend_contact, vend_areacode, vend_phone)
VALUES(236, 'Brett', 'Manko', 612, 3458695);


-- employee (employee_name, street, city)
-- works (employee_name, company name, salary)
-- company (company_name, city)
-- manages (employee_name, manager name)

-- 1.Find the names of all employees who work for First Bank Corporation.
SELECT employee_name
FROM employee
JOIN company
ON employee.employee_name = company.employee_name AND company.company_name = 'First Bank Corporation';
-- 2.Find all employees in the database who live in the same cities as the companies for which they work.
SELECT *
FROM employee
JOIN company
ON employee.employee_name = company.employee_name AND company.city = employee.city;
-- 3.Find all employees in the database who live in the same cities and on the same streets as do their managers.
SELECT emp.employee_name
FROM  employee emp
JOIN manages mngr ON emp.employee_name = mngr.employee_name
WHERE EXISTS (
    SELECT 1
    FROM empoloyee 
    WHERE employee_name = mngr.manager_name
    AND   street = emp.street
    AND   city = emp.city
);