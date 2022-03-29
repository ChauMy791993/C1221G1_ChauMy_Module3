create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
class_id int not null auto_increment primary key,
class_name varchar (60) not null,
start_date datetime not null,
`status` bit
);
create table Student(
Student_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Student_Name VARCHAR(30) NOT NULL,
Address VARCHAR(50),
Phone VARCHAR(20),
`Status` BIT,
Class_Id INT NOT NULL,
FOREIGN KEY (Class_Id) REFERENCES Class (Class_ID)
);
CREATE TABLE `Subject`(
Sub_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Sub_Name VARCHAR(30) NOT NULL,
Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
`Status` BIT DEFAULT 1
);
CREATE TABLE Mark(
Mark_Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Sub_Id INT NOT NULL,
Student_Id INT NOT NULL,
Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
ExamTimes TINYINT DEFAULT 1,
UNIQUE (Sub_Id, Student_Id),
FOREIGN KEY (Sub_Id) REFERENCES `Subject` (Sub_Id),
FOREIGN KEY (Student_Id) REFERENCES Student (Student_Id)
);
