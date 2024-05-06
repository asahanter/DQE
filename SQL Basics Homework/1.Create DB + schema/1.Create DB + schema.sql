-- Створення бази даних Employee
CREATE DATABASE Employee;
GO

-- Використання бази даних Employee
USE Employee;
GO

-- Створення таблиці Departaments
CREATE TABLE Departaments (
    ID INT CONSTRAINT PK_Departaments PRIMARY KEY IDENTITY,
    Name NVARCHAR(50) NOT NULL
);
GO

-- Створення таблиці Contacts
CREATE TABLE Contacts (
    ID INT CONSTRAINT PK_Contacts PRIMARY KEY IDENTITY,
    Email NVARCHAR(50) NOT NULL,
    Phone NVARCHAR(20) NOT NULL
);
GO

-- Створення таблиці Addresses
CREATE TABLE Addresses (
    ID INT CONSTRAINT PK_Addresses PRIMARY KEY IDENTITY,
    Country NVARCHAR(50) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Address NVARCHAR(100) NOT NULL
);
GO

-- Створення таблиці Employee
CREATE TABLE Employee (
    ID INT CONSTRAINT PK_Employee PRIMARY KEY IDENTITY,
    Firstname NVARCHAR(50) NOT NULL,
    Lastname NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    DepartamentID INT,
    ContactID INT,
    Position NVARCHAR(50) NOT NULL,
    WorkFromDate DATE NOT NULL
);
GO

-- Створення таблиці Salary
CREATE TABLE Salary (
    ID INT CONSTRAINT PK_Salary PRIMARY KEY IDENTITY,
    EmpID INT,
    Sum DECIMAL(10, 2) NOT NULL,
    Date DATE NOT NULL
);
GO

-- Створення проміжної таблиці Emp_Addr для зв'язку Employee та Addresses
CREATE TABLE Emp_Addr (
    EmpID INT,
    AddrID INT,
    CONSTRAINT PK_Emp_Addr PRIMARY KEY (EmpID, AddrID)
);
GO

-- Додавання зовнішнього ключа DepartamentID до таблиці Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_DepartamentID FOREIGN KEY (DepartamentID)
REFERENCES Departaments(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO

-- Додавання зовнішнього ключа ContactID до таблиці Employee
ALTER TABLE Employee
ADD CONSTRAINT FK_Employee_ContactID FOREIGN KEY (ContactID)
REFERENCES Contacts(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO

-- Додавання зовнішнього ключа EmpID до таблиці Salary
ALTER TABLE Salary
ADD CONSTRAINT FK_Salary_EmpID FOREIGN KEY (EmpID)
REFERENCES Employee(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO

-- Додавання зовнішнього ключа EmpID до таблиці Emp_Addr
ALTER TABLE Emp_Addr
ADD CONSTRAINT FK_Emp_Addr_EmpID FOREIGN KEY (EmpID)
REFERENCES Employee(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO

-- Додавання зовнішнього ключа AddrID до таблиці Emp_Addr
ALTER TABLE Emp_Addr
ADD CONSTRAINT FK_Emp_Addr_AddrID FOREIGN KEY (AddrID)
REFERENCES Addresses(ID)
ON DELETE CASCADE
ON UPDATE CASCADE;
GO