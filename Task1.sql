CREATE DATABASE DemoApp
use DemoApp

CREATE TABLE Countries(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL,
Area DECIMAL(18,2),
)

CREATE TABLE Cities(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL,
Area DECIMAL(20,2),
CountryId INT FOREIGN KEY REFERENCES Countries(Id),
)

CREATE TABLE People(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
PhoneNumber NVARCHAR(50) DEFAULT '+994000000000' UNIQUE,
Email NVARCHAR(50) DEFAULT 'example@gmail.com',
BirthDate DATE NOT NULL,
Gender CHAR CHECK (Gender = 'k' OR Gender = 'q'), 
HasCitizenship BIT,
CityId INT FOREIGN KEY REFERENCES Cities(Id),
)

INSERT INTO Countries
VALUES ('Azerbaycan',8600.0),
('Turkiye', 29840.0),
('Ingiltere',838292.9),
('Rusiya',3748392.9)
SELECT * FROM Countries

INSERT INTO Cities
VALUES ('Baki',345.8,1),
('London',2372,3),
('Cambridge', 1234,3),
('Izmir',987,2),
('Istanbul',372.3,2)
SELECT * FROM Cities

INSERT INTO People
VALUES ('Nezrin','Esedzade','+994107000605','Nesedzade@gmail.com','2006-07-26','q',1,1),
('Rauf','Esedli','+994507100605','Rasadli@gmail.com','2006-10-06','k',0,3)
SELECT c.Name AS 'City', ct.Name AS 'Country', p.Name AS 'Name', p.Surname AS 'Surname' From People AS p
INNER JOIN Cities AS c ON CityId = c.Id
INNER JOIN Countries AS ct ON CountryId = ct.Id

SELECT * FROM Countries
ORDER BY Area

SELECT * FROM Cities
ORDER BY Name DESC

SELECT COUNT (*) FROM Countries
WHERE Area > 20000

SELECT MAX (Area) FROM Countries 
WHERE Name LIKE 'i%'

SELECT Id,Name,Area FROM Cities
UNION 
SELECT Id,Name,Area FROM Countries

SELECT c.Name AS 'City Name', COUNT(p.Id) AS 'Count of People' FROM People p
JOIN Cities c ON p.CityId = c.Id
GROUP BY  c.Name;

SELECT c.Name AS 'City Name', COUNT(p.Id) AS 'Count of People' FROM people p
JOIN cities c ON p.CityId = c.id
GROUP BY c.Name
HAVING COUNT(p.Id) > 5;
