-- Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

use  quan_ly_furuma;

select dvdk.ma_dich_vu_di_kem ,dvdk.ten_dich_vu_di_kem,lk.ten_loai_khach, kh.dia_chi
from dich_vu_di_kem dvdk left join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
left join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi' )
