/* Học phần: Cơ sở dữ liệu
   Người thực hiện: Nguyễn Thị Thuỳ Linh
   MSSV: 2111858
   Lớp: CTK45B
   Ngày bắt đầu: 23/02/2023
   Ngày kết thúc: ?????
*/


CREATE DATABASE LAB02_QL_SX

go
use LAB02_QL_SX

go
create table ToSanXuat(
MaTSX nchar(5) primary key, 
TenTSX nchar(5)
)
go
create table CongNhan(
MaCN nchar(5)primary key, 
Ho nchar(20), Ten nchar(10), 
Phai nchar(4), NgaySinh datetime, 
MaTSX nchar(5) references ToSanXuat(MaTSX)
)
go
create table SanPham(
MaSP nvarchar(5) primary key,
TenSP nchar(20) not null,
DVT nchar(5) not null,
TienCong integer not null
)
go
create table ThanhPham(
MaCN nchar(5) references CongNhan(MaCN),
MaSP nvarchar(5) references SanPham(MaSP),
Ngay datetime,
SoLuong tinyint
)
go
insert into ToSanXuat values('TS01', N'Tổ 1')
insert into ToSanXuat values('TS02', N'Tổ 2')
select *from ToSanXuat

set dateformat dmy
go
insert into CongNhan values('CN001',N'Nguyễn Trường',N'An',N'Nam','12/05/1981','TS01')
insert into CongNhan values('CN002',N'Lê Thị Hồng',N'Gấm',N'Nữ','04/06/1980','TS01')
insert into CongNhan values('CN003',N'Nguyễn Công', 'Thành',N'Nam','04/05/1981','TS02')
insert into CongNhan values('CN004',N'Vỗ Hữu',N'Hạnh',N'Nam','15/02/1980','TS02')
insert into CongNhan values('CN005',N'Lý Thanh',N'Hân',N'Nữ','03/12/1981','TS01')

select *from CongNhan

insert into SanPham values('SP001',N'Nồi đất',N'cái',10000)
insert into SanPham values('SP002',N'Chén',N'cái',2000)
insert into SanPham values('SP003',N'Bình gốm nhỏ',N'cái',20000)
insert into SanPham values('SP004',N'Bình gốm lớn',N'cái',25000)

select * from SanPham

insert into ThanhPham values ('CN001','SP001','01/02/2007',10)
insert into ThanhPham values ('CN002','SP001','01/02/2007',5)
insert into ThanhPham values ('CN003','SP002','10/01/2007',50)
insert into ThanhPham values ('CN004','SP003','12/01/2007',10)
insert into ThanhPham values ('CN005','SP002','12/01/2007',100)
insert into ThanhPham values ('CN002','SP004','13/02/2007',10)
insert into ThanhPham values ('CN001','SP003','14/02/2007',15)
insert into ThanhPham values ('CN003','SP001','15/01/2007',20)
insert into ThanhPham values ('CN003','SP004','14/02/2007',15)
insert into ThanhPham values ('CN004','SP002','30/01/2007',100)
insert into ThanhPham values ('CN005','SP003','01/02/2007',50)
insert into ThanhPham values ('CN001','SP001','20/02/2007',30)
select * from ThanhPham


select *from ToSanXuat
select *from CongNhan
select * from SanPham
select * from ThanhPham


--delete from ThanhPham

--C1: Liet ke cac cong nhan theo to san xuat
select a.TenTSX, b.Ho+' '+b.Ten as HoTen, b.NgaySinh, b.Phai
from ToSanXuat a, CongNhan b
where a.MaTSX = b.MaTSX
order by a.TenTSX, b.Ten
go
--C2: Liet ke cac thanh pham ma cong nhan 'Nguyen Truong An'  da lam duoc
select a.TenSP, b.Ngay, b.SoLuong, b.SoLuong*a.TienCong as ThanhTien
from SanPham a, ThanhPham b, CongNhan c
where a.MaSP=b.MaSP and c.MaCN=b.MaCN and c.Ho=N'Nguyễn Trường'and c.Ten=N'An'
order by b.Ngay
go
--C3: Liet ke cac cong nhan khong san xuat Binh gom lon
select a.MaCN, a.Ho+''+a.Ten as HoTen
from CongNhan a
where a.MaCN not in
(
select c.MaCN
from SanPham b, ThanhPham c
where b.MaSP=c.MaSP and b.TenSP=N'Bình gốm lớn'
)
go

--C4: Liet ke thong tin cac cong nhan co san xuat ca 'Noi dat' va 'Binh gom nho' 3
select a.MaCN, a.Ho+''+a.Ten as HoTen
from CongNhan a, ThanhPham b, SanPham c
where a.MaCN = b.MaCN and b.MaSP = c.MaSP and c.TenSP = N'Nồi đất' and a.MaCN in
(
select d.MaCN
from ThanhPham d, SanPham e
where d.MaSP=e.MaSP and e.TenSP=N'Bình gốm nhỏ'
)
group by a.MaCN, Ho, Ten
go

--C5: Thong ke so luong cong nhan theo tung to san xuat
select a.MaTSX,a.TenTSX, count(b.MaCN) as SoLuong
from ToSanXuat a, CongNhan b
where a.MaTSX=b.MaTSX
group by a.MaTSX,a.TenTSX
go

--C6: Tong so luong thanh pham theo tung loai ma nhan vien do lam duoc
select a.Ho+a.Ten as HọTên, b.TenSP, sum(SoLuong) as TongSLThanhPham, sum(SoLuong*TienCong) as TongThanhTien
from CongNhan a, SanPham b, ThanhPham c
where a.MaCN = c.MaCN and b.MaSP = c.MaSP
group by a.Ho, a.Ten, b.TenSP
go

--C7: Tong tien cong da tra cho thang 1 nam 2007
select sum(b.SoLuong * a.TienCong) as TienCong
from SanPham a, ThanhPham b
where a.MaSP = b.MaSP and month(b.Ngay) = '1' and year(b.Ngay) = '2007'
go

--C8:Sản phẩm được sản xuất nhiều nhất trong tháng 2/2007


--C10: Tien cong thang 2/2006 cua cong nhan co ma so 'CN002'
select b.MaCN, sum(b.SoLuong * a.TienCong) as TienCong
from SanPham a, ThanhPham b
where a.MaSP = b.MaSP and month(b.Ngay) = '2' and year(b.Ngay) = '2007' and b.MaCN = 'CN002'
group by b.MaCN
go

--C11: Liet ke cac cong nhan co san xuat tu 3 loai san pham tro len
select MaCN, count(MaSP) as SLCN
from ThanhPham
group by MaCN
having count(MaSP) >= 3
go

--C12: Cap nhat gia tien cong cua cac loai binh gom them 1000
UPDATE SanPham
set TienCong=(TienCong+1000)
where MaSP='SP003' or MaSP='SP004'
go

select *from SanPham
--C13: Them bo <'CN006', 'Lê Thị', 'Lan', 'Nữ', 'TS02'> vào bảng cong nhan
insert into CongNhan values ('CN006', 'Lê Thị', 'Lan', N'Nữ',null ,'TS02')
select *from CongNhan
go



