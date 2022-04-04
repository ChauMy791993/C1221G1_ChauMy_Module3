-- Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
use  quan_ly_furuma;

alter table hop_dong drop constraint hop_dong_ibfk_2;
alter table hop_dong add constraint hop_dong_ibfk_2 foreign key (ma_khach_hang)
references khach_hang (ma_khach_hang) on delete set null;
SET SQL_SAFE_UPDATES = 0;
delete kh from khach_hang kh inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) = 2020 and year(hd.ngay_lam_hop_dong) != 2021;