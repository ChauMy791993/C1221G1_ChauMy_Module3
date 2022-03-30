create database quan_ly_sinh_vien_ss3;
use quan_ly_sinh_vien_ss3;
create table class(
class_id int auto_increment,
class_name varchar (50),
start_date date,
`status` bit,
primary key (class_id)
);
insert into class (class_name, start_date,status)
values 
('A1', '2008-12-20', 1),('A2','2008-12-22', 1),('B3', current_date, 0);

create table student(
Student_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
StudentName VARCHAR(30) NOT NULL,
Address VARCHAR(50),
Phone VARCHAR(20),
`Status` BIT,
Class_Id INT NOT NULL,
FOREIGN KEY (Class_Id) REFERENCES Class (Class_ID)
);
insert into student (StudentName,Address,Phone,`Status`,Class_Id)
values 
('Hung', 'Ha Noi', '0912113113', 1, 1),('Hoa', 'Hai phong','0912114113', 1, 1),('Manh', 'HCM', '0123123123', 0, 2);

create table `subject`(
Sub_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
SubName VARCHAR(30) NOT NULL,
Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
`Status` BIT DEFAULT 1
);
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
create table mark(
Mark_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Sub_Id INT NOT NULL,
Student_Id INT NOT NULL,
Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
ExamTimes TINYINT DEFAULT 1,
UNIQUE (Sub_Id, Student_Id),
FOREIGN KEY (Sub_Id) REFERENCES Subject (Sub_Id),
FOREIGN KEY (Student_Id) REFERENCES Student (Student_Id)
);
INSERT INTO Mark (Sub_Id, Student_Id, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);




