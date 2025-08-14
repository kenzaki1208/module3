create database QuanLyBanHang;

use QuanLyBanHang;

CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    cName NVARCHAR(100) NOT NULL,
    cAge INT CHECK (cAge >= 0)
);

CREATE TABLE Orders (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATE,
    oTotalPrice DECIMAL(18,2) CHECK (oTotalPrice >= 0),
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName NVARCHAR(100) NOT NULL,
    pPrice DECIMAL(18,2) CHECK (pPrice >= 0)
);

CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT CHECK (odQTY > 0),
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES Orders(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);