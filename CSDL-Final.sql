create database QLNHANSU1
use QLNHANSU1
set dateformat DMY;


create table PhongBan (
     MaPhongBan NVARCHAR (10) not null primary KEY,
     TenPhongBan nvarchar (50)
);


CREATE table LinhVucTrongCongTy(
    MaLinhVuc bigint  not null PRIMARY KEY,
    TenLinhvuc NVARCHAR(50),
    SoNgheSiHoatDong INT,
);


CREATE table NgheSi
(
    Ho NVARCHAR(10),
    Ten NVARCHAR (20),
    MaDinhDanh bigint not null PRIMARY KEY,
    NgheDanh NVARCHAR(50),
    GioiTinh NVARCHAR(3),
    NgaySinh DATETIME default(getdate()),
    MaLinhVuc bigint FOREIGN KEY REFERENCES LinhVucTrongCongTy(MaLinhVuc),
    NamDebut int,
    MaNgQuanLy bigint
);

CREATE TABLE Show (
    MaDinhDanh bigint  not null REFERENCES NgheSi(MaDinhDanh),
    NgheDanh NVARCHAR(50),
    TenShow NVARCHAR (50),
    DiaDiemToChuc NVARCHAR (60),
    ThoiGian datetime,
    CONSTRAINT PK_show PRIMARY KEY (MaDinhDanh, TenShow)
)

CREATE TABLE Stylish(
	TenStylish NVARCHAR(50),
	NgheSi nvarchar (50),
	MaDinhDanh bigint not null foreign key references NgheSi(MaDinhDanh)
	constraint PK_Stylish primary key (MaDinhDanh, TenStylish)
)
create table HopDong(
	MaSoHopDong nvarchar (20) not null primary key,
	MaDinhDanh bigint foreign key references NgheSi(MaDinhDanh),
	TenNgheSi nvarchar (50)
	
);

create table LoaiHopDong(
	 MaLoaiHopDong nvarchar (10) not null primary key,
     TenLoaiHopDong nvarchar (50),
     ThoiHan int,
    MaSoHopDong NVARCHAR (20) FOREIGN KEY REFERENCES HopDong(MaSoHopDong)
 );

CREATE table DuAn (
    MaDuAn NVARCHAR(10) not null PRIMARY key ,
    TenDuAn NVARCHAR (50),
    LinhVuc NVARCHAR(50),
    NgheDanh NVARCHAR (50),
    MaDinhDanh bigint foreign KEY REFERENCES NgheSi(MaDinhDanh),
 );

create table NhaTaiTro (
    NhaTaiTro NVARCHAR (50),
    SoTien bigint,
    TenDuAn  nvarchar (50),
    MaDuAn nvarchar (10) FOREIGN key REFERENCES DuAn(MaDuAn)
    
 );
 CREATE table QuyetDinhTuyenDung (
     MaPhongBan NVARCHAR(10),
     MaDinhDanh bigint REFERENCES NgheSi(MaDinhDanh),
     QuetDinhTuyenDungSo NVARCHAR(10) not null PRIMARY KEY,
     NgayNhanQuyetDinh DATETIME,
     ThoiGianThuViec int
 );

create TABLE KhenThuong(
    MaDinhDanh bigint FOREIGN key REFERENCES NgheSi(MaDinhDanh),
    PhongBanKhenThuong NVARCHAR(10) FOREIGN key REFERENCES PhongBan(MaPhongBan),
    QuyetDinhKhenThuongSo NVARCHAR(10) not null primary KEY,
    SoTienKhenThuong bigint,
    LyDoKhenThuong NVARCHAR (200)
 );

 create table NhanThan(
     MaDinhDanh bigint FOREIGN key REFERENCES NgheSi(MaDinhDanh),
     Ho NVARCHAR(10),
     Ten NVARCHAR (20),
     GioiTinh nvarchar(6),
     NgaySinh datetime default(getdate()),
     MoiQuanHe NVARCHAR (20)
     CONSTRAINT PK_NhanThan PRIMARY KEY (MaDinhDanh,Ten) 
 )
 ALTER table QuyetDinhTuyenDung
 add CONSTRAINT FK_QuyetDinhTuyenDung foreign KEY (MaPhongBan)  REFERENCES  PhongBan(MaPhongBan)

ALTER TABLE LinhVucTrongCongTy
add MaPhongBanQuanLy NVARCHAR (10);

alter table LinhVucTrongCongTy
add CONSTRAINT FK_LinhVucTrongCongTy FOREIGN KEY (MaPhongBanQuanLy) REFERENCES PhongBan(MaPhongBan)

ALTER TABLE NgheSi 
add CONSTRAINT FK_NgheSi FOREIGN KEY (MaNgQuanLy)  REFERENCES NgheSi(MaDinhDanh)


INSERT into PhongBan VALUES ('PB-01', N'Phòng Chuyên Môn')
INSERT into PhongBan VALUES ('PB-02', N'Phòng Điện Ảnh')
INSERT into PhongBan VALUES ('PB-03', N'Phòng Sản Xuất  m Nhạc')
INSERT into PhongBan VALUES ('PB-04', N'Phòng Thi Đua')
INSERT into PhongBan VALUES ('PB-05', N'Phòng Khen Thưởng')



insert into LinhVucTrongCongTy values (90000,N' m nhạc',4,'PB-01')
insert into LinhVucTrongCongTy values (23000,N'Diễn xuất',3,'PB-02')
insert into LinhVucTrongCongTy values (57627,N'Sản xuất âm nhạc',3,'PB-03')



INSERT into NgheSi VALUES (N'Nguyễn', N'Thanh Tùng', 31211027633, N'Sơn Tùng MTP', N'Nam','05/07/1994', 90000, 2012, null )
INSERT into NgheSi VALUES (N'Nguyễn', N'Việt Hoàng', 31211027362, N'Mono', N'Nam','21/01/2000', 90000, 2022, 31211027633 )
INSERT into NgheSi VALUES (N'Lê Quang', N'Hải Tú', 31211027234, N'Hải Tú', N'Nữ','12/11/1997', 23000, 2020, null )
INSERT into NgheSi VALUES (N'Phạm Bá', N'Quang', 31211027253, N'Ben Phạm', N'Nam','15/08/1998', 57627, 2020, null )
INSERT into NgheSi VALUES (N'Trần', N'Anh Khoa', 31211027112, N'Kay Trần', N'Nam','05/07/1994', 90000, 2015, 31211027633 )
INSERT into NgheSi VALUES (N'Lê', N'Minh Triều', 31211027681, N'mtrjeu', N'Nam','30/09/2002', 57627, 2022, 31211027253 )
INSERT into NgheSi VALUES (N'Lý', N'Gia Thuận', 31211026754, N'wander kali', N'Nam','01/11/2003', 23000, 2022, 31211027234 )
INSERT into NgheSi VALUES (N'Nguyễn', N'Hoàng Anh', 31211027222, N'Onionn', N'Nam','18/09/1993', 57627, 2012, 31211027253 )
INSERT into NgheSi VALUES (N'Trần', N'My Anh', 31211027962, N'marzuz', N'Nữ','05/11/2000', 90000, 2018, 31211027633 )
INSERT into NgheSi VALUES (N'Thiều', N'Bảo Trâm', 31211027511, N'Thiều Bảo Trâm', N'Nữ','21/06/1994', 23000, 2013,31211027234 )



INSERT into Show VALUEs (31211027633, N'Sơn Tùng MTP', N'Sky Tour', N'Nhà Thi Đấu Quân Khu 7','04/08/2022')
INSERT into Show VALUEs (31211027362, N'Mono', N'Sky Tour', N'Nhà Thi Đấu Quân Khu 7','04/08/2022')
INSERT into Show VALUEs (31211027234, N'Hải Tú', N'Talk Show SaoTeen', N'Công ty Giải Trí và Truyền Thông YanNews','12/08/2022')
INSERT into Show VALUEs (31211027253, N'Ben Phạm', N'Sky Tour', N'Nhà Thi Đấu Quân Khu 7','04/08/2022')
INSERT into Show VALUEs (31211027112, N'Kay Trần', N'Sky Tour', N'Nhà Thi Đấu Quân Khu 7','04/08/2022')
INSERT into Show VALUEs (31211027681, N'mtrjeu', N'Hòa  m Ánh Sáng', N'Trường quay s12 Đài truyền hình VTV','30/08/2022')
INSERT into Show VALUEs (31211027962, N'marzuz', N'Lights 2022', N'Phố đi bộ Nguyễn Huệ','21/08/2022')
INSERT into Show VALUEs (31211027511, N'Thiều Bảo Trâm','Null', Null, null)
INSERT into Show VALUEs (31211026754, N'wander kali', N'Ra mắt phim "Nhắm mắt thấy mùa hè"', N'CGV Gò Vấp','15/08/2022')
INSERT into Show VALUEs (31211027222, N'Onionn', N'Sky Tour', N'Nhà Thi Đấu Quân Khu 7','04/08/2022')



insert into Stylish VALUEs (N'Hoàng Ku',N'Sơn Tùng MTP',31211027633)
insert into Stylish VALUEs (N'Hoàng Ku',N'Mono',31211027362)
insert into Stylish VALUEs (N'Kye Nguyễn',N'Hải Tú',31211027234)
insert into Stylish VALUEs (N'Kye Nguyễn',N'Ben Phạm',31211027253)
insert into Stylish VALUEs (N'Kye Nguyễn',N'Kay Trần',31211027112)
insert into Stylish VALUEs (N'Kelbin Lei',N'mtrjeu',31211027681)
insert into Stylish VALUEs (N'Kelbin Lei',N'wander kila',31211026754)
insert into Stylish VALUEs (N'Kelbin Lei',N'marzuz',31211027962)
insert into Stylish VALUEs (N'Kelbin Lei',N'Onionn',31211027222)
insert into Stylish VALUEs (N'Hoàng Ku',N'Thiều Bảo Trâm',31211027511)



insert into HopDong VALUES ('HD-CS01',31211027633,N'Sơn Tùng MTP')
insert into HopDong VALUES ('HD-CS02',31211027362,N'Mono')
insert into HopDong VALUES ('HD-CS03',31211027112,N'Kay Trần')
insert into HopDong VALUES ('HD-CS04',31211027962,N'marzuz')
insert into HopDong VALUES ('HD-CS05',31211027234,N'Hải Tú')
insert into HopDong VALUES ('HD-CS06',31211026754,N'wander kali')
insert into HopDong VALUES ('HD-CS07',31211027511,N'Thiều Bảo Trâm')
insert into HopDong VALUES ('HD-CS08',31211027253,N'Ben Phạm')
insert into HopDong VALUES ('HD-CS09',31211027681,N'mtrjeu')
insert into HopDong VALUES ('HD-CS10',31211027222,N'Onionn')



insert into LoaiHopDong VALUES ('CT1',N'Hợp đồng độc quyền', 4, 'HD-CS01')
insert into LoaiHopDong VALUES ('CT2',N'Hợp đồng độc quyền', 4, 'HD-CS02')
insert into LoaiHopDong VALUES ('CT3',N'Hợp đồng ngắn hạn', 1, 'HD-CS03')
insert into LoaiHopDong VALUES ('CT4',N'Hợp đồng đào tạo', 2, 'HD-CS04')
insert into LoaiHopDong VALUES ('CT5',N'Hợp đồng độc quyền', 4, 'HD-CS05')
insert into LoaiHopDong VALUES ('CT6',N'Hợp đồng ngắn hạn', 1, 'HD-CS06')
insert into LoaiHopDong VALUES ('CT7',N'Hợp đồng dài hạn', 5, 'HD-CS07')
insert into LoaiHopDong VALUES ('CT8',N'Hợp đồng độc quyền', 4, 'HD-CS08')
insert into LoaiHopDong VALUES ('CT9',N'Hợp đồng độc quyền', 4, 'HD-CS09')
insert into LoaiHopDong VALUES ('CT10',N'Hợp đồng đào tạo', 2, 'HD-CS10')



insert into DuAn VALUES ('DA-01', N'MV ca nhạc Chạy Ngay Đi', 90000, N'Sơn Tùng MTP',31211027633 )
insert into DuAn VALUES ('DA-02', N'MV ca nhạc Waiting for you', 90000, 'Mono',31211027362 )
insert into DuAn VALUES ('DA-03', N'Mẫu ảnh Bộ Sưu Tập Thu Đông 2022', 23000, N'Hải Tú',31211027234 )
insert into DuAn VALUES ('DA-04', N'MV ca nhạc Nơi này có anh', 57627, N'Ben Phạm',31211027253 )
insert into DuAn VALUES ('DA-05', N'MV ca nhạc Chuyện tình tôi', 90000, N'Kay Trần',31211027112 )
insert into DuAn VALUES ('DA-06', N'MV ca nhạc Phía Sau Em', 57627, N'mtrjeu',31211027681 )
insert into DuAn VALUES ('DA-07', N'Phim Ngày Trở Về', 23000, N'wander kila',31211026754 )
insert into DuAn VALUES ('DA-08', N'Album 24h', 90000, N'marzuz',31211027962 )
insert into DuAn VALUES ('DA-09', N'MV Đi Cùng Nhau', 57627, N'Onionn',31211027222 )
insert into DuAn VALUES ('DA-10', N'Phim SITCOM Đợi chờ bao lâu?', 23000,N'Thiều Bảo Trâm',31211027511 )



 INSERT into NhaTaiTro VALUEs ('BiTis Hunter', 100000000,N'MV ca nhạc Chạy Ngay Đi','DA-01' )
 INSERT into NhaTaiTro VALUEs ('PEPSICO', 150000000,N'MV ca nhạc Waiting for you','DA-02' )
 INSERT into NhaTaiTro VALUEs ('Null', 0, N'Mẫu ảnh Bộ Sưu Tập Thu Đông 2022','DA-03' )
 INSERT into NhaTaiTro VALUEs ('TiKi', 80000000,N' MV ca nhạc Nơi này có anh','DA-04' )
 INSERT into NhaTaiTro VALUEs ('Null', 0,N'MV ca nhạc Chuyện tình tôi','DA-05' )
 INSERT into NhaTaiTro VALUEs ('Garena', 200000000,N'MV ca nhạc Phía Sau Em','DA-06' )
 INSERT into NhaTaiTro VALUEs ('BamBoo Airway', 40000000,N'Phim Ngày Trở Về','DA-07' )
 INSERT into NhaTaiTro VALUEs ('BamBoo Airway', 100000000,N'Album 24h','DA-08' )
 INSERT into NhaTaiTro VALUEs ('TiKi', 75000000,N'MV Đi Cùng Nhau','DA-09' )
 INSERT into NhaTaiTro VALUEs ('VinhHungJoinStock', 115000000,N'Phim SITCOM Đợi chờ bao lâu?','DA-10' )

 update NhaTaiTro set TenDuAn = N'MV ca nhạc Nơi này có anh' where MaDuAn = 'DA-04'

insert into QuyetDinhTuyenDung VALUES ('PB-01',31211027633, 'QDTD01', '03/12/2012',0 )
insert into QuyetDinhTuyenDung VALUES ('PB-01',31211027362, 'QDTD02', '02/04/2022',1 )
insert into QuyetDinhTuyenDung VALUES ('PB-02',31211027234, 'QDTD03', '03/12/2015',1 )
insert into QuyetDinhTuyenDung VALUES ('PB-03',31211027253, 'QDTD04', '12/05/2017',1 )
insert into QuyetDinhTuyenDung VALUES ('PB-01',31211027112, 'QDTD05', '18/11/2018',0 )
insert into QuyetDinhTuyenDung VALUES ('PB-03',31211027681, 'QDTD06', '04/10/2018',2 )
insert into QuyetDinhTuyenDung VALUES ('PB-02',31211026754, 'QDTD07', '22/05/2020',0 )
insert into QuyetDinhTuyenDung VALUES ('PB-01',31211027962, 'QDTD08', '30/08/2019',1 )
insert into QuyetDinhTuyenDung VALUES ('PB-02',31211027222, 'QDTD09', '19/08/2021',0 )
insert into QuyetDinhTuyenDung VALUES ('PB-02',31211027511, 'QDTD010', '12/07/2020',0 )


 
insert into KhenThuong VALUEs (31211027633,'PB-04', 'QDKT-001', 10000000, '' )
insert into KhenThuong VALUEs (31211027362,'PB-05', 'QDKT-002', 15000000, '' )
insert into KhenThuong VALUEs (31211027234,'PB-04', 'QDKT-003', 9000000, '' )
insert into KhenThuong VALUEs (31211027253,'PB-04', 'QDKT-004', 9000000, '' )
insert into KhenThuong VALUEs (31211027112,'PB-04', 'QDKT-005', 85000000, '' )
insert into KhenThuong VALUEs (31211027681,'PB-05', 'QDKT-006', 10000000, '' )
insert into KhenThuong VALUEs (31211026754,'PB-04', 'QDKT-007', 12000000, '' )
insert into KhenThuong VALUEs (31211027962,'PB-05', 'QDKT-008', 12500000, '' )
insert into KhenThuong VALUEs (31211027222,'PB-05', 'QDKT-009', 11000000, '' )
insert into KhenThuong VALUEs (31211027511,'PB-04', 'QDKT-010', 10500000, '' )



insert into NhanThan values (31211027633, N'Nguyễn', N'Hải Phong', N'Nam', '18/04/1967', N'Bố')
insert into NhanThan values (31211027362, N'Nguyễn', N'Hải Phong', N'Nam', '19/04/1967', N'Bố')
insert into NhanThan values (31211027234, N'Nguyễn', N'Thanh Tùng', N'Nam', '05/07/1994', N'Vợ chồng')
insert into NhanThan values (31211027253, N'Lê', N'Minh Tấn', N'Nam', '12/12/2000', N'Em')
insert into NhanThan values (31211027112, N'Hoàng', N'Thị Linh', N'Nữ', '30/04/1991', N'Chị')
insert into NhanThan values (31211027681, N'Lê', N'Minh Ngọc', N'Nam', '10/10/1992', N'Anh')
insert into NhanThan values (31211026754, N'Lý', N'Gia Huy', N'Nam', '11/08/1996', N'Anh')
insert into NhanThan values (31211027962, N'Hà', N'Hồng Nhung', N'Nữ', '04/02/2001', N'Em')
insert into NhanThan values (31211027222, N'Trần', N'Văn Hải', N'Nam', '03/02/2001', N'Em')
insert into NhanThan values (31211027511, N'Thiều', N'Bảo Trang', N'Nữ', '23/08/1992', N'Chị')

alter table NgheSi
drop column NamDebut

alter table NgheSi
add NamDebut datetime default(getdate())

alter table LinhVucTrongCongTy
drop column SoNgheSiHoatDong

update NgheSi set NamDebut = '07/03/2012' where MaDinhDanh = '31211027633'
update NgheSi set NamDebut = '02/10/2020' where MaDinhDanh = '31211027362'
update NgheSi set NamDebut = '10/11/2019' where MaDinhDanh = '31211027681'
update NgheSi set NamDebut = '03/03/2018' where MaDinhDanh = '31211027253'
update NgheSi set NamDebut = '09/03/2021' where MaDinhDanh = '31211027234'
update NgheSi set NamDebut = '08/09/2017' where MaDinhDanh = '31211027962'
update NgheSi set NamDebut = '04/10/2020' where MaDinhDanh = '31211027222'
update NgheSi set NamDebut = '01/02/2022' where MaDinhDanh = '31211027681'
update NgheSi set NamDebut = '04/12/2019' where MaDinhDanh = '31211027511'
update NgheSi set NamDebut = '06/08/2018' where MaDinhDanh = '31211027112'
update NgheSi set NamDebut = '08/11/2021' where MaDinhDanh = '31211026754'


SELECT * FROM PhongBan
SELECT * FROM NgheSi
SELECT * FROM LinhVucTrongCongTy
SELECT * from HopDong
SELECT * from LoaiHopDong
select * from Show
SELECT * from DuAn
SELECT * from NhaTaiTro
SELECT * from KhenThuong
select * from NhanThan




/* TRUY VẤN */
/*Truy van 1 bang*/

/*Cau1: Cho biet ten tat ca nghe si dang hoat dong trong cong ty*/
select Ho, Ten, NgheDanh
from NgheSi



/*Cau 2:Cho biet ten nghe si va nhung show ho tham gia */
SELECT NgheDanh, TenShow
from Show

/*Cau 3*: Cho biet ten tat ca cac du an ma nghe si se tham gia*/

select TenDuAn
FROM DuAn

/*Truy van nhieu bang*/

/*Cau 1: Cho biet he ten va moi quan he cua nhan than cac nghe si trong cong ty*/

SELECT NT.Ho, NT.Ten, nt.MoiQuanHe, NS.NgheDanh
from NgheSi NS join NhanThan NT on NS.MaDinhDanh = NT.MaDinhDanh

/*Cau 2: cho biet loai hop dong cua nghe si voi cong ty*/

select hd.TenNgheSi, lhd.TenLoaiHopDong
from HopDong hd join LoaiHopDong lhd on  hd.MaSoHopDong = lhd.MaSoHopDong

/*Cau 3: cho biet nghe si nao  nhan quyet dinh tuyen dung so QDTD09*/

select ns.MaDinhDanh, ns.NgheDanh , qd.QuetDinhTuyenDungSo
from QuyetDinhTuyenDung qd JOIN NgheSi ns on qd.MaDinhDanh = ns.MaDinhDanh
WHERE qd.QuetDinhTuyenDungSo = 'QDTD09'

/*Truy vấn có điều kiện*/


/*Câu 1: Cho biết những nghệ sĩ tham gia show sky tour*/
select NgheDanh, DiaDiemToChuc, TenShow
from Show
WHERE TenShow like 'Sky Tour'

/*Câu 2: Cho biết tất cả những nghệ sí thuộc mã lĩnh vực 90000 trong công ty */
select NgheDanh, lv.TenLinhvuc, ns.MaLinhVuc
From LinhVucTrongCongTy lv, NgheSi ns
WHERE lv.MaLinhVuc = ns.MaLinhVuc AND ns.MaLinhVuc = 90000

/*Caau3: Cho biết những nhân thân có độ tuổi từ 20 đến 30*/

SELECT NT.Ho, NT.Ten, nt.MoiQuanHe, NS.NgheDanh,(year(GETDATE()) - (YEAR(nt.NgaySinh))) as tuoi
from NgheSi NS, NhanThan NT
WHERE NS.MaDinhDanh = NT.MaDinhDanh and (year(GETDATE()) - (YEAR(nt.NgaySinh))) BETWEEN 20 and 30

/*Truy vấn tính toán*/

/*Câu 1: Cho biết tổng số tiền chi cho mục khen thưởng*/
select sum(SoTienKhenThuong) as N'Tổng chi khen thưởng'
FROM KhenThuong

/*Câu 2: Tính trung bình số tiền mỗi dự án được nhận tài trợ*/

select AVG(SoTien) as N'Số tiền tài trợ trung bình mỗi dự án nhận được:'
FROM NhaTaiTro

/*Caau3: Tính tổng số tiền phòng thi đua chi khen thưởng*/

select SUM(SoTienKhenThuong) as N'Tổng số tiền phòng thi đua chi khen thường'
from KhenThuong kt, PhongBan pb
WHERE kt.PhongBanKhenThuong = pb.MaPhongBan AND pb.MaPhongBan = 'PB-04'

/*Truy vấn gom nhóm*/
/*Caau1: Cho biết số tiền mỗi phòng ban chi khen thưởng*/

select SUM(SoTienKhenThuong) N'Tổng chi' , PhongBanKhenThuong, TenPhongBan
from KhenThuong kt, PhongBan pb
WHERE kt.PhongBanKhenThuong = pb.MaPhongBan 
GROUP BY PhongBanKhenThuong, TenPhongBan

/*Caau2: Cho biết có bao nhiêu nghệ sĩ kí với công ty loại hợp đồng nào*/
SELECT max(SoTienKhenThuong) from KhenThuong GROUP BY PhongBanKhenThuong
SELECT COUNT(NgheDanh) N'Số lượng nghệ sĩ', TenLoaiHopDong
from HopDong hd, NgheSi ns , LoaiHopDong lhd
where hd.MaDinhDanh = ns.MaDinhDanh and hd.MaSoHopDong =lhd.MaSoHopDong
group by TenLoaiHopDong

/*Caau3: Cho biết số quyết dịnh tuyển dụng của mỗi phòng ban*/
SELECT COUNT(QuetDinhTuyenDungSo) N'Số quyết định tuyển dụng' , qd.MaPhongBan
from QuyetDinhTuyenDung qd, PhongBan pb
WHERE qd.MaPhongBan = pb.MaPhongBan
GROUP BY qd.MaPhongBan

/*Truy vấn gom nhóm có điều kiện*/
/*Câu 1:Cho biết phòng ban nào có số quyết định tuyển dụng >3 */

SELECT COUNT(QuetDinhTuyenDungSo) N'Số quyết định tuyển dụng' , qd.MaPhongBan, pb.TenPhongBan
from QuyetDinhTuyenDung qd, PhongBan pb
WHERE qd.MaPhongBan = pb.MaPhongBan
GROUP BY qd.MaPhongBan, pb.TenPhongBan
HAVING COUNT(QuetDinhTuyenDungSo) >3

/*Caau2:Cho biêt loại hợp đồng ký với ít nhất 3 nghệ sĩ */
SELECT COUNT(NgheDanh) as N'Số lượng nghệ sĩ', TenLoaiHopDong
from HopDong hd, NgheSi ns , LoaiHopDong lhd
where hd.MaDinhDanh = ns.MaDinhDanh and hd.MaSoHopDong =lhd.MaSoHopDong
group by TenLoaiHopDong
HAVING COUNT(NgheDanh) > 3

/*Caau3: Cho biết phòng ban nào có tông số tiền chi khen thường lớn hơn 50000000*/
select SUM(SoTienKhenThuong) N'Tổng chi' , PhongBanKhenThuong, TenPhongBan
from KhenThuong kt, PhongBan pb
WHERE kt.PhongBanKhenThuong = pb.MaPhongBan 
GROUP BY PhongBanKhenThuong, TenPhongBan
HAVING SUM(SoTienKhenThuong) >= 50000000

/*Truy vấn sử dụng phép giao, phép hội, phép trừ*/
/*Câu 1: Liệt kê tất cả hoạt đọng trong lĩnh vực có mã linh vực laf 90000 hoặc 23000*/
select ns.MaDinhDanh, ns.NgheDanh, ns.MaLinhVuc
from NgheSi ns JOIN LinhVucTrongCongTy lv on ns.MaLinhVuc = lv.MaLinhVuc
WHERE lv.MaLinhVuc = 90000
UNION all
select ns.MaDinhDanh, ns.NgheDanh,ns.MaLinhVuc
from NgheSi ns JOIN LinhVucTrongCongTy lv on ns.MaLinhVuc = lv.MaLinhVuc
WHERE lv.MaLinhVuc = 23000


/*Caau2: Kể tên nghệ sĩ hoạt động ở cả lĩnh vực có mã linh vực 90000 và lĩnh vực có mã lĩnh vực 23000*/
select ns.MaDinhDanh, ns.NgheDanh, ns.MaLinhVuc
from NgheSi ns JOIN LinhVucTrongCongTy lv on ns.MaLinhVuc = lv.MaLinhVuc
WHERE lv.MaLinhVuc = 90000
INTERSECT
select ns.MaDinhDanh, ns.NgheDanh,ns.MaLinhVuc
from NgheSi ns JOIN LinhVucTrongCongTy lv on ns.MaLinhVuc = lv.MaLinhVuc
WHERE lv.MaLinhVuc = 23000

/*Caau3: Kể tên nghệ sĩ hoặt đọng trong lĩnh vực có mã lĩnh vực là 90000 những k hoạt động trong lĩnh vực có mã linh vực 23000  */
select ns.MaDinhDanh, ns.NgheDanh, ns.MaLinhVuc
from NgheSi ns JOIN LinhVucTrongCongTy lv on ns.MaLinhVuc = lv.MaLinhVuc
WHERE lv.MaLinhVuc = 90000
EXCEPT
select ns.MaDinhDanh, ns.NgheDanh,ns.MaLinhVuc
from NgheSi ns JOIN LinhVucTrongCongTy lv on ns.MaLinhVuc = lv.MaLinhVuc
WHERE lv.MaLinhVuc = 23000

/*Subquery*/


/*Caau1: kiểm tra xem nghệ sĩ có mã định danh đuôi 633 có phải là nghệ sĩ quản lý hay không?*/

SELECT * 
from NgheSi 
WHERE MaDinhDanh LIKE ('%633') and 
MaDinhDanh in (select MaNgQuanLy from NgheSi )


/*Câu 2: Kể ra tên những dự án của các nghệ sĩ quản lý*/
select TenDuAn, NgheSi.NgheDanh 
FROM NgheSi ,( select * from DuAn) as DA
WHERE NgheSi.MaDinhDanh =Da.MaDinhDanh and MaNgQuanLy IS null



/*Caau3: Chỉ ra nghệ sĩ hoạt động trong lĩnh vực âm nhạc có số năm hoạt đoạng lâu nhất trong công ty*/
SELECT ns.NgheDanh, YEAR(GETDATE()) - YEAR(NamDebut) 'Tuổi nghề'
from    NgheSi ns, LinhVucTrongCongTy lv
WHERE ns.MaLinhVuc = lv.MaLinhVuc 
AND YEAR(GETDATE()) - YEAR(NamDebut) > = (select max(YEAR(GETDATE()) - YEAR(NamDebut))
                                        from NgheSi ns, LinhVucTrongCongTy lv
                                        WHERE lv.TenLinhvuc = N'Âm nhạc'
)

/* TRUY VẤN CHÉO */


	-- Tổng số tiền tài trợ của nhà tài trợ tiki, pesico và garena
select N'Tổng tiền tài trợ', [TiKi], [PEPSICO], [Garena]
from
( 
select NhaTaiTro, SoTien from NhaTaiTro ntt, DuAn da
where (ntt.MaDuAn = da.MaDuAn)
) as BangNguon
pivot
(
sum(SoTien) 
for NhaTaiTro in ([TiKi], [PEPSICO], [Garena])
) as BangChuyen


	-- Số lần tài trợ của nhà tài trợ tiki, pesico và garena
select N'Tổng số lần tài trợ' N'Nhà Tài Trợ', [TiKi], [PEPSICO], [Garena]
from
( 
select NhaTaiTro, SoTien from NhaTaiTro ntt, DuAn da
where (ntt.MaDuAn = da.MaDuAn)
) as BangNguon
pivot
(
count(SoTien) 
for NhaTaiTro in ([TiKi], [PEPSICO], [Garena])
) as BangChuyen


	-- Tổng số lần ra quyết định tuyển dụng của phòng ban 01, 02, 03 từ sau 2017
select  N'Phòng Ban' N'Số lần tuyển dụng', [PB-01], [PB-02], [PB-03]
from
( 
select MaPhongBan from QuyetDinhTuyenDung
where year(NgayNhanQuyetDinh) > 2017
) as BangNguon
pivot
(
count(MaPhongBan) 
for MaPhongBan in ([PB-01], [PB-02], [PB-03])
) as BangChuyen



/* CONSTRAINT */

	-- Viết ràng buộc duy nhất cho các bảng
alter table DuAn
add constraint duynhat_ma_duan unique (MaDuAn);
alter table NhaTaiTro
add constraint duynhat_ntt_maduan unique (MaDuAn);
	
	-- Viết ràng buộc là nam hoặc nữ
alter table NgheSi 
add constraint gioitinh_ns check(gioitinh IN (N'Nam',N'Nữ'));	
alter table NhanThan
add constraint gioitinh_thannhanns check(gioitinh IN (N'Nam',N'Nữ'));

/* FUNCTION */
	--Tạo hàm tìm kiếm nghệ sĩ có tuổi từ a tuổi đến b tuổi
create function dbo.tableTuoiNSbetween(@btuoi int,@etuoi int)	
returns table
as 
return (select MaDinhDanh,NgheDanh,GioiTinh,(year(getDate())-year(ngaysinh)) as tuoi
		from NgheSi
		where (year(getDate())-year(NgaySinh)) between @btuoi and @etuoi)

	--TẠO HÀM TÌM KIẾM SỐ TIỀN TÀI TRỢ CHO LĨNH VỰC
create function dbo.tableTienTaitroTrongLinhvuc(@linhvuc nvarchar(50))
returns table
as 
return (select ntt.NhaTaiTro,ntt.MaDuAn,lv.TenLinhvuc, ntt.SoTien from NhaTaiTro ntt, DuAn da, LinhVucTrongCongTy lv
		where ntt.MaDuAn = da.MaDuAn and @linhvuc = lv.TenLinhvuc and lv.MaLinhVuc = da.LinhVuc )


	--TẠO HÀM CHECK MÃ ĐỊNH DANH CÓ TỒN TẠI KHÔNG
create function check_madd (@madd bigint)
returns VARCHAR(5)
as
begin
    if exists(select * from NgheSi where MaDinhDanh = @madd )
        return 'True'
    return 'False'
end

	-- ỨNG DỤNG FUNCTION
select * from dbo.tableTuoiNSbetween(19,27) -- Tìm kiếm thông tin nghệ sĩ có tuổi từ 20 đền 27
select * from dbo.tableTienTaitroTrongLinhvuc(N'Sản xuất âm nhạc') -- Tìm kiếm nhà tài trợ và số tiền tài trợ trong lĩnh vực sản xuất âm nhạc
select dbo.check_madd(31211027633) as N'Mã Định Danh Tồn Tại' -- Check madinhdanh có tồn tại không


--------------------------------------------------------------
/* PROCEDURE */
	-- THỦ TỤC THÊM DỮ LIỆU LÀ NGHỆ SĨ
create procedure insert_ns (@ho nvarchar(10),@ten nvarchar(30), @madd bigint, @nghedanh nvarchar(30),@gioitinh nvarchar(5), @ngaysinh datetime, @malv bigint, @mangql bigint, @namdebut datetime)
as
begin
	if (dbo.check_madd(@madd) = 'True')
	begin
		print N'Nghệ sĩ ' + convert(nvarchar,@madd,20) + N' đã tồn tại'
	end
	else
	begin try
		insert into NgheSi(Ho, Ten, MaDinhDanh, NgheDanh, GioiTinh, NgaySinh, MaLinhVuc, NamDebut, MaNgQuanLy)
		values (@ho, @ten, @madd, @nghedanh, @gioitinh, @ngaysinh, @malv,  @namdebut, @mangql)
		print N'Thêm nghệ sĩ có mã ' + convert(nvarchar,@madd,20) +N' thành công'
	end try
	begin catch
		print N'Thêm nghệ sĩ ' + convert(nvarchar,@madd,20) + N' không thành công. Vui lòng thử lại.'
	end catch
end


	-- THỦ TỤC XÓA NGHỆ SĨ
create procedure delete_ns (@ho nvarchar(10),@ten nvarchar(30), @madd bigint, @nghedanh nvarchar(30),@gioitinh nvarchar(5), @ngaysinh datetime, @malv bigint, @mangql bigint, @namdebut datetime)
as
begin
	if (dbo.check_madd(@madd) = 'True')
	begin
		delete from NgheSi 
		where @ho = NgheSi.Ho and @ten = NgheSi.Ten and @madd = NgheSi.MaDinhDanh
		and @nghedanh = NgheSi.NgheDanh and @gioitinh = NgheSi.GioiTinh and @ngaysinh = NgheSi.NgaySinh
		and @malv =NgheSi.MaLinhVuc and @mangql = NgheSi.MaNgQuanLy and @namdebut = NgheSi.NamDebut
		print N'Xóa thành công nghệ sĩ ' + convert(nvarchar,@madd,20)
	end
	else if (dbo.check_madd(@madd) = 'False')
	begin
		print N'Nghệ sĩ ' + convert(nvarchar,@madd,20) + N' không tồn tại.'
	end 
end

	--THỦ TỤC CẬP NHẬT NGHỆ SĨ
create procedure update_ns_nghedanh (@ho nvarchar(10),@ten nvarchar(30), @madd bigint, @nghedanh nvarchar(30),@gioitinh nvarchar(5), @ngaysinh datetime, @malv bigint, @mangql bigint, @namdebut datetime)
as
begin
	if(dbo.check_madd(@madd) = 'True')
	begin
		update NgheSi
		set NgheDanh = @nghedanh
		where @ho = NgheSi.Ho and @ten = NgheSi.Ten and @madd = NgheSi.MaDinhDanh and @gioitinh = NgheSi.GioiTinh and @ngaysinh = NgheSi.NgaySinh
		and @malv =NgheSi.MaLinhVuc and @mangql = NgheSi.MaNgQuanLy and @namdebut = NgheSi.NamDebut
		print N'Cập nhật nghệ sĩ '+ convert(nvarchar,@madd,20) +N' thành công'
	end
	else if(dbo.check_madd(@madd) = 'False')
	begin 
		print N'Cập nhật nghệ sĩ '+ convert(nvarchar,@madd,20) +N' không thành công vì nghệ sĩ không tồn tại'
	end 
	else
	begin
		print N'Nghệ sĩ '+ convert(nvarchar,@madd,20) + N' nhập vào đã được cập nhật nghệ danh hoặc thông tin nhập vào không đúng'
	end
end
	
	-- ỨNG DỤNG THỦ TỤC
select * from NgheSi -- Kiểm tra lại database


drop proc insert_ns -- Xóa thủ tục nhập
drop proc delete_ns -- Xóa thủ tục xóa nghệ sĩ
drop proc update_ns_nghedanh -- Xóa thủ tục cập nhật nghệ sĩ


exec insert_ns N'Lê', N'Hoàng Mai ', 31211027666, N'MAIDOKI', N'Nữ','03/09/2002', 57627, 31211027253, '03/02/2022' -- Thêm nghệ sĩ thành công
exec insert_ns N'Lê', N'Hoàng Mai ', 31211027666, N'MAIDOKI', N'Nữ','03/09/2002', 57627, 31211027253, '03/02/2022' -- Thêm không thành công do đã có mã định danh của nghệ sĩ này trong database

exec delete_ns N'Lê', N'Hoàng Mai ', 31211027666, N'MAIDOKI', N'Nữ','03/09/2002', 57627, 31211027253, '03/02/2022' -- Đã xóa thành công nghệ sĩ ( nếu đã có sẵn trong database trước đó )
exec delete_ns N'Lê', N'Hoàng Mỹ ', 33333333333, N'MYKI', N'Nữ','01/01/2000', 57627, null, '03/02/2022' -- Xóa không thành công vì nghệ sĩ không tồn tại

exec update_ns_nghedanh N'Lê', N'Hoàng Mai ', 31211027666, N'MAIDORA', N'Nữ','03/09/2002', 57627, 31211027253, '03/02/2022' -- Cập nhật nghệ sĩ thành công ( nếu đã có trong database ) 
exec update_ns_nghedanh N'Lê', N'Hoàng Mỹ ', 33333333333, N'MYKI', N'Nữ','01/01/2000', 57627, null, '03/02/2022' -- Cập nhật không thành công vì nghệ sĩ không tồn tại trước đó
exec update_ns_nghedanh N'Lê', N'Hoàng Mai ', 31211027666, N'MAIDORA', N'Nữ','03/09/2002', 57627, 31211027253, '03/02/2022' -- Cập nhật không thành công do đã có nghệ danh mới

--------------------------------------------------------------
/* TRIGGER */
	-- TẠO TRIGGER KHÔNG ĐƯỢC NHẬP TIỀN KHEN THƯỞNG LÀ SỐ  M
create trigger trg_insert_kt on KhenThuong
after insert
as
begin 
	if( select SoTienKhenThuong from inserted) < 0
	begin
		print N'Số tiền khen thưởng không thể bé hơn 0'
			rollback tran
	end
	else
	begin
		print N'Đã thêm quyết định khen thưởng'
	end
end 

	-- TẠO TRIGGER KHÔNG THỂ XÓA NHỮNG SHOW Ở QU N KHU 7
create trigger trig_deleteshow_show
on dbo.Show
for delete
as
begin
	declare @count int = 0
	select @count = count(*) from deleted
	where deleted.DiaDiemToChuc like N'_%Quân Khu 7'
	if(@count > 0)
	begin
	print N'Không thể hủy những show diễn ở quân khu 7 !!!'
		rollback tran
	end
end


	-- TRIGGER ĐỔI TÊN DỰ ÁN TRONG BẢN DỰ ÁN SẼ ĐỔI TÊN DỰ ÁN TRONG BẢNG NHÀ TÀI TRỢ
create trigger trig_update_dantt
on dbo.DuAn
for update
as
begin
	update NhaTaiTro set TenDuAn = ( select TenDuAn from inserted ) where TenDuAn = (select TenDuAn from deleted )
end


	--ỨNG DỤNG TRIGGER
insert into KhenThuong VALUEs (31211027511,'PB-04', 'QDKT-011', -3000000, '' ) --số tiền không thể âm

delete from Show where MaDinhDanh = 31211027222 --Không xóa được show ở quân khu 7 do bị end ở trigger

update DuAn set TenDuAn = N'MV Walk Together' where MaDuan = N'DA-09' /* Update tên dự án MV đi cùng nhau thành walk together 
																		 sẽ xuất hiện trong tên dự án của cả hai bảng NhaTaiTro và Duan */
select da.TenDuan from DuAn da, NhaTaiTro ntt where da.MaDuAn = N'DA-09' -- Check


/* PH N QUYỀN */
create login VIENTHANHNHA with password = 'QUATDONEM'
create user PHANQUYEN for login VIENTHANHNHA 
/*TRUY VẤN PH N QUYỀN */
grant select, insert, update, delete on NgheSi to PHANQUYEN
grant select, insert, update, delete on DuAn to PHANQUYEN
grant select, insert, update, delete on KhenThuong to PHANQUYEN
grant select, insert, update, delete on HopDong to PHANQUYEN
grant select, insert, update, delete on LoaiHopDong to PHANQUYEN
grant select, insert, update, delete on LinhVucTrongCongTy to PHANQUYEN
grant select, insert, update, delete on NhanThan to PHANQUYEN
grant select, insert, update, delete on PhongBan to PHANQUYEN
grant select, insert, update, delete on QuyetDinhTuyenDung to PHANQUYEN
grant select, insert, update, delete on Show to PHANQUYEN
grant select, insert, update, delete on Stylish to PHANQUYEN
grant select, insert, update, delete on NhaTaiTro to PHANQUYEN
/* XÓA PH N QUYỀN */
revoke select, insert, update, delete on NgheSi to PHANQUYEN
revoke select, insert, update, delete on DuAn to PHANQUYEN
revoke select, insert, update, delete on KhenThuong to PHANQUYEN
revoke select, insert, update, delete on HopDong to PHANQUYEN
revoke select, insert, update, delete on LoaiHopDong to PHANQUYEN
revoke select, insert, update, delete on LinhVucTrongCongTy to PHANQUYEN
revoke select, insert, update, delete on NhanThan to PHANQUYEN
revoke select, insert, update, delete on PhongBan to PHANQUYEN
revoke select, insert, update, delete on QuyetDinhTuyenDung to PHANQUYEN
revoke select, insert, update, delete on Show to PHANQUYEN
revoke select, insert, update, delete on Stylish to PHANQUYEN
revoke select, insert, update, delete on NhaTaiTro to PHANQUYEN
