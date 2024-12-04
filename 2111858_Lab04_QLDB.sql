create database Lab04_QLDB
go
use Lab04_QLDB
go

create table Bao_TChi(
MaBaoTC nchar(5) primary key, Ten nvarchar(30), DinhKy nvarchar(20),SoLuong int, GiaBan int
)
go
create table PhatHanh(
MaBaoTC nchar(5) references Bao_TChi(MaBaoTC), SoBaoTC int, NgayPH datetime
)
go
create table KhachHang(
MaKH nchar(5) primary key, TenKH nvarchar(10),DiaChi nvarchar(30)
)
go
create table DatBao(
MaKH nchar(5) references KhachHang(MaKH), MaBaoTC nchar(5) references Bao_TChi(MaBaoTC), SLMua int, NgayDM datetime
)
set dateformat dym


insert into Bao_TChi values ('TT01',N'Tuổi trẻ',N'Nhật báo',1000,1500),
							('KT01',N'Kiến thức ngày nay',N'Báo nguyệt san',3000,6000),
							('TN01',N'Thanh niên',N'Nhật báo',1000,2000),
							('PN01',N'Phụ nữ',N'Tuần báo',2000,4000),
							('PN02',N'Phụ nữ',N'Nhật báo',1000,2000)
go

insert into PhatHanh values ('TT01',123,'15/12/2005'),
							('KT01',70,'15/12/2005'),
							('TT01',124,'16/12/2005'),
							('TN01',256,'17/12/2005'),
							('PN01',45,'23/12/2005'),
							('PN02',111,'18/12/2005'),
							('PN02',112,'19/12/2005'),
							('TT01',125,'17/12/2005'),
							('PN01',46,'30/12/2005')
go
insert into KhachHang values ('KH01','LAN','2 NCT'),
							 ('KH02','NAM','32 THĐ'),
							 ('KH03','NGỌC','16 LHP')
insert into DatBao values ('KH01','TT01',100,'12/1/2000'),
						  ('KH02','TN01',150,'01/05/2001'),
						  ('KH01','PN01',200,'25/06/2001'),
						  ('KH03','KT01',50,'17/03/2003'),
						  ('KH03','PN02',200,'26/08/2003'),
						  ('KH02','TT01',250,'15/01/2004'),
						  ('KH01','KT01',300,'14/10/2004')

select *from Bao_TChi
select *from PhatHanh
select *from KhachHang
select *from DatBao

--1) Cho biết các tờ báo, tạp chí (MABAOTC, TEN, GIABAN) có định kỳ phát hành hàng tuần (Tuần báo)
select distinct a.MaBaoTC,a.Ten,a.DinhKy,a.GiaBan 
from Bao_TChi a 
where a.MaBaoTC = 'PN01'

-- câu 2
select distinct a.MaBaoTC,a.Ten,a.DinhKy,a.SoLuong,a.GiaBan 
from Bao_TChi a 
where a.MaBaoTC like'PN%'

-- câu 3
select distinct a.MaKH,b.TenKH,a.MaBaoTC 
from DatBao a, KhachHang b 
where a.MaKH=b.MaKH and a.MaBaoTC like 'PN%'

-- câu 4*
select distinct a.MaKH,b.TenKH 
from DatBao a, KhachHang b 
where a.MaKH=b.MaKH and a.MaBaoTC = 'PN01' and a.MaBaoTC='PN02'

-- câu 5
select distinct a.MaKH,b.TenKH 
from DatBao a, KhachHang b 
where  a.MaKH=b.MaKH and a.MaKH not in 
										(select c.MaKH from DatBao c 
										 where c.MaBaoTC ='TN01' 
                                         group by c.MaKH,c.MaBaoTC) 
group by a.MaKH,b.TenKH,a.MaBaoTC

-- câu 6
select distinct sum(a.SLMua) as TongSoLuong 
from DatBao a

-- câu 7
select distinct count(a.MaKH) as soluong
from DatBao a where YEAR(a.NgayDM)='2004'

-- câu 8
select  distinct a.TenKH,b.Ten,b.DinhKy,c.SLMua, sum(c.SLMua*b.GiaBan) as SoTien  
from KhachHang a, Bao_TChi b, DatBao c 
where a.MaKH=c.MaKH and b.MaBaoTC=c.MaBaoTC 
group by a.TenKH,b.Ten,b.DinhKy,c.SLMua

-- câu 9
select distinct a.Ten,a.DinhKy,sum(b.SLMua) 
from Bao_TChi a,DatBao b 
where a.MaBaoTC=b.MaBaoTC 
group by a.MaBaoTC,a.Ten,a.DinhKy

-- câu 10
select distinct a.Ten,a.MaBaoTC
from Bao_TChi a 
where a.MaBaoTC like 'HS%'

-- câu 11*
select distinct b.Ten, a.MaBaoTC,a.NgayDM,a.SLMua 
from DatBao a ,Bao_TChi b 
where a.MaBaoTC=b.MaBaoTC and a.MaBaoTC not in
											  (select c.MaBaoTC from DatBao c) 
-- câu 12
select distinct a.Ten,a.DinhKy, max(b.SLMua) as SLMua 
from Bao_TChi a, DatBao b 
where a.MaBaoTC=b.MaBaoTC and b.SLMua in(select max(c.SLMua) 
										from DatBao c) 
group by a.Ten,a.DinhKy

-- câu 13
select distinct a.TenKH, SUM(b.SLMua) as SLMua 
from KhachHang a, DatBao b 
where a.MaKH=b.MaKH and b.SLMua in (select MAX(c.SLMua) from DatBao c group by c.MaKH, c.MaBaoTC) 
group by a.TenKH

-- câu 14*
select distinct b.Ten,count(a.MaBaoTC) as SoLan 
from PhatHanh a,Bao_TChi b 
where a.MaBaoTC=b.MaBaoTC 
group by b.Ten, a.MaBaoTC,a.SoBaoTC,a.NgayPH 
having count(a.MaBaoTC)=2

-- câu 15*
select distinct a.Ten, COUNT(b.MaKH)as SoKHMua 
from Bao_TChi a, DatBao b 
where a.MaBaoTC=b.MaBaoTC
group by a.Ten,b.MaKH 
having count (b.MaKH)>=3


