-- Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

use  quan_ly_furuma;
SET SQL_SAFE_UPDATES = 0;
update v_nhan_vien, (select dia_chi from v_nhan_vien) as select_dia_chi
set v_nhan_vien.dia_chi = replace(v_nhan_vien.dia_chi,'%Hải Châu%', '%Liên Chiểu%')
where v_nhan_vien.dia_chi = select_dia_chi.dia_chi;
SET SQL_SAFE_UPDATES = 1;

