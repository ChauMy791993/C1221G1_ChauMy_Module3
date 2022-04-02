 -- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
 -- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá
 -- là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
 -- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
use quan_ly_furuma;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));


select k_h.ma_khach_hang, k_h.ho_ten,l_k.ten_loai_khach,h_d.ma_hop_dong,d_v.ten_dich_vu,h_d.ngay_lam_hop_dong,h_d.ngay_ket_thuc,
sum((d_v.chi_phi_thue + coalesce((d_v_d_k.gia * h_d_c_t.so_luong),0))) as tong_tien
from khach_hang k_h left join loai_khach l_k
on k_h.ma_loai_khach = l_k.ma_loai_khach
left join hop_dong h_d
on k_h.ma_khach_hang = h_d.ma_khach_hang
left join dich_vu d_v
on d_v.ma_dich_vu = h_d.ma_dich_vu
left join hop_dong_chi_tiet h_d_c_t
on h_d_c_t.ma_hop_dong = h_d.ma_hop_dong
left join dich_vu_di_kem d_v_d_k
on h_d_c_t.ma_dich_vu_di_kem = d_v_d_k.ma_dich_vu_di_kem
group by h_d.ma_hop_dong
order by k_h.ma_khach_hang;

