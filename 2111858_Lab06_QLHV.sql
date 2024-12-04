create database Lab06_QL_HV
go
use Lab06_QL_HV
go

create table CaHoc(
Ca tinyint primary key, GioBatDau time, GioKetThuc time
)

create table GiaoVien(
MSGV nchar(5) primary key, HoGV nvarchar(20), TenGV nvarchar(10),DienThoai int
)

create table Lop (
MaLop nchar(5) primary key, TenLop nchar(20), NgayKG date,HocPhi int, Ca tinyint references CaHoc(Ca),  SoTiet tinyint, SoHV tinyint, MSGV nchar(5) references GiaoVien(MSGV)
)

create table  HocVien(
MSHV nchar(8) primary key, Ho nvarchar(30),Ten nvarchar(10), NgaySinh date, Phai nvarchar(3),MaLop nchar(5) references Lop(MaLop)
)

create table HocPhi (
SoBL nchar(5) primary key, MSHV nchar(8) references HocVien(MSHV),NgayThu date,SoTien int, NoiDung nvarchar(20), NguoiThu nvarchar(5)
)

set dateformat dmy

insert into CaHoc values (1,'07:30','10:45'),
						 (2,'13:30','16:45'),
						 (3,'17:30','20:45')
go
insert into GiaoVien values ('G001',N'Lê Hoàng',N'Anh',0858936),
							('G002',N'Nguyễn Ngọc',N'Lan',0845623),
							('G003',N'Trần Minh',N'Hùng',0823456),
							('G004',N'Võ Thanh',N'Trung',0841256)
go
insert into Lop values ('E114','Excel 3-5-7','02/01/2008',120000,1,45,3,'G003'),
					   ('E115','Excel 2-4-6','22/01/2008',120000,3,45,0,'G001'),
					   ('W123','Word 2-4-6','18/02/2008',100000,3,30,1,'G001'),
					   ('W124','Word 3-5-7','01/03/2008',100000,1,30,0,'G002'),
					   ('A075','Access 2-4-6','18/02/2008',150000,3,60,3,'G003')
go
insert into HocVien values ('A07501',N'Lê Văn',N'Minh','10/06/1998',N'Nam','A075'),
						   ('A07502',N'Nguyễn Thị',N'Mai','20/04/1998',N'Nữ','A075'),
						   ('A07503',N'Lê Ngọc',N'Tuấn','10/06/1994',N'Nam','A075'),
						   ('E11401',N'Vương Tuấn',N'Vũ','25/03/1999',N'Nam','E114'),
						   ('E11402',N'Lý Ngọc',N'Hân','01/12/1995',N'Nữ','E114'),
						   ('E11403',N'Trần Mai',N'Linh','04/06/1990',N'Nữ','E114'),
						   ('W12301',N'Nguyễn Ngọc',N'Tuyết','12/05/1996',N'Nữ','W123')
go

insert into HocPhi values ('0001','E11401','02/01/2008',120000,'HP Excel 3-5-7',N'Vân'),
						  ('0002','E11402','02/01/2008',120000,'HP Excel 3-5-7',N'Vân'),
						  ('0003','E11403','02/01/2008',80000,'HP Excel 3-5-7',N'Vân'),
						  ('0004','W12301','18/02/2008',100000,'HP Word 2-4-6',N'Lan'),
						  ('0005','A07501','16/12/2008',150000,'HP Access 2-4-6',N'Lan'),
						  ('0006','A07502','16/12/2008',100000,'HP Access 2-4-6',N'Lan'),
						  ('0007','A07503','18/12/2008',150000,'HP Access 2-4-6',N'Vân'),
						  ('0008','A07502','15/01/2009',50000,'HP Access 2-4-6',N'Vân')

select *from CaHoc
select *from GiaoVien
select *from Lop
select *from HocVien
select *from HocPhi