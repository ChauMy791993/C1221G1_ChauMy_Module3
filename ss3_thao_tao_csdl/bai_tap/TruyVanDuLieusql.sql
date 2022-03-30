use quan_ly_sinh_vien_ss3;
select * from student where StudentName like 'h%';
select * from class where month (start_date) = 12;
select * from `subject` where credit between 3 and 5 ;
set sql_safe_updates = 0;
update student set  class_id = 2 where studentname = 'Hung';
set sql_safe_updates = 1;
select s.studentname,sub.subname,m.mark
from student s inner join mark m on s.Student_Id = m.Student_Id
inner join `subject` sub on sub.sub_id = m.sub_id; 