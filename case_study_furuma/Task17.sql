-- Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

use  quan_ly_furuma;

create view loai_khach_can_tim as
select kh.ma_khach_hang,sum(dv.chi_phi_thue + coalesce((dvdk.gia * hdct.so_luong),0)) as tong_tien
from khach_hang kh join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where ( year(hd.ngay_lam_hop_dong) = 2021 and lk.ma_loai_khach = 2 ) 
group by kh.ma_khach_hang;

update khach_hang
set ma_loai_khach = 1
where ma_khach_hang in (select ma_khach_hang from loai_khach_can_tim where tong_tien >10000000);

select *
from loai_khach_can_tim;
