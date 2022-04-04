-- Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

use  quan_ly_furuma;

SET SQL_SAFE_UPDATES = 0;
delete from nhan_vien nv
where nv.ma_nhan_vien  not in
(select ma_nhan_vien from hop_dong where ngay_lam_hop_dong between '2019-01-01'and '2021-12-31');
SET SQL_SAFE_UPDATES = 1;
