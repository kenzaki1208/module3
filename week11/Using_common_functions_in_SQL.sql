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