--Task 1
--Database Yaradin Adi Ne Olursa Olsun

--Brands Adinda Table Yaradin 2 dene colum Id ve Name

--Notebooks Adinda Table Yaradin Id,Name, Price Columlari Olsun.

--Phones Adinda Table Yaradin Id, Name, Price Columlari Olsun.

--1) Notebook ve Brand Arasinda Mentiqe Uygun Relation Qurun.

--2) Phones ve Brand Arasinda Mentiqe Uygun Relation Qurun.

--3) Notebooks Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

--4) Phones Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

--5) Brand Adinin Terkibinde s Olan Butun Notebooklari Cixardan Query.

--6) Qiymeti 2000 ve 5000 arasi ve ya 5000 den yuksek Notebooklari Cixardan Query.

--7) Qiymeti 1000 ve 1500 arasi ve ya 1500 den yuksek Phonelari Cixardan Query.

--8) Her Branda Aid Nece dene Notebook Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

--9) Her Branda Aid Nece dene Phone Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

--10) Hem Phone Hem de Notebookda Ortaq Olan Name ve BrandId Datalarni Bir Cedvelde Cixardan Query.

--11) Phone ve Notebook da Id, Name, Price, ve BrandId Olan Butun Datalari Cixardan Query.

--12) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalari Cixardan Query.

--13) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalarin Icinden Price 1000-den Boyuk Olan Datalari Cixardan Query.

--14) Phones Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) ve Hemin Branda Nece dene Telefon Varsa Sayini (ProductCount Kimi) Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple                6750                3
--Samsung              3500                4
--Redmi                 800                1

--15) Notebooks Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) , Hemin Branda Nece dene Telefon Varsa Sayini (ProductCount Kimi) Olacaq ve Sayi 3-ve 3-den Cox Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple                6750                3
--Samsung              3500                4




CREATE DATABASE ELECTRONICS
 
USE ELECTRONICS


CREATE TABLE Brands(
	id int constraint PK_Brands_id primary key identity,
	Name nvarchar(50) not null constraint CK_Brands_Name check(len(Name)>1)
)

CREATE TABLE Notebooks(
	id int constraint PK_Notebooks_id primary key identity,
	Name nvarchar(50) not null constraint CK_Notebooks_Name check(len(Name)>2),
	Price money not null constraint CK_Notebooks_Price check(Price > 0),
	BrandId int constraint FK_Notebooks_id foreign key REFERENCES Brands(id)
)

CREATE TABLE Phones(
	id int constraint PK_Phones_id primary key identity,
	Name nvarchar(50) not null constraint CK_Phones_Name check(len(Name)>1),
	Price money not null constraint CK_Phones_Price check(Price > 0),
	BrandId int constraint FK_Phones_id foreign key REFERENCES Brands(id)
)

INSERT INTO Brands
VALUES
('Apple'),
('Hp'),
('Samsung'),
('Xiaomi'),
('Huawei'),
('Asus')



INSERT INTO Notebooks
VALUES
('250 G5', 943, 2),
('250 G6', 1158, 2),
('250 G7', 1251, 2),
('Air', 2363, 1),
('Pro 13', 2975, 1),
('Pro 15', 3439, 1),
('ROG', 2928, 6),
('ROG PRO', 3968, 6),
('VIVOBOOK 15', 1536, 6),
('VIVOBOOK 14', 1325, 6),
('Mate X', 1600, 5),
('Mate X PRO', 1900, 5),
('Mate XL PRO', 1864, 5),
('Mate XXL PRO', 1253, 5),
('Mi Notebook Air', 1753, 4),
('Mi Notebook Pro', 2153, 4),
('Lustrous Grey', 4681, 4),
('Galaxy Book', 1874, 3),
('Galaxy Book PRO', 3274, 3),
('Galaxy Book AIR', 2574, 3),
('Galaxy Book AIR PRO', 3367, 3)

INSERT INTO Phones
VALUES
('13', 2463, 1),
('13 Pro', 3075, 1),
('13 Pro Max', 3339, 1),
('Mate Pad', 1600, 5),
('Mate Xs', 1900, 5),
('Nova 9 SE', 1864, 5),
('P50E', 1853, 5),	
('Poco 5', 1753, 4),
('Poco 4', 2153, 4),
('Poco 6', 4681, 4),
('A11', 275, 3),
('A21', 285, 3),
('A31', 374, 3),
('A41', 467, 3),
('A51', 567, 3),
('A61', 667, 3),
('A71', 767, 3),
('A81', 867, 3),
('A91', 967, 3)


--3) Notebooks Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

SELECT Notebooks.Name , Brands.Name as BrandName FROM Notebooks Join Brands on Notebooks.BrandId = Brands.id

--4) Phones Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

SELECT Phones.Name , Brands.Name as BrandName FROM Phones Join Brands on Phones.BrandId = Brands.id

--5) Brand Adinin Terkibinde s Olan Butun Notebooklari Cixardan Query.

SELECT Name FROM Brands WHERE Name like '%s%'

--6) Qiymeti 2000 ve 5000 arasi ve ya 5000 den yuksek Notebooklari Cixardan Query.

SELECT * FROM Notebooks WHERE Price between 2000 and 5000 or Price>5000

--7) Qiymeti 1000 ve 1500 arasi ve ya 1500 den yuksek Phonelari Cixardan Query.

SELECT * FROM Phones WHERE Price between 1000 and 1500 or Price>1500

--8) Her Branda Aid Nece dene Notebook Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

SELECT Brands.Name as BrandName, Count(Brands.Name) as Notebooks 
FROM Notebooks Join Brands on Notebooks.BrandId = Brands.id 
GROUP BY Brands.Name HAVING COUNT(Brands.Name) > 1
 
--9) Her Branda Aid Nece dene Phone Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

SELECT Brands.Name as BrandName, Count(Brands.Name) as Phones 
FROM Phones Join Brands on Phones.BrandId = Brands.id 
GROUP BY Brands.Name HAVING COUNT(Brands.Name) > 0

--10) Hem Phone Hem de Notebookda Ortaq Olan Name ve BrandId Datalarni Bir Cedvelde Cixardan Query.

SELECT Name , BrandId 
FROM Notebooks 
WHERE Exists(SELECT * FROM Phones WHERE BrandId = Notebooks.BrandId and Notebooks.Name = Phones.Name)

--11) Phone ve Notebook da Id, Name, Price, ve BrandId Olan Butun Datalari Cixardan Query.

SELECT * FROM Notebooks Union All SELECT * FROM Phones 

--12) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalari Cixardan Query.

SELECT Notebooks.id , Notebooks.Name , Notebooks.Price ,Brands.Name as BrandName 
FROM Notebooks Join Brands on Notebooks.BrandId = Brands.id 
Union All 
SELECT Phones.id , Phones.Name , Phones.Price ,Brands.Name as BrandName 
FROM Phones  Join Brands on Phones.BrandId = Brands.id

--13) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalarin Icinden Price 1000-den Boyuk Olan Datalari Cixardan Query.

SELECT Notebooks.id , Notebooks.Name , Notebooks.Price ,Brands.Name as BrandName 
FROM Notebooks  Join Brands on Notebooks.BrandId = Brands.id 
WHERE Notebooks.Price>1000 
Union All 
SELECT Phones.id , Phones.Name , Phones.Price ,Brands.Name as BrandName 
FROM Phones Join Brands on Phones.BrandId = Brands.id
WHERE Phones.Price>1000


--14) Phones Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) ve Hemin Branda Nece dene Telefon Varsa Sayini (ProductCount Kimi) Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple               6750                  3
--Samsung             3500                  4
--Redmi                800                  1


SELECT Brands.Name as BrandName, Sum(Phones.Price) as TotalPrice ,Count(Brands.Name) as ProductCount 
FROM Phones Join Brands on Phones.BrandId = Brands.id 
GROUP BY Brands.Name HAVING COUNT(Brands.Name) > 0

--15) Notebooks Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) , Hemin Branda Nece dene Telefon Varsa Sayini (ProductCount Kimi) Olacaq ve Sayi 3-ve 3-den Cox Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple                6750                 3
--Samsung              3500                 4

SELECT Brands.Name as BrandName, Sum(Notebooks.Price) as TotalPrice ,Count(Brands.Name) as ProductCount 
FROM Notebooks Join Brands on Notebooks.BrandId = Brands.id 
GROUP BY Brands.Name HAVING COUNT(Brands.Name) > 0
