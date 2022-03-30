use quan_ly_sinh_vien_ss3;
select * from student;
select * from student where status=true;
select * from `subject` where credit <10;
select s.student_id, s.studentname,c.class_name
from student s join class c on s.class_id=c.class_id;
-- HIỆN THỊ DANH SÁCH HỌC VIÊN A1
select s.student_id, s.studentname,c.class_name
from student s join class c on s.class_id=c.class_id
where c.class_name = 'A1';
-- 	HIỆN THỊ CÁC ĐIỂM CỦA MÔN CF
select s.student_id, s.studentname,sub.subname,m.mark
from student s join mark m on s.Student_Id = m.Student_Id join `subject` sub on m.sub_id = sub.sub_id;

select s.student_id, s.studentname,sub.subname,m.mark
from student s join mark m on s.Student_Id = m.Student_Id join `subject` sub on m.sub_id = sub.sub_id
where sub.subname = 'CF';