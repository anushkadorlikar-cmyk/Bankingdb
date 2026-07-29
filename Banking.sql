-- Show databases;
-- Create database BankingDB 
USE bankingdb;
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR (50),
LastName VARCHAR (50),
Email VARCHAR (100),
Phone VARCHAR (15),
AccountCreationDate DATE
);

describe Customers;

select * from customers;
create table Account (
AccountID int,
AccountType VARCHaR(20),
Balacne DECIMAL (10,2)
);

describe Account;

create table transactions (
TransactionID INT,
TransactionDate date,
Amount DECIMAL (10,2),
TransactionType varchar (20)
);

describe transactions;

create table Branches (
BrancheID INT,
BrancheName varchar (100),
BranchesAddress varchar(200),
BranchesPhone varchar (15)
);

desc Branches;

create table Loans (
LoanID INT,
LoanAmount decimal (10,2),
Interestamount decimal (5,2),
StartDate DATE,
EndDate date
);

desc Loans;




