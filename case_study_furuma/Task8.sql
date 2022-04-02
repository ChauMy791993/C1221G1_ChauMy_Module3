-- Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

use  quan_ly_furuma;
-- cách 1: sủ dụng hàm distinct không hiện thị trùng nhau
select distinct ho_ten from khach_hang;

-- cách 2 : sử dung gruop by họ tên lại sẽ ko hiện thị trùng nhau
select ho_ten from khach_hang
group by ho_ten;

-- cách 3 : 
select ho_ten from khach_hang
union
select ho_ten from khach_hang;
