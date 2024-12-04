create database Lab05_QL_TDL
go
use Lab05_QL_TDL
go

create table Tour(
MaTour nchar(5) primary key, TongSoNgay tinyint
)
go

create table ThanhPho(
MaTP nchar(3) primary key, TenTP nvarchar(30)
)
go
create table Tour_TP(
MaTour nchar(5) references Tour(MaTour), MaTP nchar(3) references ThanhPho(MaTP), SoNgay tinyint
)
go

create table Lich_TourDL(
MaTour nchar(5) references Tour(MaTour), NgayKH date, TenHDV nvarchar(10),SoNguoi tinyint,TenKH nvarchar(20)
)
go
set dateformat dmy

insert into Tour values ('T001',3),
						('T002',4),
						('T003',5),
						('T004',7)
--delete from Tour
go
insert into ThanhPho values ('01',N'Đà Lạt'),
							('02',N'Nha Trang'),
							('03',N'Phan Thiết'),
							('04',N'Huế'),
							('05',N'Đà Nẵng')
--delete from ThanhPho
go
insert into Tour_TP values ('T001','01',2),
						   ('T001','03',1),
						   ('T002','01',2),
						   ('T002','02',2),
						   ('T003','02',2),
						   ('T003','01',1),
						   ('T003','04',2),
						   ('T004','02',2),
						   ('T004','05',2),
						   ('T004','04',3)
--delete from Tour_TP
GO
insert into Lich_TourDL values  ('T001','14/02/2017',N'Vân',20,N'Nguyễn Hoàng'),
								('T002','14/02/2017',N'Nam',30,N'Lê Ngọc'),
								('T002','06/03/2017',N'Hùng',20,N'Lý Dũng'),
								('T003','18/02/2017',N'Dũng',20,N'Lý Dũng'),
								('T004','18/02/2017',N'Hùng',30,N'Dũng Nam'),
								('T003','10/03/2017',N'Nam',45,N'Nguyễn An'),
								('T002','28/04/2017',N'Vân',25,N'Ngọc Dung'),
								('T004','29/04/2017',N'Dũng',25,N'Lê Ngọc'),
								('T001','30/04/2017',N'Nam',25,N'Trần Nam'),
								('T003','15/06/2017',N'Vân',20,N'Trịnh Bá')
--delete from Lich_TourDL
go
select *from Tour
select *from ThanhPho
select *from Tour_TP
select *from Lich_TourDL

--Tour có tổng số ngày từ 3-5

--Thông tin các Tour được tổ chức trong tháng 2/2017

--Tour không đi các thành phố Nha Trang

--Số lượng thành phố mà mỗi Tour du lịch đi qua

--Số lượng Tour du lịch mà mỗi hướng dẫn viên hướng dẫn

--Thành phố có nhiều Tour du lịch đi qua nhất

--cho biết thông tin của tour du lich đi qua tất cả các Thành Phố

--Lập danh sách các tour đi qua Tp.Đà Lạt, thông tin cần hiển thị bao gồm: Mã tour, Songay

--cho biết thông tin của tour du lịch có tổng số lượng khách tham gia nhiều nhất

--cho biết tên Tp mà tất cả các tour du lịch đều đi qua
