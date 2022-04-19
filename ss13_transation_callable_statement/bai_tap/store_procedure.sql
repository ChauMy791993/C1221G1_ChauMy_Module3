use demo;


delimiter //
CREATE PROCEDURE get_list_user()
BEGIN
    SELECT users.id, users.name, users.email, users.country
    FROM users;
    END//
delimiter ;
call get_list_user();


delimiter //
CREATE PROCEDURE update_user(in id_input int, in name_input varchar(120), in email_input varchar(220), in country_input varchar(120))
    
    update users
    SET SQL_SAFE_UPDATES = 0;
	set `name` = name_input, email = email_input, country = country_input	 
	where id = id_input ;
    SET SQL_SAFE_UPDATES = 1;
    END//
delimiter ;
call update_user(4,'phuong','phuong@gmail.com', 'campuchia');

delimiter //
CREATE PROCEDURE delete_user_by_id(in id_input int)
BEGIN
    delete from users where id = id_input;
    END//
delimiter ;

call delete_user_by_id (4);


