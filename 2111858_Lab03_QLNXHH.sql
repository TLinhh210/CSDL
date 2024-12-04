create database Lab03_QLNX
go
use Lab03_QLNX
go

create table HangHoa(
MAHH nchar(10) primary key,TENHH nchar(50),DVT nvarchar(5),SOLUONGTON tinyint
)
go
create table DoiTac(
MADT nchar(10) primary key, TENDT nvarchar(50),DIACHI nvarchar(50),DIENTHOAI char(12)
)
go
create table HoaDon(
SOHD nchar(10) primary key, NGAYLAPHD datetime,MADT nchar(10) references DoiTac(MADT),TONGTG int null
)
go
create table KhaNangCC(
MADT nchar(10) references DoiTac(MADT),MAHH nchar(10) references HangHoa(MAHH)
)
go
create table CT_HoaDon(
SOHD nchar(10) references HoaDon(SOHD), MAHH nchar(10) references HangHoa(MAHH), DONGIA tinyint,SOLUONG tinyint
)
go

insert into HangHoa values	('CPU01','CPU INTEL, CELERON 600 BOX','CÁI',5),
							('CPU02','CPU INTEL,PIII 700','CÁI',10),
							('CPU03','CPU AMD K7 ATHL,ON 600','CÁI',8),
							('HDD01','HDD 10.2 GB QUANTUM','CÁI',10),
							('HDD02','HDD 13.6 GB SEAGATE','CÁI',15),
							('HDD03','HDD 20 GB QUANTUM','CÁI',6),
							('KB01','KB GENIUS','CÁI',12),
							('KB02','KB MITSUMIMI','CÁI',5),
							('MB01','KBGIGABYTECHIPSET INTEL','CÁI',10),
							('MB02','ACORP BX CHIPSET VIA','CÁI',10),
							('MB03','INTEL PHI CHIPSET INTEL','CÁI',10),
							('MB04','ECS CHIPSET SIS','CÁI',10),
							('MB05','ECS CHIPSET VIA','CÁI',10),
							('MNT01','SAMSUNG 14" SYNCMASTER','CÁI',5),
							('MNT02','LG 14"','CÁI',5),
							('MNT03','ACER 14"','CÁI',8),
							('MNT04','PHILIPS 14"','CÁI',6),
							('MNT05','VIEWSONIC 14"','CÁI',7)
	
SELECT *FROM HangHoa
--DELETE FROM HangHoa

SET DATEFORMAT DMY

INSERT INTO DoiTac VALUES	('CC001',N'Cty TNC','176 BTX Q1 - TPHCM','08.8250259'),
							('CC002',N'Cty Hoàng Long','15A TTT Q1 - TP.HCM','08.8250898'),
							('CC003',N'Cty Hợp Nhất','152 BTX Q1 - TP.HCM','08.8252376'),
							('K0001',N'Nguyễn Minh Hải',N'91 Nguyễn Văn Trỗi Tp. Đà Lạt','063.831129'),
							('K0002',N'Như Quỳnh',N'21 Điện Biên Phủ. N.Trang','058590270'),
							('K0003',N'Trần nhật Duật',N'Lê Lợi TP.Huế','054.848376'),
							('K0004',N'Phan Nguyễn Hùng Anh',N'11 Nam Kỳ Khởi nghĩa - TP. Đà Lạt','063.823409')
SELECT *FROM DoiTac
--DELETE FROM DoiTac

INSERT INTO HoaDon VALUES ('N0001','25/01/2006','CC001',' '),
						  ('N0002','01/05/2006','CC002',' '),
						  ('X0001','12/05/2006','K0001',' '),
						  ('X0002','16/06/2006','K0002',' '),
						  ('X0003','20/04/2006','K0001',' ')
SELECT *FROM HoaDon
--DELETE FROM HoaDon

insert into KhaNangCC values ('CC001','CPU01'),
							 ('CC001','HDD03'),
							 ('CC001','KB01'),
							 ('CC001','MB02'),
							 ('CC001','MB04'),
							 ('CC001','MNT01'),
							 ('CC002','CPU01'),
							 ('CC002','CPU02'),
							 ('CC002','CPU03'),
							 ('CC002','KB02'),
							 ('CC002','MB01'),
							 ('CC002','MB05'),
							 ('CC002','MNT03'),
							 ('CC003','HDD01'),
							 ('CC003','HDD02'),
							 ('CC003','HDD03'),
							 ('CC003','MB03')
select *from KhaNangCC
--DELETE FROM KhaNangCC

insert into	CT_HoaDon values ('N0001','CPU01',63,10),
							 ('N0001','HDD03',97,7),
							 ('N0001','KB01',3,5),
							 ('N0001','MB02',57,5),
							 ('N0001','MNT01',112,3),
							 ('N0002','CPU02',115,3),
							 ('N0002','KB02',5,7),
							 ('N0002','MNT03',111,5),
							 ('X0001','CPU01',67,2),
							 ('X0001','HDD03',100,2),
							 ('X0001','KB01',5,2),
							 ('X0001','MB02',62,1),
							 ('X0002','CPU01',67,1),
							 ('X0002','KB02',7,3),
							 ('X0002','MNT01',115,2),
							 ('X0003','CPU01',67,1),
							 ('X0003','MNT03',115,2)
select *from CT_HoaDon
--delete from CT_HoaDon

SELECT *FROM HangHoa
SELECT *FROM DoiTac
SELECT *FROM HoaDon
select *from KhaNangCC
select *from CT_HoaDon



-- Liệt kê các mặt hàng thuộc loại đĩa cứng
select MAHH , TENHH, DVT, SOLUONGTON
from HangHoa
where MAHH like 'HDD%'
go


--liệt kê các mặt hàng có số lượng tồn trên 10
select MAHH, TENHH, DVT, SOLUONGTON
from HangHoa
where SOLUONGTON > 10
go

-- Cho biết thông tin về các nhà cung cấp ở Thanh phố HCM
select MADT, TENDT, DIACHI, DIENTHOAI
from DoiTac
where DIACHI like '%HCM'
go

--Liệt kê các hoá đơn nhập hàng trong tháng 5/2006, thông tin hiển thị gồm: sohd; ngaylaphd;ten,diachi,và điện thoại  của nhà cung ứng; số mặt hàng
select A.SOHD, A.NGAYLAPHD, B.TENDT, B.DIACHI, B.DIENTHOAI, C.SOLUONG
from HoaDon A, DoiTac B, CT_HoaDon C
where A.SOHD = C.SOHD and a.MADT = b.MADT and month(NGAYLAPHD) = '5' and year(NGAYLAPHD) = '2006' and A.SOHD like 'N%'
go

-- Cho biết tên các nhà cung cấp có cung cấp đĩa cứng
SELECT A.MADT, A.TENDT, B.MAHH
FROM DoiTac A, KhaNangCC B
WHERE A.MADT = B.MADT AND B.MAHH LIKE 'HDD%'
GO

-- Tên nhà cc có thể cung cấp tất cả các loại đĩa cứng
SELECT A.MADT, A.TENDT, B.MAHH, COUNT(MAHH) AS SLHH
FROM DoiTac A, KhaNangCC B
WHERE A.MADT = B.MADT
GROUP BY A.MADT, TENDT, MAHH
HAVING COUNT (MAHH) = (SELECT COUNT(MAHH)
					   FROM HangHoa
					   WHERE MAHH LIKE 'HDD%')
GO

-- Tên nhà cc có thể cung cấp tất cả các loại đĩa cứng
SELECT MADT, COUNT(MAHH) AS SLHH
FROM KhaNangCC B
WHERE MAHH LIKE 'HDD%'
GROUP BY MADT
HAVING COUNT (MAHH) = (SELECT COUNT(MAHH)
					   FROM HangHoa
					   WHERE MAHH LIKE 'HDD%')
GO

-- cho biết tên nhà cung cấp không cung cấp đĩa cứng
SELECT A.MADT, A.TENDT, B.MAHH
FROM DoiTac A, KhaNangCC B
WHERE A.MADT = B.MADT AND B.MAHH NOT LIKE 'HDD%'
GO

-- cho biết thông tin của mặt hàng chưa bán được
select MaHH, TenHH
from HangHoa
where MaHH not in(select a.MaHH
					from CT_HoaDon a, HangHoa b
					where a.MaHH=b.MaHH
					group by a.MaHH)
go

-- cho biết tên và tổng số lượng bán của mặt hàng bán chạy nhất (tính theo sô lượng)
select b.MaHH, b.TenHH, SUM(a.SOLUONG) as SoLuong
from CT_HoaDon a, HangHoa b
where a.MaHH=b.MaHH
group by b.MaHH, b.TenHH
having SUM(a.SOLUONG)>=all(select SUM(SOLUONG)
						from CT_HoaDon c
						group by c.MaHH)
go

-- cho biết tên và tổng số lượng của mặt hàng nhập về ít nhất

-- cho biết hóa đơn nhập nhiều mặt hàng nhất

-- cho biết mặt hàng không được nhập hàng trong tháng 1/2006

-- cho biết tên các mặt hàng không bán được trong tháng 6/2006

-- cho biết của hàng bán bao nhiêu mặt hàng

-- cho biết số mặt hàng mà từng nhà cung cấp có khả năng cung cấp


-- cho biết thông tin của khách hàng có giao dịch với cửa hàng nhiều nhất

-- tính tổng doanh thu 2006

-- cho biết loại mặt hàng bán chạy nhất

-- liệt kê thông tin bán hàng của tháng 5/2006 bao gồm: mahh, tenhh,dvt, tổng số lượng, tổng thành tiền

-- liệt kê mặt hàng có nhiều người mua nhất

-- tính và cập nhật tổng giá trị của các hóa đơn

