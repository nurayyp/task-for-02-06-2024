CREATE DATABASE CustomerApp
use CustomerApp
CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
City NVARCHAR(50) NOT NULL
)
CREATE TABLE Sellers(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
City NVARCHAR(50) NOT NULL,
)
CREATE TABLE Orders(
Id INT PRIMARY KEY IDENTITY(1,1),
OrderDate DATETIME DEFAULT GETDATE(),
Amount DECIMAL(10,2),
State BIT,
CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
SellerId INT FOREIGN KEY REFERENCES Orders(Id)
)
INSERT INTO Customers 
VALUES ('Nuray', 'Pashayeva', 'Baku'),
('Derin', 'Ozer', 'Istanbul'),
('Andrew','Wall','London')
SELECT * FROM Customers
INSERT INTO Sellers
VALUES ('Meryem', 'Abbasova','Baki'),
('Nilufer','Tagiyeva','Baki'),
('Murad','Huseynzade', 'London')
SELECT * FROM Sellers
INSERT INTO Orders
VALUES ('2024-06-25 13:34:45',100.65,0,1,3),
('2024-05-25 13:47:08',100.65,0,3,2),
('2024-06-23 13:24:57',100.65,1,2,1)
SELECT * FROM Orders

SELECT SUM(Amount), Name FROM Orders 
JOIN Customers ON Customers.Id = Orders.CustomerID 
GROUP BY CustomerID, Name
HAVING SUM(Amount)>1000

SELECT * FROM Sellers
JOIN Customers ON Sellers.City= Customers.City

SELECT * FROM Orders
WHERE OrderDate BETWEEN 2024-01-10 AND GETDATE()

SELECT COUNT(SellerID), Name FROM Orders
JOIN Sellers ON Orders.SellerID = Sellers.Id
GROUP BY SellerID,Name
HAVING COUNT(CustomerID) > 10

SELECT COUNT(CustomerID), Name FROM ORDERS 
JOIN Customers ON Customers.Id = Orders.CustomerID 
GROUP BY CustomerID, Name 
ORDER BY COUNT(CustomerID) DESC

SELECT Orders.OrderDate FROM Orders 
JOIN Sellers  ON Orders.SellerID = Sellers.Id
WHERE Orders.State = 0
ORDER BY Orders.OrderDate;

SELECT * FROM Orders
WHERE OrderDate BETWEEN GETDATE()-1  AND GETDATE();