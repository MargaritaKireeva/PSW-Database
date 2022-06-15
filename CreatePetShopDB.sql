CREATE DATABASE PetShopDB
COLLATE Cyrillic_General_100_CI_AI
GO

USE PetShopDB

CREATE TABLE Clients (
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Clients PRIMARY KEY,
  Name nvarchar(50) NOT NULL,
  Email nvarchar(50) NOT NULL,
);


CREATE TABLE Cathegories (
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Cathegories PRIMARY KEY,
  Name nvarchar(50) NOT NULL,
);

CREATE TABLE SubCathegories (
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_SubCathegories PRIMARY KEY,
  Name nvarchar(50) NOT NULL,
  CathegoryID int NOT NULL,
  CONSTRAINT FK_SubCathegories_CathegoryID
    FOREIGN KEY (CathegoryID)
      REFERENCES Cathegories(ID)
);

CREATE TABLE Items (
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Items PRIMARY KEY,
  Name nvarchar(100) NOT NULL,
  AmountAll int NOT NULL,
  SubCathegoryID int NOT NULL,
  AmountAvailable int NOT NULL,
  ItemDescription nvarchar(1000) NOT NULL,
  Picture nvarchar(1000) NOT NULL,
  Price decimal NOT NULL,
  CONSTRAINT FK_Items_SubCathegoryID
    FOREIGN KEY (SubCathegoryID)
      REFERENCES SubCathegories(ID)
);

CREATE TABLE Bookings (
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Bookings PRIMARY KEY,
  ItemID int NOT NULL,
  ClientID int NOT NULL,
  BookingDate datetime NOT NULL,
  Amount int NOT NULL,
  BookingNumber nvarchar(50) NOT NULL,
  BookingStatus nvarchar(30) NOT NULL,
  CONSTRAINT FK_Bookings_ClientID
    FOREIGN KEY (ClientID)
      REFERENCES Clients(ID),
  CONSTRAINT FK_Bookings_ItemID
    FOREIGN KEY (ItemID)
      REFERENCES Items(ID)
);



CREATE TABLE [Parameters] (
  ID int IDENTITY(1,1) NOT NULL CONSTRAINT PK_Parameters PRIMARY KEY,
  Name nvarchar(100) NOT NULL,
  Value nvarchar(100) NOT NULL,
  ItemID int NOT NULL,
  CONSTRAINT FK_Parameters_ItemID
    FOREIGN KEY (ItemID)
      REFERENCES Items(ID)
);

