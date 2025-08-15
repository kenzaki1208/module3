create database QuanLyLopHoc;

use QuanLyLopHoc;

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


insert into class values (1, 'A1', '2008-12-20', 1);
insert into class values (2, 'A2', '2008-12-22', 1);
insert into class values (3, 'B3', current_date, 0);

insert into student (StudentName, Address, Phone, Status, ClassId)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (StudentName, Address, Status, ClassId)
values ('Hoa', 'Hai Phong', 1, 1);
insert into student (StudentName, Address, Phone, Status, ClassId)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject 
values(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);

insert into Mark (SubId, StudentId, Mark, ExamTimes)
values (1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);

select * from class;
select * from student;
select * from subject;
select * from mark;

select * from student
where Status = true;

select * from subject
where Credit < 10;

select S.StudentId, S.StudentName, C.ClassName
from student S join class C on S.StudentId = C.ClassId; 

select S.StudentId, S.StudentName, C.ClassName
from student S join class C on S.StudentId = C.ClassId
where C.ClassName = 'A1'; 

select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from student S join mark M on S.StudentId = M.StudentId join subject Sub on M.SubId = Sub.SubId;

select S.StudentId, S.StudentName, Sub.SubName, M.Mark
from student S join mark M on S.StudentId = M.StudentId join subject Sub on M.SubId = Sub.SubId
where Sub.SubName = 'CF';

#yêu cầu 1:
select * from student
where StudentName like 'h%';

#yêu cầu 2:
select * from class
where month(StartDate) = 12;

#yêu cầu 3:
select * from subject
where Credit between 3 and 5;

#yêu cầu 4:
select StudentId from student where StudentName = 'Hung';
update student
set ClassId = 2
where StudentId = 1;

#yêu cầu 5:
select S.StudentName, Sub.SubName, M.Mark
from student S
join mark M on S.StudentId = M.StudentId
join subject Sub on M.SubId = Sub.SubId
order by M.Mark desc, S.StudentName asc;