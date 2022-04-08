-- Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

alter table hop_dong drop constraint hop_dong_ibfk_2;
alter table hop_dong add constraint hop_dong_ibfk_2 
foreign key (ma_khach_hang) references khach_hang (ma_khach_hang) on delete set null;
delimiter //
create procedure sp_xoa_khach_hang (in ma_khach_hang int)
begin
delete from khach_hang where khach_hang.ma_khach_hang = ma_khach_hang;
end //
delimiter ;
call sp_xoa_khach_hang(9);