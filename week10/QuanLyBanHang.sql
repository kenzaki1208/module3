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

#1. Insert data
insert into Customer (cID, cName, cAge) values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into Orders (oID, cID, oDate, oTotalPrice) values
(1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 1, '2006-03-16', null);

insert into Product (pID, pName, pPrice) values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into OrderDetail (oID, pID, odQTY) values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

#2. Hiển thị các thông tin đơn hàng
select oID, oDate, oTotalPrice
from Orders;

#3. Danh sách khách hàng và tổng giá bán từng mặt hàng
select C.cName, P.pName, sum(OD.odQTY * P.pPrice) as TotalPrice
from Customer C
join Orders O on C.cID = O.cID
join OrderDetail OD on O.oID = OD.oID
join Product P on OD.pID = P.pID
group by C.cName, P.pName;

#4. Khách hàng không mua gì
select C.cID, C.cName, C.cAge
from Customer C
left join Orders O on C.cID = O.cID
where O.oID is null;

#5. Hóa đơn, ngày bán, tổng giá trị
select O.oID, O.oDate, sum(OD.odQTY * P.pPrice) as InvoiceTotal
from Orders O
join OrderDetail OD on O.oID = OD.oID
join Product P on OD.pID = P.pID
group by O.oID, O.oDate;
