create database quan_ly_vat_lieu;
use quan_ly_vat_lieu;
create table nha_cc(
ma_ncc int auto_increment,
ten_ncc varchar (50),
dia_chi varchar(100),
primary key (ma_ncc)
);
create table so_dien_thoai(
ma_ncc int,
sdt varchar (10),
primary key (sdt),
foreign key (ma_ncc) references nha_cc (ma_ncc)
);
create table don_dh (
so_dh int auto_increment,
ngay_dh date,
ma_ncc int,
primary key (so_dh),
foreign key (ma_ncc) references nha_cc (ma_ncc)
);
create table vat_tu (
ma_vtu int auto_increment,
ten_vtu varchar (50),
primary key (ma_vtu)
);
create table chi_tiet_don_dat_hang(
ma_vtu int,
so_dh int,
primary key (ma_vtu,so_dh),
foreign key (ma_vtu) references vat_tu (ma_vtu),
foreign key (so_dh) references don_dh (so_dh)
);
create table phieu_xuat (
so_px int auto_increment,
ngay_xuat date,
primary key (so_px)
);
create table chi_tiet_phieu_xuat(
so_px int,
ma_vtu int,
dg_xuat varchar (50),
sl_xuat varchar (50),
primary key (so_px,ma_vtu),
foreign key (so_px) references phieu_xuat (so_px),
foreign key (ma_vtu) references vat_tu (ma_vtu)
);
create table phieu_nhap(
so_pn int auto_increment,
ngay_nhap date,
primary key (so_pn)
);
create table chi_tiet_phieu_nhap (
dg_nhap varchar (50),
sl_nhap varchar (50),
ma_vtu int,
so_pn int,
primary key (ma_vtu,so_pn),
foreign key (ma_vtu) references vat_tu (ma_vtu),
foreign key (so_pn) references phieu_nhap (so_pn)
);
