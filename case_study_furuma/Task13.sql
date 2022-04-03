-- Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

use  quan_ly_furuma;

select hdct.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem,sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem 
having so_luong_dich_vu_di_kem = (select sum(so_luong) from hop_dong_chi_tiet group by ma_dich_vu_di_kem order by sum(so_luong) desc limit 1 );
