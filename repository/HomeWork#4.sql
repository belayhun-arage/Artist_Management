-- 1- Find how many branches have loans between $4,000.00 and $26,000.00.  
-- HINT: Do not manually count the rows, have the DBMS engine do the work. 

SELECT count(*) from Loan WHERE amount BETWEEN 4,000.00 AND 26,000.00;

-- 2- For each branch, find the avg, min and max loan amount. Your output should include Branch Id, median loan amount for that Branch.  Remember: You can add more data to the tables if you want
SELECT branch_id, 
    max(amount) as MaxValue, 
    avg(amount) as AvgValue, 
    min(amount) as MinValue
from Loan
group by branch_id;
-- 3- Find how many accounts there are for each customer in MN. The output should include customer id and number of accounts for that customer. 
SELECT count(*) as number_of_accounts, customer_id
FROM Customer
NATURAL JOIN Depositor
ON Depositor.customer_id=Customer.customer_id
NATURAL JOIN Branch
ON Branch.branch_state_cd = 'MN';
NATURAL JOIN Account
ON Depositor.account_number=Account.account_number AND Account.branch_id=Branch.branch_id;


-- 4- Find the largest account balance for each Customer. The output should be a list of Customer Id, Customer Name for each Customer Id, and largest account balance for that Customer. 
SELECT Customer.customer_id, 
    max(amount) as MaxValue, 
from Customer
NATURAL JOIN Depositor
group by customer_id;
-- 5- Find Customer ID, Customer name and Customer State for all loans, sorted by Customer State, then Customer Name. 
SELECT customer_id, customer_last_name, customer_state_cd
FROM customer
NATURAL JOIN Borrower
ORDER BY customer_state_cd, customer_last_name;
-- 6- Find Customer ID, Customer name and the number of loans for each Customer. 
SELECT customer.customer_id, customer.customer_last_name
FROM customer
JOIN Borrower
ON Borrower.customer_id=customer.customer_id
GROUP BY customer_id;
-- 7- Find Loan number and Customer Id of the account with the lowest amount. 

-- 8- Create a view called Luck_Branch_V that contains Branch Id, Branch name, Customer ID and Customer Name for all the loans for each Branch that is in the city of Luck. 
CREATE or REPLACE VIEW Luck_Branch_V AS
SELECT DISTINCT Branch.branch_id, Branch.branch_name, Customer.customer_id, Customer.customer_last_name
FROM Customer
JOIN Borrower
ON Borrower.customer_id=Customer.Customer
JOIN Loan
ON Borrower.loan_number=Loan.loan_number
JOIN Branch
ON Loan.branch_id=Branch
WHERE branch_city='Luck'

-- 9- For each Customer in Denver, find the balance in their account(s).   
SELECT Account.balance
FROM Account
JOIN Customer
ON customer_city.customer_city='Denver'
JOIN Depositor
ON Depositor.customer_id=Customer.customer_id AND Depositor.account_number=Account.account_number
GROUP BY customer_city.customer_city;
-- 10- Find how many different accounts each customer has at each Branch. The output should be a list of Customer ID and for each Customer ID, the number of accounts for this customer by Branch ID. 

-- 11- Count how many customers live in the state of WI. 

SELECT * from loan;