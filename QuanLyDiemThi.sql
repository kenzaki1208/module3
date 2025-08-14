create database QuanLyDiemThi;

use QuanLyDiemThi;

#bài thực hành 2
create table HocSinh (
	MaHS varchar(20) primary key,
    TenHS varchar(50),
    NgaySinh datetime,
    Lop varchar(20),
    GT varchar(20)
);

create table MonHoc(
	MaMH VARCHAR(20) PRIMARY KEY,
	TenMH VARCHAR(50),
	MaGV VARCHAR(20)
);

create table BangDiem (
	MaHS VARCHAR(20),
	MaMH VARCHAR(20),
	DiemThi INT,
	NgayKT DATETIME,
	PRIMARY KEY (MaHS, MaMH),
	FOREIGN KEY (MaHS) REFERENCES HocSinh(MaHS),
	FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH)
);

create table GiaoVien(
	MaGV VARCHAR(20) PRIMARY KEY,
	TenGV VARCHAR(20),
	SDT VARCHAR(10)
);

ALTER TABLE MonHoc ADD CONSTRAINT FK_MaGV FOREIGN KEY (MaGV) REFERENCES GiaoVien(MaGV);


#bài thực hành 3
create table class (
	ClassID int not null auto_increment primary key,
	ClassName varchar(60) not null,
	StartDate datetime not null,
	Status bit
);

create table student (
	StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	StudentName VARCHAR(30) NOT NULL,
	Address VARCHAR(50),
	Phone VARCHAR(20),
	Status BIT,
	ClassId INT NOT NULL,
	FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
); 

create table subject (
	SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	SubName VARCHAR(30) NOT NULL,
	Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
	Status BIT DEFAULT 1
);

create table mark (
	MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	SubId INT NOT NULL,
	StudentId INT NOT NULL,
	Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
	ExamTimes TINYINT DEFAULT 1,
	UNIQUE (SubId, StudentId),
	FOREIGN KEY (SubId) REFERENCES Subject (SubId),
	FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);