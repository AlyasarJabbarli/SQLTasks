--TASK1

CREATE DATABASE "4EVENT"

USE "4EVENT"

CREATE TABLE EMPLOYEES(
	Name nvarchar(30), 
	SurName nvarchar(30), 
	Position nvarchar(40), 
	Salary smallmoney 
)

SELECT AVG(Salary) FROM EMPLOYEES

SELECT * FROM EMPLOYEES WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEES)

SELECT MAX(Salary) FROM EMPLOYEES

SELECT MIN(Salary) FROM EMPLOYEES

--TASK2

CREATE DATABASE Market

USE "Market"

CREATE TABLE Products(
	Id int,
	Name nvarchar(50),
	Price money
)

ALTER TABLE Products 
ADD Brand nvarchar(100)


INSERT INTO Products 
VALUES 
(1 , 'Saqqiz' , 0.60 , 'Dirol'),
(2 , 'Saqqiz' , 0.50 , 'Orbit'),
(3 , 'Corek' , 0.40 , 'Corekci'),
(4 , 'Sud' , 2.60 , 'Milla'),
(5 , 'Paltar-Dermani' , 8.40 , 'Vanish'),
(6 , 'Sokolad' , 0.90 , 'Snickers'),
(7 , 'Konfet' , 12.80 , 'Bohem'),
(8 , 'Usaq Yemeyi' , 4.30 , 'Aqusha'),
(9 , 'Spray' , 2.70 , 'Rexona'),
(10 , 'Pecenye' , 3.10 , 'Oreo'),
(11 , 'Desmal' , 3.30 , 'Melisa'),
(12 , 'Pendir' , 8.40 , 'Atena'),
(13 , 'Qaymaq' , 4.60 , 'Milla'),
(14 , 'Baliq' , 15, 'Baliqci'),
(15 , 'Halva' , 8 , 'AliAhmad')

SELECT * FROM Products WHERE Price < (SELECT AVG(Price) From Products)

SELECT * FROM Products WHERE Price > 10

SELECT Id ,(Name +' '+ Brand) as ProductInfo , Price   FROM Products Where Len(Brand) > 5






