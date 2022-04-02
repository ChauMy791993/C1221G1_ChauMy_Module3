-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

use quan_ly_furuma;

select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat
from hop_dong hd inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
where kh.ma_loai_khach = 1
group by kh.ma_khach_hang
order by so_lan_dat;
