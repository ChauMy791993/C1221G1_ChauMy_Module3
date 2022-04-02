create database demo;
use demo;
create table products (
id int auto_increment,
`name` varchar(45),
price double,
amount int,
`description` varchar(50),
`status` bit(1),
primary key (id)
);

insert into products (`name`,price,amount,`description`,`status`)
values
("áo",100,2,"áo dài tay",1),
("quần",70,8,"quần kaki",0),
("giày",80,4,"giày adidas",0),
("dép",20,10,"dép gucci",1);

explain select * from products where products.id = 3;
-- type: const
explain select * from products where products.name = "quat";
-- type: all

create unique index id_idx
on products (id);

create index info_idx
on products (`name`,price);
explain select * from products where products.id = 3;
-- type: const
explain select * from products where products.name = "quat";
-- type: ref

create view products_view as
select id,`name`,price,`status` 
from products;

select * from products_view;

alter view products_view as
select id,`name`,price
from products;

select * from products_view;

delimiter //
create procedure show_all_info_product()
begin
select * from products;
end //
delimiter ;
 
call show_all_info_product();

delimiter //
create procedure add_new_product(
in `name` varchar(45),
in price double,
in amount int,
in `description` varchar(45),
`status` bit(1)
)
begin
insert into products (`name`,price,amount,`description`,`status`)
values
(`name`,price,amount,`description`,`status`);
end //
delimiter ;

call add_new_product("nón",5000,1,"nón lưỡi trai",1);

call show_all_info_product();

delimiter //
create procedure edit_product(
in id int,
in `name` varchar(45),
in price double,
in amount int,
in `description` varchar(45),
`status` bit(1)
)
begin
update products
set products.`name` = `name`,
products.price = price,
products.amount = amount,
products.`description` = `description`,
products.`status` = `status`
where products.id = id;
end //
delimiter ;

call edit_product(3,"balo",120,5,"balo da",1);

call show_all_info_product;

delimiter //
create procedure delete_product(in id int)
begin
delete from products
where products.id = id;
end //
delimiter ;

call show_all_info_product;

call delete_product(4);

call show_all_info_product;