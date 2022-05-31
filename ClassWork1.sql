--Employees (Id,FullName,Salary,DepartmentId, Email) ve Departments(Id, Name) table-lariniz olsun ve aralarinda one to many
--bir relation qurun.

 --- Employee Salary- 0 -dan kicik ola bilmesiz
 --- Employee FullName - NULL OLA BILEZ ,  uzunlugu 3-den boyuk olmaldir
 --- Department Name - uzunlugu 2-den boyuk olamlidir, null ola bilmez
 --- Email Null Ola Bilmez Ve Tekrar Olunmasin 


CREATE DATABASE COMPANY

use company

CREATE TABLE Employees
(
	Id int constraint PK_Employees_Id primary key identity,
	FullName nvarchar(50) not null constraint CK_Employees_FullName check(len(FullName)>3),
	Salary money constraint CK_Employees_Salary check(Salary>0),
	DepartmentId int constraint FK_Employees_DepartmentId foreign key references Departments(Id) ,  
	Email nvarchar(50) not null constraint UQ_Employees_Email unique
)

CREATE TABLE Departments(
	Id int constraint PK_Departments_Id primary key identity,
	Name nvarchar(50) not null constraint CK_Departments_Name check(len(Name)>2),
)


INSERT INTO Departments
Values
('IT12'),
('HR33'),
('Office'),
('idk4')

INSERT INTO Employees
Values 
('Alyasar Jabbarli', 2000 , 2 , 'alyasar@code.edu.az'),
('Hamid Mammadov', 4000 , 3 , 'Hamid@code.edu.az'),
('Parviz Alizade', 1000 , 4 , 'Parviz@code.edu.az'),
('Vasif Aliyev', 2500 , 2 , 'Vasif@code.edu.az'),
('Elgiz ALiyev', 10000 , 4 , 'Elgiz@code.edu.az'),
('Musa Dadashov', 20000 , 3 , 'Musa@code.edu.az')



