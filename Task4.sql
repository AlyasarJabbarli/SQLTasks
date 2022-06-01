--Task 
--Kitabxana database-i qurursunuz

--Books (Id, Name, PageCount)
--Books-un Name columu minimum 2 simvol maksimum 100 simvol deyer ala bileceyi serti olsun.
--Books-un PageCount columu minimum 10 deyerini ala bileceyi serti olsun.

--Authors (Id, Name, Surname)

--Books ve Authors table-larinizin mentiqi uygun elaqesi olsun.

--Id, Name, PageCount ve AuthorFullName columnlarinin valuelarini qaytaran bir view yaradin

--Gonderilmis axtaris deyirene gore hemin axtaris deyeri name ve ya authorFullNamelerinde olan Book-lari Id, Name, PageCount, AuthorFullName columnlari seklinde gostern procedure yazin

--Authors tableinin insert, update ve deleti ucun (her biri ucun ayrica) procedure yaradin

--Authors-lari Id,FullName,BooksCount,MaxPageCount seklinde qaytaran view yaradirsiniz Id-author id-si, FullName - Name ve Surname birlesmesi, 
--BooksCount - Hemin authorun elaqeli oldugu kitablarin sayi, MaxPageCount - hemin authorun elaqeli oldugu kitablarin icerisindeki max pagecount deyeri

CREATE DATABASE Library

USE Library

CREATE TABLE Books
(
	Id int Constraint PK_Books_Id primary key identity,
	Name nvarchar(100) not null Constraint CK_Books_Name Check(len(name) between 2 and 100),
	PageCount int not null Constraint CK_Books_PageCount Check(PageCount > 9),
	AuthorId int Constraint FK_Books_AuthorId foreign key references Authors(Id)
)

INSERT INTO Books
VALUES
('The Murder of Roger Ackroyd: A Hercule Poirot Mystery', 300 , 1),
('Thirteen Problems', 200 , 1),
('Murder on the Orient Express: A Hercule Poirot Mystery', 350 , 1),
('And Then There Were None ', 150 , 1),
('The Last Testament of Bill Bonanno: The Final Secrets of a Life in the Mafia ', 600 , 2),
('The Great Alignment: Race, Party Transformation, and the Rise of Donald Trump', 290 , 2),
('History of Tofu and Tofu Products', 344 , 2),
('Kids Night in', 450 , 3),
('In Bed with', 500 , 3),
('In Bed With Anthology', 690 , 3),
('Enough: The Violence Against Women and How to End It', 300 , 4),
('Distributions in Statistics', 400 , 5),
('Univariate Discrete Distributions', 500 , 5),
('Three-Six-Seven: Memoirs of a Very Important Man', 450 , 6),
('The Wall', 300 , 6),
('Hermes In Paris', 600 , 6),
('The Princess and the Magic Locket ', 400 , 7),
('The Noisy Noisy Farm', 400 , 7),
('A Glimpse of Stocking', 450 , 8),
('Taboo', 800 , 8),
('Pandora"s Box', 386 , 8),
('Hancock"s Half Hour', 570 , 9),
('Steptoe and Son', 480 , 9),
('Magnificent Mabel and the Rabbit Riot', 570 , 10),
('Suzy Orbit', 254 , 10),
('Youre Not A Proper Pirate Sidney Green Paperback', 150 , 10),
('That Bear Can"t Babysit', 630 , 10)


CREATE TABLE Authors
(
	Id int Constraint PK_Authors_Id primary key identity,
	Name nvarchar(50) not null Constraint CK_Authors_Name Check(len(name) > 2),
	Surname nvarchar(50) not null Constraint CK_Authors_Surname Check(len(Surname) > 2),
)

INSERT INTO Authors
VALUES
('Agatha','Christie'),
('Gary', 'Abromovitz'),
('Jessica', 'Adams'),
('Harriet', 'Johnson'),
('Norman', 'Johnson'),
('Peter', 'Vansittart'),
('Veronica', 'Vasylenko'),
('Elizabeth', 'Gage'),
('Roy', 'Galton'),
('Ruth', 'Quayle')




--Id, Name, PageCount ve AuthorFullName columnlarinin valuelarini qaytaran bir view yaradin

CREATE VIEW usv_GetBooksWithAuthorName
AS
SELECT Books.Id , Books.Name ,Books.PageCount, (Authors.Name + ' ' + Authors.Surname) as AuthorFullName FROM Books
Join Authors On Books.AuthorId = Authors.Id

SELECT * FROM usv_GetBooksWithAuthorName




--Gonderilmis axtaris deyerine gore hemin axtaris deyeri name ve ya 
--authorFullNamelerinde olan Book-lari Id, Name, PageCount, AuthorFullName columnlari seklinde gostern procedure yazin


CREATE PROCEDURE usp_GetBooksWithNameorAuthorFullName @Name nvarchar(100)
AS
BEGIN
	SELECT * FROM usv_GetBooksWithAuthorName
	WHERE Name like'%'+@Name+'%' OR AuthorFullName like'%'+@Name+'%'
END

EXEC usp_GetBooksWithNameorAuthorFullName 'he'




--Authors tableinin insert, update ve deleti ucun (her biri ucun ayrica) procedure yaradin


---INSERT
CREATE PROCEDURE usp_InsertAuthorsTable @Name nvarchar(50) , @SurName nvarchar(50)
AS
BEGIN
	INSERT INTO Authors
	VALUES
	(@Name, @SurName)
END

EXEC usp_InsertAuthorsTable Chingiz , Mustafayev


---UPDATE
CREATE PROCEDURE usp_UpdateAuthorsTable @Name nvarchar(50) , @SurName nvarchar(50) , @id int
As
BEGIN
	UPDATE Authors
	SET Name = @Name , Surname = @SurName
	WHERE Id = @id
END

EXEC usp_UpdateAuthorsTable Chingizzz , Mustafayev , 11


---DELETE
CREATE PROCEDURE  usp_DeleteAuthorsTable @id int
As
BEGIN
	DELETE FROM Authors
	WHERE Id = @id
END

EXEC usp_DeleteAuthorsTable 11



--Authors-lari Id,FullName,BooksCount,MaxPageCount seklinde qaytaran view yaradirsiniz Id-author id-si, FullName - Name ve Surname birlesmesi, 
--BooksCount - Hemin authorun elaqeli oldugu kitablarin sayi, MaxPageCount - hemin authorun elaqeli oldugu kitablarin icerisindeki max pagecount deyeri

CREATE VIEW usv_GetAuthorsData
As
SELECT Authors.Id , (Authors.Name+' ' + Authors.Surname) as FullName, count(Authors.Name) as BooksCount, Max(PageCount) as MaxPageCount  FROM Authors
Join Books On Books.AuthorId = Authors.Id 
GROUP BY Authors.Name , Authors.Surname , Authors.Id 

SELECT * FROM usv_GetAuthorsData


