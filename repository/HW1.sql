
-- a)Find all loan numbers with a loan value greater than $10,000.
SELECT loan_number
FROM loan
WHERE loan.amount > 1000;
-- b)Find the names of all depositors who have an account with a value greater than $6,000.
-- SELECT customer.customer_name
-- from customer 
-- NATURAL JOIN depositor 
-- group by customer_id;

SELECT customer.customer_name
from customer
JOIN depositor
ON depositor.customer_name=customer.customer_name
JOIN account 
ON depositor.account_number=account.account_number AND account.balance > 6000
group by customer.customer_name;

-- c)Find the names of all depositors who have an account with a value greater than $6,000 at the “Uptown” branch.
SELECT customer.customer_name
from customer
JOIN depositor
ON depositor.customer_name=customer.customer_name
JOIN account 
ON depositor.account_number=account.account_number AND account.balance > 6000 AND account.branch_name = 'Uptown'
group by customer.customer_name;

-- person (driver id, name, address)
CREATE TABLE person
(
    driver_id NUMBER,
    driver_name VARCHAR2(20),
    driver_address VARCHAR2(30),
    PRIMARY KEY(driver_id)

);
-- car (license, model, year)
CREATE TABLE car
(
    license VARCHAR2(20),
    model VARCHAR2(20),
    production_year NUMBER,
    PRIMARY KEY(license)

);
-- accident (report number, date, location)
CREATE TABLE accident
(
    report_number NUMBER,
    report_date Date,
    report_location VARCHAR2(20),
    PRIMARY KEY(report_number)

);
-- owns (driver id, license)
CREATE TABLE accident
(
    driver_id NUMBER,
    license VARCHAR2(20),
    FOREIGN KEY(driver_id) 
    REFERENCES person(driver_id), 
    FOREIGN KEY(license) 
    REFERENCES car(license) 

);
-- participated (report number, license, driver id, damage amount)
CREATE TABLE participated
(
    report_number NUMBER,
    license VARCHAR2(20),
    driver_id NUMBER,
    damage_amount NUMBER,
    FOREIGN KEY(report_number) 
    REFERENCES accident(report_number), 
    FOREIGN KEY(license) 
    REFERENCES car(license),
    FOREIGN KEY(driver_id) 
    REFERENCES person(driver_id),  
);

a)Create a new course “CS-001”, titled “Weekly Seminar”, with 0 credits.
INSERT INTO course(course_id, title, credits)
VALUES('CS-001', 'Weekly Seminar', 0);

b)Create a section of this course in Autumn 2009, with section id of 1.

create table section
(course id varchar (8),
sec id varchar (8),
semester varchar (6),
year numeric (4,0),
building varchar (15),
room number varchar (7),
time slot id varchar (4),
primary key (course id, sec id, semester, year),
foreign key (course id) references course);

INSERT INTO section(course_id, sec_id, semester, year)
VALUES('CS-001', 1, 'Autumn',2009);


Cars table
car_id
car_name
model
color
country_of_production
sitting_capacity


Customer Table
customer_id
phone_number
address

Order Table
order_id
customer_id
car_id
order_date
delivary_date
order_price
