create table student_management.class (
id int not null,
`name` varchar (45) null,
primary key (id));
insert into student_management.class
(id,name)
values
(1,"c1221g1"),
(2,"c0222g1");

create table student_management.teacher(
id int not null,
`name` varchar (45) null,
`age` int null,
`country` varchar (45) null,
primary key (id));
insert into student_management.teacher
(id,name,age,country)
values
(1,"chanh",40,"ha tinh"),
(2,"trung dc",30,"quang nam"),
(3,"chien tv",27,"nghe an");
delete from student_management.teacher where id=1;
insert into student_management.teacher
(id,name,age,country)
values
(1,"chanh",40,"vn");
delete from student_management.teacher where id between 2 and 3;
insert into student_management.teacher
(id,name,age,country)
values
(2,"trung dc",30,"vn"),
(3,"chien tv",27,"vn");
