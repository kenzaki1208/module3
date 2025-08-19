create database demo_DB;
use demo_DB;

create table products (
	Id int auto_increment primary key,
    productCode varchar(50) not null,
    productName varchar(100),
    productPrice decimal(10,2),
    productAmount int,
    productDescription varchar(255),
    productStatus varchar(50)
);

insert into Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
values
	('P001', 'Laptop', 1200.00, 10, 'Gaming laptop', 'Available'),
	('P002', 'Phone', 800.00, 25, 'Smartphone', 'Available'),
	('P003', 'Tablet', 500.00, 15, 'Android tablet', 'Out of stock');

#Tạo index    
create unique index idx_productCode on Products(productCode);

create index idx_productNamePrice on Products(productName, productPrice);

explain select * from Products where productCode = 'P001';
explain select * from Products where productName = 'Phone' and productPrice = 800.00;

#Tạo view
create view ProductView as
select productCode, productName, productPrice, productStatus
from Products;

select * from ProductView;

drop view ProductView;

#Tạo stored procedure
#1.Lấy tất cả sản phẩm
delimiter //
create procedure getAllProducts()
begin
	select * from Products;
end//
delimiter ;
call getAllProducts();

#2.Thêm sản phẩm mới
delimiter //
create procedure addProduct(
	in pCode varchar(50),
    in pName varchar(100),
    in pPrice decimal(10,2),
    in pAmount int,
    in pDesc varchar(255),
    in pStatus varchar(50)
)
begin
	insert into Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    values(pCode, pName, pPrice, pAmount, pDesc, pStatus);
end //
delimiter ;
call addProduct('P004', 'Monitor', 300.00, 20, '24 inch display', 'Available');

#3.Sửa thông tin sản phẩm
delimiter //
create procedure updateProduct(
    in pId int,
    in pCode varchar(50),
    in pName varchar(100),
    in pPrice decimal(10,2),
    in pAmount int,
    in pDesc varchar(255),
    in pStatus varchar(50)
)
begin
    update Products
    set productCode = pCode,
        productName = pName,
        productPrice = pPrice,
        productAmount = pAmount,
        productDescription = pDesc,
        productStatus = pStatus
    where Id = pId;
end //
delimiter ;
call updateProduct(1, 'P001', 'Laptop Gaming', 1300.00, 8, 'Updated description', 'Available');

#4. Xóa thông tin sản phẩm
DELIMITER //
CREATE PROCEDURE deleteProductById(IN pId INT)
BEGIN
    DELETE FROM Products WHERE Id = pId;
END//
DELIMITER ;
call deleteProductById(3);