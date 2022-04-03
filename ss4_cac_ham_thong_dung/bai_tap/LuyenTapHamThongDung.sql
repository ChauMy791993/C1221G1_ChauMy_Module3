use quan_ly_sinh_vien_ss3;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select subject.*
 from `subject`
 where credit = ( select max(credit) from  `subject`);
 
 -- Hiển thị các thông tin môn học có điểm thi lớn nhất.
 select *
 from `subject` sub join mark m on sub.Sub_Id= m.Sub_Id
 where mark = (select max(mark) from mark);
 
 -- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.Student_Id,s.StudentName, avg(mark)
from student s join mark m on s.Student_Id = m.Student_Id
group by s.Student_Id
order by avg(mark) desc;

