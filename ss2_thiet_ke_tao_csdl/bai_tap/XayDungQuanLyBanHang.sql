create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer (
cid int auto_increment,
cname varchar (50),
cage varchar (20),
primary key (cid)
);
create table `order` (
oid int auto_increment,
cid int,
odate date,
ototal_price varchar (50),
primary key (oid),
foreign key (cid) references customer (cid)
);
create table product (
pid int auto_increment,
pname varchar (50),
pprice varchar (100),
primary key (pid)
);
create table order_detail (
oid int,
pid int,
od_qty varchar (100),
primary key (oid,pid),
foreign key (oid) references `order` (oid),
foreign key (pid) references product (pid)
);