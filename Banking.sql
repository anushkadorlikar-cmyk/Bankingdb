show databases;
-- CREATE DATABASE BankingDB;
-- USE Bankingdb;
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(15),
AccountCreationDate DATE 
);

describe customers;

select * from customers;
CREATE TABLE Accounts (
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

describe Accounts;

CREATE TABLE Transactions (
TransactionID INT,
TransactionDate DATE,
Amount DECIMAL(10,2),
TransactionType VARCHAR(20)
);

describe Transactions;

CREATE TABLE Branches (
BranchID INT,
BranchName VARCHAR(100),
BranchAddress VARCHAR(200),
BranchPhone VARCHAR(15)
);

describe Branches;

CREATE TABLE AccountBranches (
AssignmentDate date
);

CREATE TABLE Loans (
LoanID INT,
LoanAmount DECIMAL(10,2),
InterestRate DECIMAl (5,2),
StartDate DATE,
EndDate DATE 
);

describe Loans;

ALTER TABLE Customers 
ADD DateOfBirth DATE;

describe Customers;
ALTER TABLE Customers
Modify Phone VARCHAR(20);
describe Customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

DROP TABLE accountbranches;
ALTER TABLE Accounts
ADD CustomerID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts
ADD CONSTRAINT primary_key
PRIMARY KEY (AccountID);

ALTER TABLE customers
MODIFY FirstName VARCHAR(50) NOT NULL;
ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);

ALTER TABLE branches
ADD CONSTRAINT Primary_Key
PRIMARY KEY (BranchID);

ALTER TABLE Accounts
ADD BranchID INT ;
ALTER TABLE accounts
ADD CONSTRAINT FK_Branch_Customers
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);


ALTER TABLE Accounts
ADD CONSTRAINT Primary_key
PRIMARY KEY (AccountID);

ALTER TABLE Transactions
ADD AccountID INT;
ALTER TABLE Transactions
ADD CONSTRAINT FK_Account_Customers
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Customers
ADD CONSTRAINT Primary_Key
PRIMARY KEY (CustomerID);

ALTER TABLE Loans
ADD CONSTRAINT PK_Loans
PRIMARY KEY (LoanID);

ALTER TABLE Loans
ADD  CustomerID INT;
ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

-- SELECT
-- CONSTRAINT_NAME,
-- CONSTRAINT_TYPE
-- FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
-- WHERE TABLE_SCHEMA = 'bankingdb'
-- AND TABLE_NAME = 'Accounts';

-- SHOW CREATE TABLE Accounts;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul2@gamil.com','987654321','1998-04-15');
select * from customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
values
(201,101,'Savings',25000);

Select * from customers;
Select * from Accounts;

ALTER TABLE Accounts 
ADD BranchID INT;

INSERT INTO Customers
VALUES
(102,'Ketan','Tiwari','Ketan@gamil.com','8847851241','2026-08-05','2000-06-22');
select * from customers;
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone,AccountCreationDate,DateOfBirth)
VALUES
(103,'Neha','Singh','neha@gamil.com','987654321','2026-08-03','1998-04-15'),
(104,'Mukul','Jha','mukul2@gamil.com','987654321','2026-02-01','1995-11-06');
select * from customers;
select * from Account;
UPDATE Customers 
set AccountCreationDate = '2025-06-29'
where CustomerID = 101;



























