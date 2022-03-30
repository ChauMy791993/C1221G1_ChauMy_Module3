use quan_ly_ban_hang;
alter table customer add cage tinyint;

insert into customer (cname,cage)
values ('Minh Quan',10),('Ngoc Oanh',20),('Hong Ha',50);


insert into `order` (cid,odate)
values (1,'2006-3-21'),(2,'2006-3-23'),(1,'2006-3-16');

insert into product (pname,pprice)
values ('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

insert into order_detail (oid,pid,od_qty)
values (1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select oid,odate,ototal_price from `order`;
select c.cid,c.cname,p.pid,p.pname 
from customer c inner join `order` o on c.cid= o.cid
inner join order_detail od on o.oid= od.oid
inner join product p on p.pid= od.pid;

select c.cid, c.cname
from customer c left join `order` o on c.cid= o.cid
where o.cid is null;

select o.oid, o.odate, od.od_qty * p.pprice as total
from `order` o inner join order_detail od on o.oid = od.oid
inner join product p on p.pid = od.pid