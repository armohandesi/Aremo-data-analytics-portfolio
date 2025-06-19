Create Database TelecomeDB;
Use TelecomeDB;
Create Table Customer (
CustomerID INT PRIMARY KEY AUTO_INCREMENT,
FristName Varchar(50),
LastName Varchar(50),
Email Varchar(70),
PhoneNumber Varchar(30),
City  Varchar(30),
ZipCode Varchar(10)
);
Create Table ServicePlan (
PlanID INT PRIMARY KEY AUTO_INCREMENT,
PlanName Varchar(50),
PlanType Varchar(50), -- e.g. SMS, VOICE, Data, Combo
Price Decimal(10,2),
ValidityDays INT
);
Create Table CustomerPlan (
CustomerID INT,
PlanID INT,
StartDate Date,
EndDate Date,
foreign key (CustomerID) references Customer(CustomerID),
FOREIGN KEY (PlanID) REFERENCES ServicePlan(PlanID),
PRIMARY KEY (CustomerID, PlanID, StartDate) -- a costumer may use 2 or 3 palns in the same time
);
Create Table Device (
DeviceID INT PRIMARY KEY Auto_INCREMENT,
DevieModel Varchar(50),
OperationSystem Varchar(50),
OsVersion Varchar(30)
);
CREATE TABLE UsageRecord (
    UsageID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    PlanID INT,
    DeviceID INT,
    UsageType VARCHAR(30),
    UsageAmount FLOAT,
    UsageDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (PlanID) REFERENCES ServicePlan(PlanID),
    FOREIGN KEY (DeviceID) REFERENCES Device(DeviceID)
);

DROP TABLE IF EXISTS  UseageRecord;
DROP TABLE IF EXISTS  customerplan;
Create Table Billing (
BillingID INT PRIMARY KEY AUTO_INCREMENT, 
CustomerID INT,
PlanID INT,
BillingDate Date,
Amount Decimal (10,2),
PaymentStatus Varchar(10), -- 'Paid', 'Unpaid', 'Pending'
foreign key (CustomerID) references Customer(CustomerID),
foreign key (PlanID) references ServicePlan(PlanID)
);
Create Table SupportInteraction (
InteractionID Int PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
IntractionDate datetime,
Topic Varchar(100),
ReselutionStatus Varchar(20), -- pending, Resolved
 FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
 );
Create Table Feedback (
FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
InteractionID INT,
Rating INT Check (Rating between 1 and 5),
Comments Text,
FeedbackDate Datetime, 
foreign key (InteractionID) references SupportInteraction(InteractionID)
);
-- Insert sampel Data to test the Tables
Insert INTO Customer (FristName , LastName , Email , PhoneNumber , City , ZipCode)
Values
('Martin', 'Marshal', 'Mat@gmail.com', '+4915123456789', 'Berlin', '10576'),
('Maria', 'Lotus', 'Maria.L@gmail.com', '+4917623456789', 'Munich', '11254'),
('Ali', 'khosrawi', 'Ali22@gmail.com', '+4916023456789', 'Hamburg', '80058');
SELECT *From Customer; 
 
Insert INTO  ServicePlan (PlanName, PlanType, Price, ValidityDays)
Values
('Alaki Plan', 'SMS', 1.55, 30),
('Hamintori Plan', 'Voice call', 5.55, 20),
('Khoshahl Plan', 'Data', 3.36 , 26); 
Select *from ServicePlan;

INSERT INTO CustomerPlan (CustomerID, PlanID, StartDate, EndDate)
VALUES
(1, 2, '2025-05-20', '2025-09-20'),
(2, 3, '2025-03-12', '2025-05-02');
Select *from  CustomerPlan;

Insert INTO Device (DevieModel, OperationSystem, OsVersion)
Values
('IPhone 13', 'IOS', '16'),
('Samsung A26', 'Android', '10'),
('Xiapmi', 'Android', '19');
Select *from Device;

INSERT INTO UsageRecord(CustomerID, PlanID, DeviceID, UsageType, UsageAmount, UsageDate)
Values
(1, 1, 1, 'SMS', 25.5, '2025-05-12 14:20:00'),
(2, 2, 1, 'Data', 35.5, '2025-02-24 12:10:00'),
(3, 1, 2, 'Voice Call', 35.2, '2025-04-20 10:10:00');
Select *From UsageRecord;

DROP TABLE UseageRecord;

INSERT INTO Billing (CustomerID, PlanID, BillingDate, Amount, PaymentStatus)
VALUES
(1, 1, '2025-06-01', 9.99, 'Paid'),
(2, 3, '2025-06-05', 19.99, 'Unpaid'),
(3, 2, '2025-06-10', 29.99, 'Paid');

Select *from Billing;

INSERT INTO SupportInteraction (CustomerID, InteractionDate, IssueType, ResolutionStatus)
VALUES
(1, '2025-06-02 10:30:00', 'Connectivity Issue', 'Resolved'),
(2, '2025-06-07 15:45:00', 'Billing Dispute', 'Pending'),
(3, '2025-06-09 09:00:00', 'Technical Support', 'Resolved');
Select *from SupportInteraction;

INSERT INTO Feedback (CustomerID, InteractionID, Rating)
VALUES
(1, 1, 4),
(2, 2, 2),
(3, 3, 5);
Select *from Feedback;
INSERT INTO SupportInteraction (CustomerID, InteractionDate, IssueType, ResolutionStatus)
VALUES
(1, '2025-06-02 10:30:00', 'Connectivity Issue', 'Resolved'),
(2, '2025-06-07 15:45:00', 'Billing Dispute', 'Pending'),
(3, '2025-06-09 09:00:00', 'Technical Support', 'Resolved');
Select *from SupportInteraction;
SHOW WARNINGS;
SHOW ERRORS;
DESCRIBE SupportInteraction;
DROP TABLE IF EXISTS SupportInteraction;
DROP TABLE IF EXISTS feedback;
CREATE TABLE SupportInteraction (
    InteractionID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    InteractionDate DATETIME,
    IssueType VARCHAR(100),
    ResolutionStatus VARCHAR(30),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
INSERT INTO SupportInteraction (CustomerID, InteractionDate, IssueType, ResolutionStatus)
VALUES
(1, '2025-06-02 10:30:00', 'Connectivity Issue', 'Resolved'),
(2, '2025-06-07 15:45:00', 'Billing Dispute', 'Pending'),
(3, '2025-06-09 09:00:00', 'Technical Support', 'Resolved');
Select *from SupportInteraction;
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    InteractionID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (InteractionID) REFERENCES SupportInteraction(InteractionID)
);
INSERT INTO Feedback (CustomerID, InteractionID, Rating)
VALUES
(1, 1, 4),
(2, 2, 2),
(3, 3, 5);
Select *from Feedback;

SELECT City, ZipCode, COUNT(*) AS CustomerCount
FROM Customer
GROUP BY City, ZipCode
ORDER BY CustomerCount DESC;

SELECT D.DevieModel, UR.UsageType, COUNT(*) AS UsageCount
FROM UsageRecord UR
JOIN Device D ON UR.DeviceID = D.DeviceID
GROUP BY D.DevieModel, UR.UsageType
ORDER BY D.DevieModel, UsageCount DESC;
DESCRIBE Device;

-- SQL Query Writing
SELECT 
    c.CustomerID,
    CONCAT(c.FristName, ' ', c.LastName) AS FullName,
    c.PhoneNumber,
    c.City,
    sp.PlanName,
    cp.StartDate,
    cp.EndDate
FROM 
    Customer c
JOIN 
    CustomerPlan cp ON c.CustomerID = cp.CustomerID
JOIN 
    ServicePlan sp ON cp.PlanID = sp.PlanID
ORDER BY 
    c.CustomerID;
    
Select 
sp.PlanName,
sp.Price,
Count(cp.CustomerID) AS CustomerCount,
COUNT(cp.CustomerID) * sp.Price AS EstimatedRevenue
FROM
ServicePlan sp
JOIN
 CustomerPlan cp ON sp.PlanID = cp.PlanID
 GROUP BY
sp.PlanName, sp.Price
ORDER BY
 EstimatedRevenue DESC;
 
SELECT 
    ur.CustomerID,
    ur.UsageType,
    SUM(ur.UsageAmount) AS TotalUsage,
    DATE_FORMAT(ur.UsageDate, '%Y-%m') AS UsageMonth
FROM 
    UsageRecord ur
WHERE 
    ur.CustomerID = 1
    AND ur.UsageDate BETWEEN '2025-05-01' AND '2025-05-31'
GROUP BY 
    ur.CustomerID, ur.UsageType, UsageMonth;

Select 
CONCAT(c.FristName, ' ', c.LastName) AS FullName,
b.BillingID,
b.Amount,
b.PaymentStatus,
b.BillingDate,
sp.PlanName
from
Billing b
Join
Customer c on b.CustomerID =c.CustomerID
Join
ServicePlan sp on b.PlanID = sp.PlanID
Order By
BillingDate DESC;

Select 
    ur.CustomerID,
    CONCAT(c.FristName, ' ', c.LastName) AS FullName,
    SUM(ur.UsageAmount) AS TotalUsage
From
UsageRecord ur
Join
Customer c on ur.CustomerID = c.CustomerID
Group By
ur.CustomerID, ur.CustomerID
ORDER BY 
TotalUsage DESC

START TRANSACTION;

UPDATE Billing
SET PaymentStatus = 'Paid'
WHERE BillingID = 2;

COMMIT;

SELECT 
    c.CustomerID,
    CONCAT(c.FristName, ' ', c.LastName) AS FullName,
    AVG(f.Rating) AS AvgRating,
    MAX(si.IssueType) AS LastIssueType
FROM 
    Feedback f
JOIN 
    SupportInteraction si ON f.InteractionID = si.InteractionID
JOIN 
    Customer c ON f.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID, FullName
ORDER BY 
    AvgRating DESC;

SELECT 
c.City,
SUM(b.Amount) AS TotalRevenue,
COUNT(b.BillingID) AS NumOfPaidBills
FROM 
Billing b
JOIN 
Customer c ON b.CustomerID = c.CustomerID
WHERE 
b.PaymentStatus = 'Paid'
GROUP BY 
c.City
ORDER BY 
TotalRevenue DESC;




