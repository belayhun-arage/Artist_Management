-- I have added primary key constraint for refencing

-- PART 1
CREATE DATABASE HWTest;

CREATE TABLE Branch(
    branch_id serial PRIMARY KEY, 
    branch_name varchar(50), 
    branch_city varchar(50),
    branch_state_cd char(2), 
    assets numeric(11,2)
);

CREATE TABLE Loan(
    loan_number integer PRIMARY KEY, 
    branch_id integer, 
    amount numeric(8,2),
    foreign key (branch_id) references Branch(branch_id));

CREATE TABLE Customer(
    customer_id serial PRIMARY KEY, 
    customer_last_name varchar(30),
    customer_street varchar(30), 
    customer_city varchar(50),
    customer_state_cd char(2)
);

CREATE TABLE Borrower(
    customer_id integer, 
    loan_number integer,
	foreign key (customer_id) references Customer(customer_id),
	foreign key (loan_number) references Loan(loan_number));

CREATE TABLE Depositor(
    customer_id integer, 
    account_number integer,
    foreign key (customer_id) references Customer(customer_id),
	foreign key (account_number) references Account(account_number));
CREATE TABLE Account(
    account_number integer PRIMARY KEY, 
    branch_id integer, 
    balance numeric(8,2),
    foreign key (branch_id) references Branch(branch_id));
	


INSERT INTO Branch(branch_name,branch_city,branch_state_cd,assets)
VALUES('DowntownChi', 'Chicago', 'IL', 40000000.00);

INSERT INTO Branch(branch_name,branch_city,branch_state_cd,assets)
VALUES('UptownMPL', 'Minneapolis', 'MN', 32000000.00);

INSERT INTO Branch(branch_name,branch_city,branch_state_cd,assets)
VALUES('DowntownSP', 'St. Paul', 'MN', 21000000.00);

INSERT INTO Branch(branch_name,branch_city,branch_state_cd,assets)
VALUES('Lucky Spot', 'Luck', 'WI', 23000000.00);



INSERT INTO Loan(loan_number, branch_id,amount)
VALUES(1001, 1, 2008.08);

INSERT INTO Loan(    loan_number, branch_id,amount)
VALUES(1002, 1, 3201.06);

INSERT INTO Loan(    loan_number, branch_id,amount)
VALUES(1003, 2, 4508.03);

INSERT INTO Loan(    loan_number, branch_id,amount)
VALUES(1004, 3, 21008.00);

INSERT INTO Loan(    loan_number, branch_id,amount)
VALUES(1007, 4, 12903.00);

INSERT INTO Loan(    loan_number, branch_id,amount)
VALUES(1011, 4, 218934.34);

INSERT INTO Customer(customer_last_name, customer_street, customer_city, customer_state_cd)
VALUES('Gretzky', '14 S 6th St.', 'St. Paul', 'MN');

INSERT INTO Customer(customer_last_name, customer_street, customer_city, customer_state_cd)
VALUES('Carr', '16699 39th Ave N', 'Gary', 'IL');

INSERT INTO Customer(customer_last_name, customer_street, customer_city, customer_state_cd)
VALUES('Kilmer', '205 Dupont Ave. N', 'Minneapolis', 'MN');

INSERT INTO Customer(customer_last_name, customer_street, customer_city, customer_state_cd)
VALUES('Jones', '3598 Smith Rd.', 'Hopkins', 'MN');

INSERT INTO Customer(customer_last_name, customer_street, customer_city, customer_state_cd)
VALUES('Jones', '9873 5Th. St.', 'Cumberland', 'W');

INSERT INTO Borrower( customer_id, loan_number)
VALUES(4, 1001);

INSERT INTO Borrower( customer_id, loan_number)
VALUES(5, 1002);

INSERT INTO Borrower( customer_id, loan_number)
VALUES(2, 1003);

INSERT INTO Borrower( customer_id, loan_number)
VALUES(1, 1004);
INSERT INTO Borrower( customer_id, loan_number)
VALUES(2, 1007);
INSERT INTO Borrower( customer_id, loan_number)
VALUES(4, 1011);
-- 
INSERT INTO Depositor(customer_id, account_number)
VALUES(1, 232);

INSERT INTO Depositor(customer_id, account_number)
VALUES(2, 235);

INSERT INTO Depositor(customer_id, account_number)
VALUES(4, 294);

INSERT INTO Depositor(customer_id, account_number)
VALUES(1, 295);

INSERT INTO Depositor(customer_id, account_number)
VALUES(4, 249);

INSERT INTO Depositor(customer_id, account_number)
VALUES(5, 251);

INSERT INTO Depositor(customer_id, account_number)
VALUES(3, 271);

INSERT INTO Account(account_number, branch_id, balance)
VALUES(232, 3, 456.23);

INSERT INTO Account(account_number, branch_id, balance)
VALUES(235, 2, 4500.19);

INSERT INTO Account(account_number, branch_id, balance)
VALUES(294, 1, 6003.63);

INSERT INTO Account(account_number, branch_id, balance)
VALUES(295, 3, 7500.00);

INSERT INTO Account(account_number, branch_id, balance)
VALUES(251, 2, 2398.22);

INSERT INTO Account(account_number, branch_id, balance)
VALUES(249, 1, 670.85);

INSERT INTO Account(account_number, branch_id, balance)
VALUES(271, 4, 234718.19);

--------- Part3 -------------
-- 1
SELECT customer_last_name, customer_street, customer_city, customer_state_cd 
FROM Customer 
ORDER BY customer_last_name;

-- 2
SELECT loan_number, amount 
FROM Loan 
WHERE branch_id=1
ORDER BY amount;

-- 3
SELECT loan_number, amount 
FROM Loan 
WHERE branch_id IN (
    SELECT * FROM Branch 
    WHERE branch_name = 'UptownMPL' OR branch_name = 'ucky Spot');

-- 4
SELECT account_number 
FROM Account 
WHERE branch_id IN (
    SELECT * FROM Branch 
        WHERE branch_state_cd = "MN"
);

-- 5
SELECT loan_number
FROM Loan
WHERE branch_id IN (
    SELECT * FROM Branch
        WHERE branch_city = "Fargo"
);

-- 6
SELECT tblBranch.branch_name,tblCustomer.customer_last_name, tblCustomer.customer_last_name
FROM Branch tblBranch , Customer tblCustomer
WHERE branch_id IN (
    SELECT branch_id FROM Loan;
) and customer_id IN (
    SELECT customer_id FROM Borrower;
);

-------Part 4---------------
-- 1
-- correctly executed since it has one more attribue
INSERT INTO Customer(customer_id,customer_last_name, customer_street, customer_city, customer_state_cd)
VALUES(8,'‘Ford’', '19 15th Ave S', 'Granite City', 'WI');

-- 2
INSERT INTO Customer(customer_id,customer_last_name, customer_street, customer_city, customer_state_cd)
VALUES(2,'‘Crookston’', '21 1st Ave S', 'Fall City', 'WI');

-- 3
INSERT INTO Loan(    loan_number, branch_id,amount)
VALUES(1005, 3, 30000.00);

-- 4
INSERT INTO Account(    account_number, branch_id, balance)
VALUES(296, 1, 7500.00);

-- 5
INSERT INTO Loan(    loan_number, branch_id,amount)
VALUES(1006, 5, 45000.00);

-- 6
INSERT INTO Borrower( customer_id, loan_number)
VALUES(8, 1005);
