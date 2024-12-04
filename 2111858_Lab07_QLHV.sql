create database Lab07_QLSV
go
use Lab07_QLSV
go

create table Khoa(
MSKhoa nchar(5) primary key, TenLop nvarchar(50),Tentat nchar(5)
)
create table Lop(
MSLop nchar(5) primary key, TenLop nvarchar(50),MSKhoa nchar(5) references Khoa(MSKhoa),NienKhoa int
)
create table Tinh(
MSTinh nchar(5) primary key, TenTinh nvarchar(20)
)
create table MonHoc(
MSMH nchar(5) primary key, TenMH nvarchar(50),HeSo int
)
create table SinhVien(
MSSV nchar(8) primary key, Ho nvarchar(30), Ten nvarchar(20),NgaySinh date, MSTinh nchar(5) references Tinh(MSTinh),NgayNhap date,MSLop nchar(5) references Lop(MSLop),Phai nchar(5),DiaChi nvarchar(50),DienThoai nchar(12)
)
create table BangDiem(
MSSV nchar(8) references SinhVien(MSSV),MSMH nchar(5) references MonHoc(MSMH),LanThi int primary key, Diem float 
)
set dateformat dmy
insert into Khoa values ('01',N'Công Nghệ Thông Tin','CNTT',
						 '02',N'Điện Tử Viễn Thông','DTVT',
						 '03',N'Quản Trị Kinh Doanh','QTKD',
						 '04',N'Công Nghệ Sinh Học','CNSH'
						)
go
insert into Lop values ('98TH',N'Tin Hoc Khoa 1998','01',1998,
						'98VT',N'Vien Thong Khoa 1998','02',1998,
						'99TH',N'Tin Hoc Khoa 1999','01',1999,
						'99VT',N'Vien Thong Khoa 1999','02',1999,
						'99QT',N'Quan Tri Khoa 1999','03',1999
						)
go
insert into Tinh values ('01',N'An Giang',
						 '02',N'TPHCM',
						 '03',N'Đồng Nai',
						 '04',N'Long An',
						 '05',N'Huế',
						 '06',N'Cà Mau'
)
go
insert into MonHoc values ('TA01',N'Nhập Môn Tin Học',2,
						   'TA02',N'Lập Trình Cơ Bản',3,
						   'TB01',N'Cấu Trúc Dữ Liệu',2,
						   'TB02',N'Cơ Sở Dữ Liệu',2,
						   'QA01',N'Kinh Tế Vĩ Mô',2,
						   'QA02',N'Quản Trị Chất Lượng',3,
						   'VA01',N'Điện Tử Cơ Bản',2,
						   'VA02',N'Mạch Số',3,
						   'VB01',N'Truyền Số Liệu',3,
						   'XA01',N'Vật Lý Đại Cương',2
)
insert into SinhVien values ('98TH001',N'Nguyễn Văn',N'An','06/08/80','01','03/09/98','98TH','Yes',N'12 Trần Hưng Đạo, Q.1','8234512',
							 '98TH002',N'Lê Thị',N'An','17/10/79','01','03/09/98','98TH','No',N'32 CMT8, Q. Tân Bình','0303234342',
							 '98VT001',N'Nguyễn Đức',N'Bình','21/11/81','02','03/09/98','98VT','Yes',N'245 Lạc Long Quân, Q.11','8654323',
							 '98VT002',N'Trần Ngọc',N'Anh','19/08/80','02','03/09/98','98VT','No',N'242 Trần Hưng Đạo, Q.1','',
							 '99TH001',N'Lý Văn Hùng',N'Dũng','27/09/81','03','05/10/99','99TH','Yes',N'178 CMT8, Q. Tân Bình',' 7563213',
							 '99TH002',N'Văn Minh',N'Hoàng','01/01/81','04','05/10/99','99TH','Yes',N'272 Lý Thường Kiệt, Q.10','8341234',
							 '99TH003',N'Nguyễn',N'Tuấn','12/01/80','','03','05/10/99','99TH','Yes',N'162 Trần Hưng Đạo, Q.5','',
							 '99TH004',N'Trần Văn',N'Minh','25/06/81','04','05/10/99','99TH','Yes',N'147 Điện Biên Phủ, Q.3','7236754',
							 '99TH005',N'Nguyễn Thái',N'Minh','01/01/80','04','05/10/99','99TH','Yes',N'345 Lê Đại Hành, Q.11','',
							 '99VT001',N'Lê Ngọc',N'Mai','21/06/82','01','05/10/99','99VT','No',N'129 Trần Hưng Đạo, Q.1','0903124534',
							 '99QT001',N'Nguyễn Thị',N'Oanh','19/08/73','04','05/10/99','99QT','No',N'76 Hùng Vương, Q.5','0901656324',
							 '99QT002',N'Le Thị',N'Hạnh','20/05/76','04','05/10/99','99QT','No',N'12 Phạm Ngọc Thạch, Q.3','',
)