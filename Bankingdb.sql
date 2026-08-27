-- show databases;
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

ALTER TABLE Transactions
ADD CONSTRAINT Primary_key
PRIMARY KEY (TransactionID);
ALTER TABLE Accounts
ADD TransactionID INT;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Transation_Customers
FOREIGN KEY (TransactionID)
REFERENCES Transactions(TransactionID);
ALTER TABLE Accounts
DROP COLUMN TransactionID;
ALTER TABLE Accounts
DROP FOREIGN KEY
FK_Transaction_Customers;
ALTER TABLE Accounts
DROP FOREIGN KEY  FK_Transation_Customers;
ALTER TABLE Accounts
DROP COLUMN TransactionID;

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
(101, 'Rahul','Sharma','rahul2@gmail.com','9876543210','1998-04-15');
SELECT * from Customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);
SELECT * from Accounts;

INSERT INTO Customers
VALUES
(102, 'Ketan','Tiwari','ketan2@gmail.com','8838938284','2026-08-05','2000-06-22');
SELECT * from Customers;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateOfBirth)
VALUES
(103, 'Neha','Singh','neha2@gmail.com','9277476727','2026-08-03','1992-07-03'),
(104, 'Mukul','Jha','mukul2@gmail.com','7929267534','2025-02-01','1995-11-06');
select * from customers;

UPDATE Customers
SET AccountCreationDate='2024-07-06'
WHERE CustomerID=101;
select * from customers;

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
('001','NagpurBranch','NagpurMaharshtra','7122456789'),
('002','MunbaiBranch','MumbaiMaharshtra','9087678745'),
('003','PuneBranch','PuneMaharshtra','9987236510'),
('004','VasaiBranch','VasaiMaharshtra','9034895274'),
('005','SakoliBranch','SakoliMaharshtra','3695747790');
describe branches;
SELECT * FROM Branches;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance, BranchID)
VALUES
(202,102,'Savings',25000,'002'),
(203,103,'Current',30000,'003'),
(204,104,'Savings',60000,'004');
select * from accounts;

UPDATE Accounts
SET BranchID='001'
WHERE AccountID=201;
select * from accounts;

UPDATE Accounts
SET BranchID='002'
WHERE AccountID=202;
select * from accounts;

UPDATE Accounts
SET BranchID='003'
WHERE AccountID=203;
select * from accounts;

UPDATE Accounts
SET BranchID='004'
WHERE AccountID=204;
select * from accounts;
describe Loans;

INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301,'50000','7.50','2026-01-01','2027-01-01',101),
(302,'10000','7.50','2026-02-01','2027-02-01',102),
(303,'30000','8.00','2026-03-01','2027-03-01',103),
(304,'75000','8.50','2026-04-01','2027-04-01',104);
SELECT * FROM Loans;

INSERT INTO Transactions
(TransactionID, TransactionDate, Amount, TransactionType, AccountID)
VALUES
(401,'2025-07-03','10000.00','Deposite',201),
(402,'2026-07-05','30000.00','Withdrawal',202),
(403,'2025-09-04','75000.00','Transfer',203),
(404,'2026-01-03','60000.00','Deposite',204);
SELECT * FROM Transactions;

INSERT INTO Customers
 VALUES
 (105, 'Karan','Mehta','karan2@gmail.com','7449856230','2024-08-07','1997-05-15');
 select * from customers;
 
 INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance, BranchID)
VALUES
(205,105,'Savings','56000',5);
select * from accounts;

INSERT INTO Transactions
(TransactionID, TransactionDate, Amount, TransactionType, AccountID)
VALUES
(405,'2025-06-04','19000.00','Deposite',205);
select * from transactions;


UPDATE Accounts
SET Balance = 35000
WHERE CustomerID=101;
select * from accounts;

UPDATE Accounts
SET Balance = Balance + 2000
WHERE CustomerID=102;
select * from accounts;

UPDATE Customers
SET Email ='rahul03@gmail.com', 
Phone = '9373370918'
WHERE CustomerID=101;
select * from customers;

SELECT 
    CustomerID, FirstName, LastName, Phone
FROM
    Customers;
    SELECT * FROM Accounts
    WHERE AccountType<>'Savings';
    SELECT * FROM Accounts
    WHERE Balance>30000;
    
   SELECT * FROM Accounts
   WHERE Balance>=30000 && AccountType='Savings';  -- use And or && in Syntax use OR or || in Syntax
   SELECT * FROM Accounts;
   
   SELECT * FROM Accounts 
   WHERE NOT AccountType = 'Savings';
   SELECT * FROM Accounts;
   
   SELECT FirstName, LastName, AccountCreationDate
   FROM Customers
   WHERE AccountCreationDate >'2025-02-01';
   
  SELECT FirstName, LastName, Phone
FROM
    Customers
WHERE
    Phone IN ('9373370918' , '8838938284', '9277476727');
    
     SELECT FirstName, LastName, Phone
     FROM Customers
   WHERE Phone='9373370918' OR Phone='8838938284' OR Phone='9277476727';
   
   -- Between Operator
   -- Find Customers having balance between 10000 to 50000
   SELECT AccountID, CustomerID, Balance
   FROM Accounts
   WHERE Balance BETWEEN 10000 AND 50000;
   -- The Values Specified in the Range are included in the results.
   SELECT AccountID, CustomerID, Balance
   From Accounts
   WHERE Balance >=10000 AND Balance<=50000;
   
   -- LIKE OPERATOR
  --  FIND ALL CUSTOMERS WHOSE FIRST NAME STARTS WITH LETTER "K" 
   SELECT * FROM Customers
   WHERE FirstName LIKE 'K%';
   -- FIND ALL CUSTOMERS WHOSE LAST NAME END WITH LETTER "A" 
   -- % matches any number of characters and zero character
   SELECT * FROM Customers
   WHERE LastName LIKE '%a';
   -- FIND ALL CUSTOMERS WHOSE LAST NAME HAS EXACTLY 3 CHARACTERS 
   -- "_" Matches exactly one character.
   SELECT * FROM Customers
   WHERE LastName LIKE '___';
  -- ORDER BY CLAUSE
  -- SORT THE ACCOUNTS TABLE ACCORDIMG TO CUSTOMERS BALANCE
   SELECT AccountID, AccountType, Balance
   FROM Accounts
   ORDER BY Balance;
   -- SORT THE BRANCHES TABLE ACCORDIMG TO BRANCHNAME
   SELECT BranchID, BranchName
   FROM Branches
   ORDER BY BranchName;
  --  SORT THE ACCOUNTS TABLE ACCORDIMG TO CUSTOMERS BALANCE FROM HIGHEST TO LOWEST AMOUNT
   SELECT AccountID, AccountType, Balance
   FROM Accounts
   ORDER BY  Balance DESC;
   -- SORT ACCORDING TO MULTIPLE COLUMNS
   -- SORT ACCOUNTS TABLE ACCORDING TO THE ACCOUNTYPE AND BALANCE
    SELECT AccountID, AccountType, Balance
   FROM Accounts
   ORDER BY  Balance DESC,  AccountType DESC;
   -- DISTINCT CLAUSE
   -- FIND DISTINCT (UNIQUE) ACCOUNT TYPES FROM ACCOUNTS TABLE
   SELECT DISTINCT AccountType FROM Accounts;
  --  FIND DISTINCT (UNIQUE) TRANSACTION TYPES ACCOUNTID FROM TRANSACTIONS TABLE
  SELECT DISTINCT TransactionType, AccountID FROM Transactions;
  Select * From Customers
  LIMIT 2;
   Select * From Customers
  LIMIT 4;
  
  Select * From Accounts
  LIMIT 3 OFFSET 2;
  SELECT * FROM Accounts
  ORDER BY Balance DESC
  LIMIT 2;
  SELECT * FROM Accounts
  ORDER BY Balance DESC
  LIMIT 1 OFFSET 2;
  SELECT * FROM Accounts
  ORDER BY Balance DESC
  LIMIT 2,1;    --  Here 1 Specifies the  number of rows to return (output) and 2 specifies the the rows to skip
INSERT INTO Customers
VALUES
('106', 'Shina','Rathod','shina2@gmail.com', NULL, '2025-01-03','1999-02-04'),
('107', 'Rina','Meher','rina2@gmail.com', NULL, '2025-03-09','1996-04-02'),
('108', 'Tina','Rana','tina2@gmail.com', '9845786460', '2024-01-03','1990-03-08'),
('109', 'Raj','Rawat','raj2@gmail.com', NULL, '2025-01-07','1998-05-06');

SELECT * FROM Customers
WHERE Phone IS NULL;

SELECT * FROM Customers
WHERE Phone IS NOT NULL;

SELECT * FROM Accounts;
SELECT * FROM Transactions;
SELECT * FROM Customers;
SELECT * FROM Loans;
SELECT * FROM Branches;

INSERT INTO Accounts
VALUES
(206,'Current','40000','106','2'),
(207,'PPF','49000','107','5'),
(208,'Savings','59000','108','1');

INSERT INTO Transactions
VALUES
(406,'2024-04-03','40000','Withrawal','206'),
(407,'2026-07-08','90000','Deposite','207'),
(408,'2025-09-03','88000','Deposite','208');

INSERT INTO Loans
VALUES
(305,'30000','8.00','2025-01-02','2026-06-05','105'),
(306,'20000','7.40','2023-01-02','2024-03-06','106'),
(307,'15000','8.10','2022-04-08','2025-06-04','107'),
(308,'19000','8.00','2023-05-04','2025-06-04','108');

SELECT AccountID, AccountType, Balance,
 CASE
 WHEN Balance>50000 THEN 'HIGH VALUE CUSTOMER'
 ELSE 'LOW VALUE CUSTOMER'
 END AS 'CustomerCategory'
 FROM Accounts;
 
--  Display the CustomerID, FirstName and Email of customers whose AccountCreationDate is after 1-Jan-2025.
SELECT CustomerID, FirstName, Email
FROM Customers
WHERE AccountCreationDate >='2025-01-01';


-- Display all Savings accounts having balance greater than ₹20,000.
SELECT * FROM Accounts
WHERE AccountType='Savings' AND balance >20000;
-- Display customers whose Phone number is NOT NULL.
SELECT * FROM Customers
WHERE Phone IS NOT NULL;

-- Display distinct Account Types available in the Accounts table.
SELECT DISTINCT AccountType FROM Accounts;

-- Display customers whose FirstName starts with 'R'.
  SELECT * FROM Customers
   WHERE FirstName LIKE 'R%';

-- Display accounts having Balance between ₹20,000 and ₹60,000.
SELECT * FROM Accounts
   WHERE Balance BETWEEN 30000 AND 60000;

-- Display all Deposit transactions whose amount is greater than ₹3000.
SELECT * FROM Transactions
WHERE TransactionType='Deposite' And Amount>=3000;

-- Display customers whose CustomerID is IN (101,103,106,109).
SELECT * FROM Customers
WHERE CustomerID IN (101,103,106,109);

-- Display first 5 customers ordered by CustomerID.
 Select * From Customers
  LIMIT 5;

-- Display customers after skipping first 3 records.
 Select * From Customers
LIMIT 5 OFFSET 3;
-- Display Savings accounts having balance between ₹20,000 and ₹80,000.
SELECT * FROM Accounts
   WHERE AccountType='Savings' AND Balance BETWEEN 20000 AND 80000;

-- Display customer names whose phone number is NULL and account was created after 2025-01-01.
SELECT * FROM Customers
WHERE Phone IS NULL AND AccountCreationDate >'2025-01-01';

-- Display all customers whose FirstName starts with 'A' OR LastName starts with 'S'.
SELECT * FROM Customers
WHERE FirstName Like 'A%' or LastName Like 'S%';

-- Display all accounts whose AccountType is Savings or Salary and balance is greater than ₹10,000.
SELECT * FROM Accounts
WHERE AccountType ='Savings' or Balance >10000;

-- Display customers whose CustomerID is IN (101,102,105,109) and phone number is not NULL.
SELECT * FROM Customers
WHERE CustomerID IN (101,102,105,109) AND Phone IS NOT NULL;

-- Display transactions whose Amount is between ₹2,000 and ₹8,000 and TransactionType is Deposit.
SELECT * FROM Transactions
Where TransactionType='Deposite' AND Amount Between 10000 and 80000;

-- Display distinct BranchIDs from Accounts where balance is greater than ₹30,000.
SELECT DISTINCT BranchID FROM Accounts 
WHERE Balance >=30000;

-- Display customers whose email contains gmail and first name ends with a.
SELECT * FROM Customers
WHERE Email LIKE '%gmail%'
AND FirstName LIKE'%A';

-- Display customers whose DateOfBirth is between 1995 and 2000.
SELECT * FROM Customers
WHERE DateOfBirth BETWEEN '1995-01-01' AND '2000-01-01';

-- Display first 3 Savings accounts having balance greater than ₹25,000.
SELECT * FROM Accounts
WHERE AccountType='Savings' AND Balance>25000 LIMIT 3;

-- Display customers whose FirstName starts with 'R' and Phone IS NULL.
SELECT * FROM Customers
WHERE FirstName LIKE 'R%'
AND Phone IS NULL;

-- Display accounts whose balance is NOT BETWEEN ₹20,000 and ₹50,000.
SELECT * FROM Accounts 
WHERE Balance NOT BETWEEN '20000' AND '50000';

-- Display customers whose CustomerID is NOT IN (101,102,103).
SELECT * FROM Customers
WHERE CustomerID NOT IN (101,102,103);
-- Display transactions that are Withdrawal and amount is less than ₹5000.
SELECT * FROM Transactions
WHERE TransactionType ='Withdrawal' AND Amount<50000;
UPDATE Transactions SET TransactionType='Withdrawal' WHERE TransactionID = 406;

-- Display customers whose email ends with gmail.com and phone number is available.
SELECT * FROM Customers
WHERE Email LIKE '%gmail%' AND Phone IS NOT NULL;

-- Display distinct transaction types whose amount is greater than ₹5000.
SELECT DISTINCT TransactionType  From Transactions WHERE Amount >5000;

-- Display all Savings accounts belonging to Branch 1 or Branch 3.
SELECT * FROM Accounts
WHERE AccountType ='Savings' AND BranchID IN (1 , 3);

-- Display customers whose first name contains 'an' and DateOfBirth is after 1997.
SELECT * FROM Customers
WHERE FirstName like '%an%' AND DateOfBirth >'1997-01-01';

-- Display accounts whose balance is greater than ₹30,000 but less than ₹80,000.
SELECT * FROM Accounts
WHERE Balance >30000 And Balance<80000;

-- Display first 4 Deposit transactions after skipping first 2 deposits.
SELECT * FROM Transactions
WHERE TransactionType='Deposite' LIMIT 4 OFFSET 2;

-- 31.Display customer names whose phone number is NULL OR email starts with s.
SELECT * FROM Customers 
WHERE Phone IS NULL OR Email LIKE 'S%';

-- 32.Display Savings accounts having balance greater than ₹10,000 AND belonging to Branch 1.
SELECT * FROM Accounts
WHERE AccountType='Savings' AND Balance>10000 AND BranchID =1;

-- 33.Display Current accounts having balance between ₹40,000 and ₹1,00,000.
SELECT * FROM Accounts
WHERE AccountType='Current' AND Balance BETWEEN 40000 and 100000;

-- 34.Display customers whose last name starts with S and were created after 2024.
SELECT * FROM Customers
WHERE LastName LIKE 'S%' AND AccountCreationDate >2024-01-01;

-- 35.Display transactions whose amount is IN (10000,30000,60000,75000).
SELECT * FROM Transactions
WHERE Amount IN (10000,30000,60000,75000);
-- 36.Display customers whose first name starts with R or P, phone number is available and CustomerID is greater than 103.(CONFUSION)
SELECT * FROM Customers
WHERE (FirstName LIKE 'R%' OR FirstName LIKE'P%') AND Phone IS NOT NULL AND CustomerID>103;
select * from customers;

-- 37.Display distinct balances greater than ₹15,000.
SELECT DISTINCT Balance FROM Accounts WHERE Balance >15000;

-- 38.Display all accounts except Savings accounts having balance above ₹25,000.
SELECT * FROM Accounts
WHERE AccountType != 'Savings' AND Balance>25000;

-- 39.Display customers whose email contains gmail but phone number is missing.
SELECT * FROM Customers 
WHERE Email LIKE '%gmail%' AND Phone IS NULL;

-- 40.Display accounts whose balance is between ₹15,000 and ₹90,000 and AccountType is not Salary.
SELECT * FROM Accounts
WHERE Balance BETWEEN 15000 AND 90000 AND AccountType <> 'Salary';

-- 41.Display first 5 customers whose FirstName starts with A or R, ordered by CustomerID.
SELECT * FROM Customers
WHERE FirstName LIKE 'A%' OR FirstName LIKE 'R%' order by CustomerID LIMIT 5;

-- 42.Display Savings and Salary accounts whose balance is greater than ₹15,000 and less than ₹60,000.
SELECT * FROM Accounts
WHERE AccountType = 'Savings' or AccountType = 'Salary' AND Balance<15000 AND Balance >60000;

-- 43.Display customers whose CustomerID is IN (101,103,105,107,109) and DateOfBirth is between 1994 and 2000.
SELECT * FROM Customers 
WHERE CustomerID IN (101 ,103, 105, 107, 109) AND DateOfBirth BETWEEN 1994-01-01 AND 2000-01-01;

-- 44.Display transactions whose amount is greater than ₹2000 but less than ₹8000 and TransactionType is not Withdrawal.
SELECT * FROM Transactions
WHERE Amount >20000 and Amount <80000 AND TransactionType <>'Withdrawal';

-- 45.Display customers whose phone number is NULL or FirstName contains 'an'.
SELECT * FROM Customers 
WHERE Phone IS NULL AND FirstName LIKE '%AN%';

-- 46.Display distinct AccountTypes where balance is greater than ₹20,000.
SELECT DISTINCT AccountType 
FROM Accounts
WHERE Balance >20000 ;

-- 47.Display customers after skipping first 2 records and display only the next 4 records.
SELECT * FROM Customers LIMIT 4 OFFSET 2;

-- 48.Display customers whose last name ends with 'kar' and email contains gmail.
SELECT * FROM Customers 
WHERE LastName LIKE '%kar' AND  Email LIKE '%gmail%';

-- 49.Display accounts whose BranchID is IN (1,2) and balance is between ₹20,000 and ₹70,000.
SELECT * FROM Accounts
WHERE Branchid IN (1,2) AND Balance BETWEEN 20000 AND 70000;

-- 50.Display all customers whose first name starts with S, phone number is not NULL, and account was created between 1-Jan-2025 and 31-Dec-2025.
SELECT * FROM Customers 
WHERE FirstName LIKE 'S%' AND Phone IS NOT NULL AND AccountCreationDate BETWEEN '2025-01-01' AND '2025-12-31';

-- 1.Display all customers whose first name starts with 'R' or 'S' but whose phone number is NULL.
SELECT * FROM Customers 
WHERE (FirstName LIKE 'R%' OR FirstName  LIKE 'S%') AND Phone IS NULL;

-- 2.Display all accounts that are not Savings accounts and have a balance greater than ₹30,000.
SELECT * FROM Accounts
WHERE AccountType <>'Savings' AND Balance >30000;
 
-- 3.Display customers whose CustomerID is not 101, 102, or 103.
SELECT * FROM Customers WHERE CustomerID NOT IN (101,102,103);

-- 4.Display customers whose email does not end with "gmail.com
SELECT * FROM Customers
WHERE Email NOT LIKE '%gmail.com%';

-- 5.Display accounts whose balance is not between ₹20,000 and ₹50,000.
SELECT * FROM Accounts 
WHERE Balance NOT BETWEEN 20000 AND 50000;

-- Categorize the deposits in the transactions table as per condition given
-- if above  10000(included) High Amount 
-- if 5000(include) to 10000 Medium amount
-- into 500 low amount
-- for transaction type withdrawal "Not Applicable"

SELECT * , 
CASE
 WHEN  TransactionType = "Deposite" AND Amount >=10000 THEN "High Amount"
 WHEN  TransactionType ="Deposite" AND  Amount >= 5000 THEN "Medium Amount"
 WHEN  TransactionType = "Deposite" AND Amount <5000 THEN "Low Amount"
 ELSE "Not Applicable"
 END AS "TransactionCategory"
 From Transactions;
 
 SELECT CustomerID , UPPER (FirstName) , UPPER (LastName)
 FROM Customers;

SELECT CustomerID , LOWER (FirstName) , LOWER (LastName)
 FROM Customers;
 
 SELECT LastName , LENGTH(LastName) FROM Customers;
 SELECT LENGTH ("NAGPUR") AS CHARACTERS; -- gives o/p in number of bytes
 SELECT char_length("Nagpur"); -- gives o/p in nmber of characters
 SELECT LENGTH ("नागपूर"); -- gives o/p in number of bytes 
 SELECT char_length("नागपूर"); -- gives o/p in nmber of characters
 
 SELECT CONCAT("APEKSHA"," ","ATKARE") AS MyName;
  SELECT  CustomerID, CONCAT (FirstName," ",LastName) as FullName, Phone FROM Customers;
  
  SELECT SUBSTRING("Hello World", 1,5);
  
SELECT  CustomerID, Phone, CONCAT(SUBSTRING(FirstName,1,1),".", SUBSTRING(LastName,1)) AS FULLNAME From Customers;

-- 6.Display all transactions except Deposit transactions.
SELECT * FROM Transactions
WHERE TransactionType <>'Deposite';

-- 7.Display customers whose first name contains the letter 'a' but does not start with 'A'.
SELECT * FROM Customers
WHERE FirstName LIKE '%A%';

-- 8.Display distinct account types except Current.
 SELECT DISTINCT AccountType FROM Accounts WHERE AccountType <>'Current' ;


-- 9.Display customers who have phone numbers available but were created before 2025.
SELECT * FROM Customers
WHERE Phone IS NOT NULL AND AccountCreationDate<'2025-01-01';

-- 10.Display first 3 Savings accounts after skipping the first 2 Savings accounts.
SELECT * FROM Accounts WHERE AccountType ='Savings' LIMIT 3 OFFSET 2;

-- Tricky Level 2
-- 11.Display customers whose CustomerID is between 101 and 110 but not equal to 105 or 108.
SELECT * FROM Customers WHERE (CustomerID BETWEEN '101' AND '110') AND  CustomerID NOT IN( 105 ,108);

-- 12.Display transactions whose amount is greater than ₹20000 but not equal to ₹50000.
SELECT * FROM Transactions WHERE Amount>20000 AND Amount<50000;

-- 13.Display customers whose last name starts with 'S' and email contains gmail but phone number is NULL.
SELECT * FROM Customers WHERE LastName LIKE 'R%' AND Email LIKE '%gmail%' AND Phone IS NULL;

-- 14.Display accounts having balance between ₹15,000 and ₹60,000 but not belonging to Branch 2.
SELECT * FROM Accounts WHERE Balance BETWEEN 15000 AND 60000 AND BranchID <>2;

-- 15.Display customers whose FirstName starts with 'P' or ends with 't'.
SELECT * FROM Customers WHERE FirstName LIKE 'S%' OR FirstName LIKE '%T';

-- 16.Display accounts whose AccountType is Savings or Salary but balance is not between ₹10,000 and ₹40,000.
SELECT * FROM Accounts WHERE AccountType IN ('Savings','Salary') AND Balance NOT BETWEEN 10000 AND 40000;

-- 17.Display customers whose DateOfBirth is after 1995 but before 2000.
SELECT * FROM Customers WHERE DateOfBirth > '1995-01-01' AND  DateOfBirth < '2000-01-01';

-- 18.Display customers whose email contains gmail but FirstName does not contain 'a'.
SELECT * FROM Customers WHERE Email LIKE '%gmail%' AND FirstName NOT LIKE '%A%';

-- 19.Display transactions whose amount is between ₹2000 and ₹8000 but TransactionType is not Withdrawal.
SELECT * FROM Transactions WHERE Amount BETWEEN 20000 AND 80000 AND TransactionType <>'Withdrawal';

-- 20.Display only the next 5 customers after skipping the first 4 customers.
SELECT * FROM Customers WHERE CustomerID LIMIT 5 OFFSET 4;

-- Tricky Level 3 (Logical Confusion)
-- 21.Display all Savings accounts having balance greater than ₹20,000 OR belonging to Branch 1.
-- (Students often mistakenly use AND.)
SELECT * FROM Accounts WHERE AccountType ='Savings' or BranchID ='1';

-- 22.Display all customers whose phone is NULL OR email contains gmail.
SELECT * FROM Customers WHERE Phone IS NULL OR Email LIKE '%gmail%';


-- 23.Display customers whose FirstName starts with 'A' or 'R' and whose CustomerID is greater than 105.
-- (Requires proper use of parentheses.)
SELECT * FROM Customers WHERE FirstName LIKE 'A%' OR FirstName LIKE 'R%' AND CustomerID >105;

-- 24.Display customers whose CustomerID is NOT IN (101,103,105) and phone number is NOT NULL.
SELECT * FROM Customers WHERE CustomerID NOT IN (101,103,105) AND Phone IS NOT NULL;

-- 25.Display accounts whose balance is less than ₹30,000 OR greater than ₹80,000.
SELECT * FROM Accounts WHERE Balance <30000 or Balance >80000;

-- 26.Display transactions whose amount is NOT BETWEEN ₹3000 and ₹7000.
SELECT * FROM Transactions WHERE Amount NOT BETWEEN 30000 AND 70000;

-- 27.Display customers whose last name ends with 'kar' OR starts with 'S'.
SELECT * FROM Customers WHERE LastName Like '%kar' or LastName Like 'S%';

-- 28.Display customers whose email starts with 'a' OR phone number is NULL, but whose CustomerID is greater than 105.
-- (Requires parentheses:
-- (condition1 OR condition2) AND condition3.)
SELECT * FROM Customers WHERE (Email LIKE 'A%' OR Phone IS NULL) AND CustomerID>105;

-- 29.Display all accounts except Savings having balance between ₹25,000 and ₹60,000.
SELECT * FROM Accounts WHERE AccountType ='Savings' AND Balance BETWEEN 25000 AND 60000;

-- 30.Display customers whose FirstName starts with 'R', Phone IS NOT NULL, CustomerID is between 101 and 110, and AccountCreationDate is after 2024-12-31.
SELECT * FROM Customers WHERE FirstName LIKE 'R%' OR Phone IS NOT NULL OR CustomerID BETWEEN 101 AND 110 AND  AccountCreationDate >2024-12-31;

-- Bonus Questions (Designed to Catch Common Mistakes)
-- These are excellent practical exam questions because students often make logical errors.
-- 31.Display customers whose FirstName starts with 'A' or 'S' and Phone IS NOT NULL.
SELECT * FROM Customers WHERE FirstName LIKE 'A%'OR FirstName LIKE 'S%'AND Phone IS NOT NULL;

-- 32.Display customers whose Phone IS NULL and CustomerID is not in (101,102).
SELECT * FROM Customers WHERE Phone IS NULL AND CustomerID NOT IN (101,102);

-- 33.Display accounts whose Balance > 30000 and AccountType is Savings or Salary.
-- (Requires parentheses if written using OR.)
SELECT * FROM Accounts WHERE Balance >30000 and AccountType ='Savings' or AccountType ='Salary';

-- 34.Display customers whose FirstName contains 'a' but LastName does not contain 'a'.
SELECT * FROM Customers WHERE FirstName LIKE 'A%' AND LastName NOT LIKE '%A%';

-- 35.Display only 4 customers after skipping the first 3 customers, ordered by FirstName.
SELECT * FROM Customers ORDER BY FirstName LIMIT 4 OFFSET 3;

-- Trim() Functions
SELECT LENGTH("  Hello World  ");
SELECT LENGTH(TRIM("  Hello World  "));
SELECT Substring("Hello World",6);
SELECT LENGTH(TRIM(Substring("Hello World",6)));
-- REPLACE FUNCTION
SELECT REPLACE("Mat mat Mat","M","C");
SELECT avg(Balance) From Accounts WHERE AccountType='Current';
SELECT round(avg(Balance),2) From Accounts WHERE AccountType='Current';

-- Ceil() or Ceiling Function
SELECT Ceil(avg(Balance)) from Accounts WHERE AccountType='Current';

-- Floor()  Function
SELECT 
    Floor(AVG(Balance))
FROM
    Accounts
WHERE
    AccountType = 'Current';
SELECT * FROM Transactions;
SELECT avg(Amount) From Transactions WHERE TransactionType='Deposite';
SELECT round(avg(Amount),2) From Transactions WHERE TransactionType='Deposite'; -- nerest round up value (10.6 - 11) 

-- Ceil() or Ceiling Function -- round up values
SELECT Ceil(avg(Amount)) from Transactions WHERE TransactionType='Deposite';

-- Floor()  Function -- Round Down word values .
SELECT 
    Floor(AVG(Amount))
FROM
    Transactions
WHERE
    TransactionType = 'Deposite';
-- Absolute () Function........It Removes the sing
SELECT abs(-3656);
SELECT abs(-1.34);
SELECT abs(22.34);

-- MOD value
SELECT(7/3);
SELECT mod(7,3);

-- POWER()
SELECT Power(1.5,3); 
SELECT Power(5,3); 
-- SQRT()
SELECT SQRT(123);
SELECT SQRT(234);
-- DATE ()Functions
-- Now () Functions
SELECT NOW();
SELECT CURDATE();
SELECT CURTIME();
-- YEAR() MONTH() DAY()
SELECT YEAR(DateOfBirth),MONTH(DateOfBirth),DAY(DateOfBirth) FROM Customers;

-- DATEDDIFF() FUNCTION..............Returns number of days between tow dates.

  SELECT  CONCAT (FirstName," ",LastName) as FullName , DateOfBirth, floor(DATEDIFF(curdate(),DateOfBirth)/365) as age FROM Customers;
  -- DATE_ADD()...ADD DAYS
  
  SELECT CONCAT(FirstName," ",LastName) as FullName, AccountCreationDate, date_add(AccountCreationDate, interval 1 year) as KYCRenewal FROM Customers;
  
SELECT * FROM accounts; 
select * from branches;
select * from customers;
select * from loans;
select * from transactions;


-- COUNT() Function

  SELECT * FROM Customers;
  SELECT COUNT(*) AS TotalCustomers FROM Customers;	
  SELECT COUNT(Phone) AS TotalCustomers FROM Customers;
  
  -- SUM() Function
  
  SELECT * FROM Accounts;
  SELECT SUM(Balance) as TotalBalance FROM Accounts;
  SELECT SUM(Balance) AS SavingsBalance FROM Accounts WHERE AccountType ='savings';
  
   -- AVG() Function
   
   SELECT * FROM Transactions;
   SELECT AVG(Amount) as TotalAmountTransacted FROM Transactions;
   SELECT AVG(Amount)  as TotalDepositeTransactions FROM Transactions WHERE TransactionType ='Deposite';
   SELECT AVG(Amount)  as AverageAmountWithdrawal FROM Transactions WHERE TransactionType ='Withdrawal';
   
   -- MAX () & MINIMUM () FUNCTION
   
   SELECT MAX(Balance) as MaximumAmount FROM Accounts WHERE AccountType ='Savings';
   SELECT MIN(Balance) as MinimumAmount FROM Accounts WHERE AccountType ='Savings';
   
   -- Group By
   
   SELECT TransactionType , sum(Amount) from Transactions GROUP BY (TransactionType);
   
   SELECT * FROM Accounts;
   SELECT AccountType , COUNT(*) as TotalAccounts, SUM(Balance) as TotalBalance, avg(Balance) as avgBalance from Accounts GROUP BY (AccountType);
   SELECT BranchID, AccountType, COUNT(*) as AccountTypeAsPerBranchID FROM Accounts GROUP BY  BranchID, AccountType ORDER BY BranchID;
   
   -- Having
    
    SELECT BranchID, AccountType, COUNT(*) as noofaccounts FROM Accounts GROUP BY  BranchID, AccountType HAVING Noofaccounts >=2 and AccountType ="Savings";

--  FIND number of customers for according to year from customers table 
SELECT YEAR(accountcreationDate) AS Year, COUNT(*) AS NumberOfCustomers FROM Customers GROUP BY YEAR(accountcreationDate);


-- my work -- 

SELECT CustomerID,Phone from customers;
select count(*) from customers; -- count (*) is count Null value also
select * from customers;

select * from customers
order by FirstName ASC; -- A to Z OR Z to A

select * from customers
WHERE DateOfbirth between '1998-04-15'AND'2000-06-22';

-- INNER JOIN
 -- find all customers having loans with their names,
 -- insert rate and loans,

select c.CustomerID, c.FirstName, c.LastName, l.LoanAmount, l.InterestRate
from customers c
inner join loans l
on c.customerID = l.customerID; 

-- find the branch name for the accountID'savepoint
-- inculd account id,accounttype,branchname,branchaddress,

select a.accountID, a.accounttype, b.BranchID, b.BranchAddress
from accounts a
inner join branches b
on a.BranchID = b.BranchID
where AccountType = "savings";

SELECT * FROM transactions;
-- FIND ALL THE CUSTOMERS NAME, PHONE ,accounttype, balanced
-- where account type is savings

select c.FirstName ,c.LastName, c.phone, a.accounttype, a.Balance
from customers c
inner join accounts a
on c.CustomerID = a.CustomerID
where AccountType = "savings";

-- left join 
INSERT INTO Customers
VALUES
('110', 'shereya','Bhowate','shereya2@gmail.com', NULL, '2026-07-09','9991-02-08'),
('111', 'khushbu','kale','khushi2@gmail.com', NULL, '2026-04-05','1986-04-10'),
('112', 'tanya','sharma','tanya2@gmail.com', '4538723194', '2023-05-12','9091-04-08');
select * from customers;

select c.firstname,c.lastname,c.phone,a.accounttype,a.Balance
from customers c
 left join accounts a 
 ON C.CustomerID = a.CustomerID;

select c.firstname,c.lastname,c.phone,a.accounttype,a.Balance
from accounts a 
 LEFT join customers c
 ON C.CustomerID = a.CustomerID;

-- right join

INSERT INTO Branches
(BranchID, BranchName, BranchAddress, BranchPhone)
VALUES
('006','WardhaBranch','WardhaMaharshtra','3456789754');
select * from branches;


 INSERT INTO Transactions
(TransactionID, TransactionDate, Amount, TransactionType, AccountID)
VALUES
(409,'2025-12-03','20000.00','Deposite',208),
(410,'2026-08-03','70000.00','Withdrawal',201),
(411,'2025-03-02','78000.00','Transfer',204),
(412,'2026-01-07','68000.00','Deposite',203);
SELECT * FROM Transactions;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance, BranchID)
VALUES
(209,102,'Cureent',25000,'002'),
(210,103,'Savings',30000,'003'),
(211,105,'Current',60000,'004');
select * from accounts;
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance, BranchID)
VALUES
(212,102,'Cureent',25000,'002'),
(213,103,'Savings',30000,'003'),
(214,105,'Current',60000,'004'),
(215,102,'Cureent',45000,'002'),
(216,103,'Savings',670000,'006'),
(217,105,'Current',980000,'005');

select * from accounts;

INSERT INTO Customers
VALUES
('113', 'aaditya','Gaidhane','aditya2@gmail.com', '2356789546', '2026-04-05','1986-04-10'),
('114', 'tanmay','Tiwade','tanmay2@gmail.com', '4538575194', '2023-05-12','9091-04-08'),
('115', 'apeksha','atkare','apeksha2@gmail.com', '3472737675', '2026-07-09','9991-02-22'),
('116', 'tanmayeeu','patile','tanmayee2@gmail.com', '3574748698', '2026-04-05','1986-06-11'),
('117', 'rehan','chure','rehan2@gmail.com', '4538723194', '2023-05-12','9091-03-18');

select * from customers;

select C.CustomerID,a.accountID ,concat_ws(" ",c. firstname,c.lastname) as fullname,a.accounttype,a.Balance
from customers c 
inner join accounts a
on c.CustomerID = a. CustomerID
order by customerID;

-- Quesations in joins --

-- 1. Display customers who do not have a Current account.
select c.CustomerID,c.Firstname,c.lastname,c.phone,a.accounttype
from customers c 
left join accounts a 
on c.CustomerID = a. customerID
where a.AccountType <> 'current'; 
 
 -- 2. Display Customername,Accountcreation date,Accounttype,Balancefor customers whose account was created in 2025.
 SELECT c.firstname,c.lastname,c.AccountCreationDate,a.AccountType,a.Balance
FROM customers c
left JOIN accounts a
ON c.CustomerID = a.CustomerID
WHERE year (c.AccountCreationDate) = 2025;

-- 3 Display:Customername,Accountcreation date,Accounttype and calculate the number of days since account creation.
SELECT CONCAT(c.Firstname, ' ', c.lastname) AS CustomerName,c.AccountCreationDate,a.AccountType,
    DATEDIFF(CURDATE(), c.AccountCreationDate) AS DaysSinceCreation
FROM customers c
JOIN accounts a
ON c.CustomerID = a.CustomerID;

-- 4 Find the number of accounts held by each customer.
SELECT c.CustomerID,c.Firstname, c.lastname AS CustomersName,
COUNT(a.AccountID) AS NumberOfAccounts
FROM customers c
LEFT JOIN accounts a
ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.Firstname, c.lastname;

-- 5 Find the total balance held by each customer.
SELECT c.CustomerID,c.Firstname, c.Lastname as customersName,
SUM(a.Balance) AS TotalBalance
FROM customers c
LEFT JOIN accounts a
ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.Firstname, c.lastname;

select * from accounts;
select * from customers;
select * from branches;

-- 6 Find the number of customers for each account type.
SELECT a.AccountType, COUNT(a.CustomerID) AS NumberOfCustomers
FROM accounts a 
GROUP BY a.AccountType;

-- 7 Find the total balance for each account type.
SELECT a.AccountType, SUM(a.Balance) AS TotalBalance
FROM accounts a
GROUP BY a.AccountType;

-- 8 Find the highest balance held by each account type.
SELECT a.AccountType, MAX(a.Balance) AS HighestBalance
FROM accounts a
GROUP BY a.AccountType;

-- 9 Find the number of customers for each branch.
SELECT a.BranchID, COUNT(a.CustomerID) AS NumberOfCustomers
FROM accounts a
GROUP BY a.BranchID;

-- 10. Find customers whose total account balance is greater than 40,000. 
SELECT c.CustomerID, CONCAT(c.Firstname, ' ', c.lastname) AS CustomerName,
SUM(a.Balance) AS TotalBalance
FROM customers c
JOIN accounts a
ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.Firstname, c.lastname
HAVING SUM(a.Balance) > 50000;

-- 11 Find customers who have more than one account.
SELECT c.CustomerID,CONCAT(c.Firstname, ' ', c.lastname) AS CustomerName,COUNT(a.AccountID) AS NumberOfAccounts
FROM customers c
JOIN accounts a
ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.Firstname, c.lastname
HAVING COUNT(a.AccountID) > 1;

-- 12 Find customers who do not have an account.
SELECT c.CustomerID,CONCAT(c.Firstname, ' ', c.lastname) AS CustomerName
FROM customers c
LEFT JOIN accounts a
ON c.CustomerID = a.CustomerID
WHERE a.AccountID IS NULL;

-- 13 Find customers who do not have any loan.
SELECT c.CustomerID,CONCAT(c.Firstname, ' ', c.lastname) AS CustomerName
FROM customers c
LEFT JOIN loans l
ON c.CustomerID = l.CustomerID
WHERE l.LoanID IS NULL;

-- 14 Find customers who have never performed a transaction.
SELECT c.CustomerID,CONCAT(c.Firstname, ' ', c.lastname) AS fullName , count(t.accountID) as Notransaction
from customers c
inner join accounts a 
on c.CustomerID = a.CustomerID
left join transactions t 
on t.accountID = a.AccountID
group by c.customerID
having Notransaction = 0;

-- 15 Display all branches and their account count, including only those branches that have 2 accounts.
select b.BranchID,b.BranchName,b.BranchAddress,b.BranchPhone,count(a.AccountID) as totalaccounts
from Branches b 
left join Accounts a 
on b.BranchID = a.BranchID
group by b.BranchID
having totalaccounts >2;

-- Full outer join --             -- FULL OUTER JOIN --  (returns all records from both tables, whether they match or not)

select * from Customers c
left join Accounts a
on c.CustomerID = a.CustomerID
UNION                              -- union -- (LEFT JOIN result + RIGHT JOIN result → UNION → one combined result)
select * from Customers c
right join Accounts a
on c.CustomerID = a.CustomerID;

-- CROSS JOIN --               -- (ross Join returns every possible combination of rows from two tables)
select * from Customers c
CROSS join Accounts a
on c.CustomerID = a.CustomerID;

-- Self join --               ( Self Join is used to find the relationship between rows within the same table )
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    ManagerID INT,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    BranchID INT,

    FOREIGN KEY (ManagerID)
        REFERENCES Employees(EmployeeID),

    FOREIGN KEY (BranchID)
        REFERENCES Branches(BranchID)
);

INSERT INTO Employees VALUES
(1,'Rahul',NULL,'Management',85000,'2020-03-12',1),
(2,'Neha',1,'Loans',52000,'2021-05-04',1),
(3,'Rohan',1,'Accounts',58000,'2021-07-15',2),
(4,'Priti',2,'Loans',42000,'2022-02-10',2),
(5,'Akash',2,'Loans',45000,'2022-08-20',3),
(6,'Snehal',3,'Accounts',40000,'2023-01-18',3);
INSERT INTO Employees VALUES
(7,'Vikas',3,'Accounts',43000,'2023-03-25',2),
(8,'Riya',4,'Loans',39000,'2023-06-10',1),
(9,'Aditya',4,'Loans',41000,'2023-09-05',3),
(10,'Kavya',5,'HR',37000,'2024-01-12',2);
select * from Employees;

SELECT 
    e.EmployeeName AS Employee,
    m.EmployeeName AS Manager
FROM Employees e
LEFT JOIN Employees m 
ON e.ManagerID = m.EmployeeID;

SELECT 
    e.EmployeeName AS Employee,
    m.EmployeeName AS Manager
FROM Employees e
inner JOIN Employees m 
ON e.ManagerID = m.EmployeeID;

select c.CustomerID,concat(c.FirstName ," ", c.LastName) as FullName,a.AccountID,a.AccountType,a.Balance
 from customers c
 inner join accounts a
 on c.CustomerID=a.CustomerID
 ORDER BY c.CustomerID;
 
-- SELF JOIN AND CREATE TABLE  

CREATE TABLE Employees( EmployeeID INT PRIMARY KEY,
EmployeeName varchar (50) NOT NULL,
ManagerID int ,
Department varchar(50),
salary DECIMAL(10,2),
JoiningDate DATE,
BranchID INT ,

foreign key (ManagerID)
references Employees(EmployeeID),

foreign key (BranchID)
references Branches(BranchID)
);
SELECT * FROM Employees;
alter table Employees
rename column salary to Salary ;

INSERT INTO Employees
    (EmployeeID, EmployeeName, ManagerID, Department, Salary, JoiningDate, BranchID)
VALUES
    (1, 'Rajesh Sharma', NULL, 'Management', 120000.00, '2018-04-15', 1),
    (2, 'Priya Patel', 1, 'Human Resources', 75000.00, '2019-06-10', 2),
    (3, 'Amit Kumar', 1, 'Finance', 82000.00, '2020-01-20', 3),
    (4, 'Sneha Verma', 1, 'IT', 95000.00, '2019-09-05', 4),
    (5, 'Rahul Singh', 1, 'Sales', 78000.00, '2021-03-12', 5),
    (6, 'Neha Joshi', 2, 'Human Resources', 55000.00, '2021-07-19', 1),
    (7, 'Vikas Gupta', 2, 'Human Resources', 52000.00, '2022-02-14', 2),
    (8, 'Pooja Mehta', 3, 'Finance', 60000.00, '2021-11-08', 3),
    (9, 'Suresh Yadav', 3, 'Finance', 58000.00, '2022-05-16', 4),
    (10, 'Anjali Deshmukh', 4, 'IT', 72000.00, '2020-08-24', 5),
    (11, 'Rohan Kulkarni', 4, 'IT', 68000.00, '2021-10-11', 1),
    (12, 'Kavita Rao', 4, 'IT', 65000.00, '2022-01-17', 2),
    (13, 'Arjun Malhotra', 5, 'Sales', 57000.00, '2022-06-20', 3),
    (14, 'Meena Shah', 5, 'Sales', 59000.00, '2021-12-06', 4),
    (15, 'Deepak Thakur', 5, 'Sales', 54000.00, '2023-01-09', 5),
    (16, 'Nitin Pawar', 6, 'Human Resources', 42000.00, '2023-04-18', 1),
    (17, 'Swati Mishra', 7, 'Human Resources', 40000.00, '2023-07-03', 2),
    (18, 'Manish Jain', 8, 'Finance', 45000.00, '2023-02-27', 3),
    (19, 'Komal Sinha', 9, 'Finance', 43000.00, '2023-08-14', 4),
    (20, 'Akash Bansal', 10, 'IT', 50000.00, '2023-05-22', 5);
SELECT 
    e.EmployeeID,
    e.employeename AS Employee,
    m.employeename AS Manager,e.BranchID
FROM
    employees e
LEFT JOIN
    employees m 
ON e.ManagerID = m.employeeid;
     
SELECT 
    e.EmployeeID,
    e.employeename AS Employee,
    m.employeename AS Manager,b.BranchID,b.BranchName
FROM
    employees e
LEFT JOIN
    employees m 
ON e.ManagerID = m.employeeid
inner join branches b 
on b.BranchID=e.BranchID
order by EmployeeID asc;

-- display to report sneha verma 
-- find the all the employee who report to shena verma 
select e.EmployeeID,e.Department,e.EmployeeName as EmployeeName   
from employees e
left join employees m
on e.ManagerID =m.EmployeeID
where e.ManagerID = 4;


-- Find all customers having balance more than average balance  in saving account

select avg(Balance) as AverageBalance from accounts
where AccountType ='saving' ;

select  concat(c.firstname," ",c.lastname) as FullName   ,avg(a.balance) as Average,a.AccountType
from customers c 
left join accounts a 
on c.CustomerID=a.CustomerID
where a.AccountType = 'saving'
group by FullName 
having Average > 18375;

-- SUBQUERIS
-- SCALAR SUBQUERIS or Single value Subquery 
select concat(c.firstname," ",c.lastname) as FullName   ,avg(a.balance) as Average,a.AccountType
from customers c 
left join accounts a 
on c.CustomerID=a.CustomerID
where a.AccountType = 'saving' 
group by FullName
having avg(a.Balance) > ( select avg(Balance)  from accounts
where AccountType ='saving' );

select AccountID , CustomerID from accounts
where  Balance >
 ( select avg(Balance)  from accounts );
 
 select AccountID , CustomerID from accounts
 where AccountType = 'saving' and balance > (select avg(balance) from accounts
 where AccountType='saving') ;
 
 select c.FirstName, a.AccountID ,c.CustomerID from customers c
 inner join accounts a 
 on a.CustomerID = c.CustomerID
where  accounttype ='saving' and  a.Balance >
 ( select avg(Balance)  from accounts
  where accounttype ='saving');

-- find the accounts whose balance is greater than
-- the average balance of thir respective branch 

select * from accounts;

select a.AccountID ,a.BranchID,a.Balance
from accounts a 
where a.balance > (
select avg(b.balance)
from accounts b 
where a.BranchID = b.BranchID );

select a.AccountID,a.Balance,a.BranchID from accounts a 
where a.Balance > (
select avg(a1.Balance) from Accounts a1 where a1.BranchID = a.BranchID );

select e.EmployeeID,e.EmployeeName,e.Salary,e.Department
from Employees e 
where e.salary > ( 
select avg(e1.salary) 
from Employees e1 
where e1.Department = e.Department);

 -- find the customers who have more than one accounts ( single value retrun/column)
 
select c.FirstName,c.LastName
from customers c where ( select count(*) from accounts a 
where c.customerID = a.CustomerID )>1;

select * from accounts;

-- find the average account balance for each account type 
-- using a derived table

select AccountType, avrageBalance from (select AccountType, avg(Balance) as avrageBalance from accounts
group by AccountType
) AccountBalance;

-- Display only those account types whose average balance is greater than 48,000
select AccountType, avrageBalance from (select AccountType, avg(Balance) as avrageBalance from accounts
group by AccountType
) AccountBalance 
where avrageBalance > 48000;

-- Find the top 3 customers based on thir total account balance

SELECT c.CustomerID,SUM(a.Balance) AS TotalBalance
FROM Customers c
inner JOIN Accounts a
ON c.CustomerID = a.CustomerID
group by CustomerID
order by totalbalance desc limit 3 ;

SELECT c.CustomerID,c.FirstName,c.LastName,SUM(a.Balance) AS TotalBalance
FROM Customers c
inner JOIN Accounts a
ON c.CustomerID = a.CustomerID
group by CustomerID
order by totalbalance desc limit 3 ;







