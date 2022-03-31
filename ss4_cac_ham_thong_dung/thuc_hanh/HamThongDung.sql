use quan_ly_sinh_vien_ss3;

select Address , count(Student_Id) as 'so luong sinh vien'
from student
group by Address;

 select  s.Student_Id, s.studentname, avg(mark)
 from student s join mark m on s.Student_Id=m.Student_Id
 group by s.Student_Id, s.studentname;
 
 select  s.Student_Id, s.studentname, avg(mark)
 from student s join mark m on s.Student_Id=m.Student_Id
 group by s.Student_Id, s.studentname
 having avg(mark) > 15;
 
 select  s.Student_Id, s.studentname, avg(mark)
 from student s join mark m on s.Student_Id=m.Student_Id
 group by s.Student_Id, s.studentname
 having avg(mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.Student_Id);