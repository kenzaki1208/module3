create database QuanLyDiemThi;

use QuanLyDiemThi;

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