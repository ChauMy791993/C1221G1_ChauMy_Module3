-- Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do,
-- ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021

use  quan_ly_furuma;

select hd.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi,count(hd.ma_nhan_vien)
from nhan_vien nv left join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
left join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
inner join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) in
(select count(ma_nhan_vien) from hop_dong
where ngay_lam_hop_dong between '2020-01-01'and '2021-12-30'
group by ma_nhan_vien 
having count(ma_nhan_vien) <=3)
;


