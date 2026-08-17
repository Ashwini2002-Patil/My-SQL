DROP DATABASE banking_db;

create database Banking_db;
use Banking_db;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AccountCreationDate DATE
);

select * from Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);
select * from Accounts;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);
select * from Transactions;

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
select * from Branches;

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);
select * from AccountBranches;

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
select * from Loans;

ALTER TABLE Customers
ADD DateOfBirth DATE;
select * from Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE AccountBranches;


alter table Accounts
add column CustomerID INT;
select * from Accounts;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

select * from Customers;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);
select * from Customers;



INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');
select * from Customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);
select * from Accounts;

SET SQL_SAFE_UPDATES=0;

UPDATE Customers
SET Phone='9999999999'
WHERE CustomerID=101;

select * from Customers;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;
select * from Customers;

SELECT * FROM Customers
WHERE CustomerID = 101;

DELETE FROM Transactions
WHERE TransactionID = 302;
SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;

SELECT * FROM Accounts;

SELECT * FROM Customers;
SELECT FirstName, LastName, Email, Phone
FROM Customers;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings';

SELECT *
FROM Accounts
WHERE Balance > 25000;

SELECT *
FROM Transactions
WHERE Amount BETWEEN 5000 AND 20000;

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,103);

SELECT *
FROM Customers
WHERE FirstName LIKE 'R%';

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT DISTINCT AccountType
FROM Accounts;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 2;

SELECT *
FROM Customers
WHERE Phone IS NULL;

SELECT *
FROM Customers
WHERE Email IS NOT NULL;

SELECT AccountID,
       Balance,
       CASE
           WHEN Balance >= 50000 THEN 'Premium Account'
           WHEN Balance >= 25000 THEN 'Standard Account'
           ELSE 'Basic Account'
       END AS AccountCategory
FROM Accounts;

SELECT AccountID,
       Balance,
       RANK() OVER (ORDER BY Balance DESC) AS BalanceRank
FROM Accounts;

SELECT TransactionID,
       Amount,
       SUM(Amount) OVER (ORDER BY TransactionDate) AS RunningTotal
FROM Transactions;

SELECT TransactionID,
       Amount,
       AVG(Amount) OVER () AS AverageTransaction
FROM Transactions;



SELECT *
FROM Customers
WHERE FirstName LIKE 'A%';

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(1, 'Rahul', 'Sharma', 'rahul.sharma@gmail.com', 9999999999, '2024-01-10', '1998-04-15'),
(2, 'Priya', 'Patil', 'priya@gmail.com', 9988776655, '2024-02-15', '2000-09-20'),
(3, 'Amit', 'Patel', 'amit.patel@gmail.com', 9876500001, '2024-03-20', '1995-06-18'),
(4, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', 9876500002, '2024-04-12', '1997-09-12'),
(5, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', 9876500003, '2024-05-25', '1993-11-25');

SELECT *
FROM Customers
WHERE Email LIKE '%gmail%';

SELECT *
FROM Customers
WHERE LastName LIKE '%kar';

SELECT *
FROM Accounts
WHERE AccountType IN ('Savings', 'Current');

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit', 'Withdrawal');

SELECT *
FROM Customers
WHERE CustomerID IN (101,102,105);

SELECT *
FROM Customers
ORDER BY LastName ASC;

SELECT *
FROM Accounts
ORDER BY Balance DESC;

SELECT *
FROM Transactions
ORDER BY TransactionDate DESC;

SELECT *
FROM Accounts
ORDER BY Balance DESC
LIMIT 5;

SELECT *
FROM Customers
LIMIT 3;

SELECT *
FROM Transactions
LIMIT 5 OFFSET 3;

SELECT *
FROM Accounts
WHERE AccountType = 'Savings'
ORDER BY Balance DESC;

SELECT *
FROM Customers
WHERE FirstName LIKE 'S%'
LIMIT 5;

SELECT *
FROM Transactions
WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC;

