use classicmodels;

DELIMITER //
create procedure find_all_customers ()
begin
select * from customers;
end //
delimiter ;

call find_all_customers ();
drop procedure find_all_customers;

DELIMITER //
create procedure find_all_customers ()
begin
select * from customers where customerNumber = 175 ;
end //
delimiter ;
call find_all_customers ();