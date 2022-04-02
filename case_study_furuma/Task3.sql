-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
use quan_ly_furuma;

select ma_khach_hang, ho_ten ,timestampdiff(YEAR, ngay_sinh, CURDATE())as age, dia_chi
from khach_hang
where (timestampdiff(YEAR, ngay_sinh, CURDATE()) between 18 and 50)
and dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị';
