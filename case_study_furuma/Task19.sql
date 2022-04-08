-- Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
use  quan_ly_furuma;

create view dich_vu_cap_nha_gia as
select hdct.ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where hdct.so_luong >10 and year(hd.ngay_lam_hop_dong) = 2020
group by hdct.ma_dich_vu_di_kem;

SET SQL_SAFE_UPDATES = 0;

update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from dich_vu_cap_nha_gia );

SET SQL_SAFE_UPDATES = 1;