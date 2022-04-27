create table NguoiDung
(
MaNguoiDung nvarchar(50) primary key not null,
TenNguoiDung nvarchar(255) not null,
MatKhau varchar(15) not null,
SoDienThoai varchar(15) not null,
Email varchar(255) not null ,
GhiChu nvarchar(255)
)
create table HangSanXuat
(
MaHangSX nvarchar(50) primary key not null,
TenHang nvarchar(255) not null,
GioiThieu nvarchar(255)
)
create table MauSac
(
MaMau nvarchar(50) primary key not null,
TenMau nvarchar(50) not null,
GhiChu nvarchar(50)
)
create table Ram
(
MaRam nvarchar(50) primary key not null,
DungLuongRam int,
GhiChu nvarchar(255) 
)
create table BoNhoTrong
(
MaBoNho nvarchar(50) primary key not null,
DungLuongBoNho int,
GhiChu nvarchar(255)
)
create table DienThoai
(
MaDT nvarchar(255) primary key not null,
TenDT nvarchar(255) not null,
MaHangSX nvarchar(50) foreign key references HangSanXuat(MaHangSX),
ManHinh nvarchar(15) ,
HeDieuHanh nvarchar(20) ,
Chip nvarchar(20) ,
CameraTruoc nvarchar(20),
CameraSau nvarchar(20),
DungLuongPin nvarchar(20),
BaoHanh nvarchar(20),
GhiChu nvarchar(255)
)
create table ChiTietDienThoai
(
MaDT nvarchar(255) ,
MaMau nvarchar(50) ,
MaRam nvarchar(50) ,
MaBoNho nvarchar(50),
FileAnh nvarchar(255),
NamSX int,
DonGia float
CONSTRAINT Chitietdienthoai_pk PRIMARY KEY (MaDT,MaMau,MaRam,MaBoNho) 

)

create table HoaDon
(
SoHD nvarchar(255) primary key not null,
NgayBan datetime ,
MaNguoiDung nvarchar(50) foreign key references NguoiDung(MaNguoiDung),
TongTien float,
Trangthai int --1:Đã đặt hàng. O: chưa đặt hàng
)
create table ChiTietHoaDon
(
SoHD nvarchar(255) foreign key references HoaDon(SoHD),
MaDT nvarchar(255) not null,--Lấy từ bảng Chi tiết điện thoại
SoLuong int,
GiamGia float,
ThanhTien float,
GhiChu nvarchar(255)
)
create table ThongTinWeb
(
NoiDung nvarchar(255),
FileAnh nvarchar(255),
GhiChu nvarchar(255),
HotLine nvarchar(15) ,
DiaChi nvarchar(255),
Email nvarchar(255),
FaceBook nvarchar(255),
Instagram nvarchar(255)
)
create table BinhLuan
(
MaBL nvarchar(255) primary key not null,
MaNguoiDung nvarchar(50)foreign key references NguoiDung(MaNguoiDung),
MaDienThoai nvarchar(255) ,--Lấy từ bảng Chi tiết điện thoại
NoiDungBL nvarchar(255),
NgayBL datetime
)
insert into NguoiDung(MaNguoiDung,TenNguoiDung,MatKhau,SoDienThoai,Email,GhiChu) values ('User001','DucThanh','123456','0368917001','ducthanh01@gmail.com',''),
('User002','AnhTuyet','123456','0368917001','tuyetanhgd@gmail.com',''),('User003','DoanMinhCuong','123456','0368917001','minhcuong@gmail.com','')
insert into HangSanXuat(MaHangSX,TenHang,GioiThieu) values ('H001','Apple',N'Apple Inc. là một tập đoàn công nghệ đa quốc gia của Mỹ có trụ sở chính tại Cupertino, California'),
('H002','SamSung',N'Công ty Trách nhiệm hữu hạn Điện tử Samsung là một công ty điện tử đa quốc gia của Hàn Quốc'),
('H003','Asus',N'AsusTek Computer Inc. là một tập đoàn đa quốc gia có trụ sở chính tại Đài Loan, chuyên sản xuất các mặt hàng điện tử'),
('H004','BPhone',N'Bphone là dòng điện thoại thông minh chạy hệ điều hành Android'),
('H005','Nokia',N'Nokia Corporation là một tập đoàn viễn thông đa quốc gia'),
('H006','Oppo',N'OPPO Electronics Corp là nhà sản xuất thiết bị điện tử, điện thoại di động Android Trung Quốc'),
('H007','Pixel',N'Google đã chính thức khai tử dòng Nexus là cho ra mắt thế hệ tiếp theo của smartphone mang thương hiệu của mình là chiếc Google Pixel và Google Pixel XL với phần mềm mới nhất và hiệu năng mạnh mẽ.'),
('H008','RealMe',N'Realme là nhà sản xuất điện thoại thông minh Android Trung Quốc có trụ sở tại Tinh, phần mềm và dịch vụ trực tuyến. '),
('H010','Xiaomi',N'Xiaomi Inc. là một Tập đoàn sản xuất hàng điện tử Trung Quốc có trụ sở tại Thâm Quyến.'),
('H009','Vivo',N'Vivo là một công ty Trung Quốc chuyên thiết kế, phát triển và sản xuất điện thoại thông minh Android, phụ kiện điện thoại thông mg minh thế giới')
insert into MauSac(MaMau,TenMau,Ghichu) values ('Color1','Gold',''),('Color2','Black',''),('Color3','Green',''),('Color4','Green',''),('Color5','Yellow',''),
('Color6','White',''),('Color7','Gray',''),('Color8','Blue',''),('Color9','Red','')
insert into Ram(MaRam,DungLuongRam,GhiChu) values ('Ram1',2,''),('Ram2',3,''),('Ram3',4,''),('Ram4',5,''),('Ram5',6,'')
insert into BoNhoTrong(MaBoNho,DungLuongBoNho,GhiChu) values ('Rom1',64,''),('Rom2',128,''),('Rom3',256,''),('Rom4',512,'')
insert into DienThoai(MaDT,TenDT ,MaHangSX,ManHinh ,HeDieuHanh  ,Chip ,CameraTruoc ,CameraSau  ,BaoHanh ,GhiChu ) 
values ('DT001','Iphone 13 ProMax','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT002','Iphone 12 ProMax','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT003','Iphone 11 ProMax','H001','Dynamic 2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT004','Iphone 11 ','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT005','Iphone SE','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT006','SamSung Galaxy A03S','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT007','SamSung S20 FE','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT008','SamSung Z Fold','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT009','SamSung Galaxy S22','H002','Dynamic 2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT010','SamSung Galaxy S21 Ultra ','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT011','SamSung Galaxy A73','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'')
insert into DienThoai(MaDT,TenDT ,MaHangSX,ManHinh ,HeDieuHanh  ,Chip ,CameraTruoc ,CameraSau  ,BaoHanh ,GhiChu ) 
values ('DT012','Asus Rog Phone 3','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT013','Asus Rog Phone 5','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT014','Asus Rog Phone 5s','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT015','Asus Rog Phone MC','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT016','Asus Rog Phone 6','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT017','BPhone A50','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT018','BPhone A60','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT019','BPhone A85','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT020','BPhone B86','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT021','Nokia cảm ứng 2.3','H005','Dynamic  2X','microsoft',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT022','Nokia cảm ứng 105','H005','Dynamic  2X','microsoft',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT023','Nokia 6300','H005','Dynamic  2X','microsoft',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT024','Nokia G10','H005','Dynamic  2X','microsoft',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT025','Nokia cảm ứng C20','H005','Dynamic  2X','microsoft',N'Snapdragon','12 MP','12 MP',N'12 tháng',N''),
('DT026','Nokia cảm ứng 30','H005','Dynamic  2X','microsoft',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'')

insert into ChiTietDienThoai(MaDT,MaMau,MaRam,MaBoNho,FileAnh,NamSX,DonGia)
values 
('DT001','Color1','Ram5','Rom1','iphone13ProMax_512GB_gold.png',2022,20000000),
('DT001','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,28000000),
('DT001','Color7','Ram5','Rom3','iphone13Pro_128GB.png',2022,29800000),
('DT002','Color1','Ram4','Rom3','iphone13_256GB.png',2022,18950000),
('DT002','Color8','Ram4','Rom4','iphone12_512GB.png',2022,18950000),
('DT002','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,22000000),
('DT003','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,22000000),
('DT004','Color3','Ram2','Rom3','iphone11_128GB_blue.png',2022,22000000),
('DT004','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,22000000),
('DT005','Color6','Ram5','Rom4','IphoneSE.png',2022,22000000),
('DT006','Color2','Ram5','Rom4','samsung-galaxy-a03s-black-gc-org.png',2022,6100000),
('DT007','Color3','Ram2','Rom4','S20 FE - Mint  (1).png',2022,5750000),
('DT008','Color2','Ram2','Rom3','image-removebg-preview-3.png',2022,9400000),
('DT009','Color2','Ram1','Rom3','galaxyZFold.png',2022,34000000),
('DT010','Color3','Ram1','Rom3','galaxys22.png',2022,34000000),
('DT011','Color4','Ram1','Rom3','galaxyS21Ultra.png',2022,27000000)
insert into ThongTinWeb(NoiDung,FileAnh,GhiChu,HotLine,DiaChi,Email,FaceBook,Instagram)
values ('Đến với Hoàng Hà Mobile, quý khách có thể hoàn toàn yên tâm về uy tín, chất lượng sản phẩm với mức giá rẻ hơn khoảng 15-20% so với giá bán trên thị trường.','Thongtin.jpg','','0368917001',
N'Số 3 Đường Cầu Giấy,Phường Láng Thượng,Quận Đống Đa,TP.Hà Nội','tuyetanhgd@gmail.com',N'https://www.facebook.com/tuyetanh011001',N'snowseyong')





