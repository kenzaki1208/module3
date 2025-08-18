use quanlylophoc;


#Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select Address, count(StudentId) as 'Số lượng học viên'
from student
group by Address;


#Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select S.StudentId, S.StudentName, AVG(Mark)
from Student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having AVG(Mark) > 15; #Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15


#Hiển thị thông tin các học viên có điểm trung bình lớn nhất
select S.StudentId, S.StudentName, AVG(Mark)
from Student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having AVG(Mark) >= ALL (select AVG(Mark) from Mark group by Mark.StudentId); #Sử dụng Having và All để tìm học viên có điểm trung bình lớn nhất


#Bài tập 1: Luyện tập các hàm thông dụng trong SQL
#a)
select * from subject where Credit = (select max(Credit) from subject);

#b)
select S.StudentName, Sub.SubName, M.Mark
from student S
join mark M on S.StudentId = M.StudentId
join subject Sub on M.SubId = Sub.SubId
where M.Mark = (select max(Mark) from mark); 

#c)
select S.StudentId, S.StudentName, AVG(M.Mark) as DiemTrungBinh
from student S
join mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
order by DiemTrungBinh desc;