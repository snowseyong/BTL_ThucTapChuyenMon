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
GhiChu nvarchar(255),
FileAnh nvarchar(255)
)
create table ChiTietDienThoai
(
MaChiTiet nvarchar(255) primary key not null,
MaDT nvarchar(255) foreign key references DienThoai(MaDT),
MaMau nvarchar(50) foreign key references MauSac(MaMau),
MaRam nvarchar(50) foreign key references Ram(MaRam),
MaBoNho nvarchar(50) foreign key references BoNhoTrong(MaBoNho),
FileAnh nvarchar(255),
NamSX int,
DonGia float

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
MaChiTiet nvarchar(255) foreign key references ChiTietDienThoai(MaChiTiet)  not null,--Lấy từ bảng Chi tiết điện thoại
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
MaDienThoai nvarchar(255) foreign key references ChiTietDienThoai(MaChiTiet),--Lấy từ bảng Chi tiết điện thoại
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
insert into DienThoai(MaDT,TenDT ,MaHangSX,ManHinh ,HeDieuHanh  ,Chip ,CameraTruoc ,CameraSau  ,BaoHanh ,GhiChu,FileAnh ) 
values ('DT001','Iphone 13 ProMax','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','iphone13ProMax_512GB_gold.png'),
('DT002','Iphone 12 ProMax','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','iphone12_512GB.png'),
('DT003','Iphone 11 ProMax','H001','Dynamic 2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','iphone11_128GB_blue.png'),
('DT004','Iphone 11 ','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','iphone13_256GB.png'),
('DT005','Iphone SE','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','IphoneSE.png'),
('DT006','SamSung Galaxy A03S','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','samsung-galaxy-a03s-black-gc-org.png'),
('DT007','SamSung S20 FE','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','S20 FE - Mint  (1).png'),
('DT008','SamSung Z Fold','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','galaxyZFold.png'),
('DT009','SamSung Galaxy S22','H002','Dynamic 2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','galaxys22.png'),
('DT010','SamSung Galaxy S21 Ultra ','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','galaxyS21Ultra.png'),
('DT011','SamSung Galaxy A73','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','galaxyA73.png')
insert into DienThoai(MaDT,TenDT ,MaHangSX,ManHinh ,HeDieuHanh  ,Chip ,CameraTruoc ,CameraSau  ,BaoHanh ,GhiChu,FileAnh ) 
values ('DT012','Asus Rog Phone 3','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','asus-rog-phone-5-black.jpeg'),
('DT013','Asus Rog Phone 5','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','asus-rog-phone-5s-den.jpg'),
('DT014','Asus Rog Phone 5s','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'','asus-rog-phone-3.jpg')

insert into ChiTietDienThoai(MaChiTiet,MaDT,MaMau,MaRam,MaBoNho,FileAnh,NamSX,DonGia)
values 
('CT001','DT001','Color1','Ram5','Rom1','iphone13ProMax_512GB_gold.png',2022,20000000),
('CT002','DT001','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,28000000),
('CT003','DT001','Color7','Ram5','Rom3','iphone13Pro_128GB.png',2022,29800000),
('CT004','DT002','Color1','Ram4','Rom3','iphone13_256GB.png',2022,18950000),
('CT005','DT002','Color8','Ram4','Rom4','iphone12_512GB.png',2022,18950000),
('CT006','DT002','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,22000000),
('CT007','DT003','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,22000000),
('CT008','DT004','Color3','Ram2','Rom3','iphone11_128GB_blue.png',2022,22000000),
('CT009','DT004','Color6','Ram5','Rom4','Iphone13_512GB_gold.png',2022,22000000),
('CT010','DT005','Color6','Ram5','Rom4','IphoneSE.png',2022,22000000),
('CT011','DT006','Color2','Ram5','Rom4','samsung-galaxy-a03s-black-gc-org.png',2022,6100000),
('CT012','DT007','Color3','Ram2','Rom4','S20 FE - Mint  (1).png',2022,5750000),
('CT013','DT008','Color2','Ram2','Rom3','image-removebg-preview-3.png',2022,9400000),
('CT014','DT009','Color2','Ram1','Rom3','galaxyZFold.png',2022,34000000),
('CT015','DT010','Color3','Ram1','Rom3','galaxys22.png',2022,34000000),
('CT016','DT011','Color4','Ram1','Rom3','galaxyS21Ultra.png',2022,27000000)
insert into ThongTinWeb(NoiDung,FileAnh,GhiChu,HotLine,DiaChi,Email,FaceBook,Instagram)
values ('Đến với Hoàng Hà Mobile, quý khách có thể hoàn toàn yên tâm về uy tín, chất lượng sản phẩm với mức giá rẻ hơn khoảng 15-20% so với giá bán trên thị trường.','Thongtin.jpg','','0368917001',
N'Số 3 Đường Cầu Giấy,Phường Láng Thượng,Quận Đống Đa,TP.Hà Nội','tuyetanhgd@gmail.com',N'https://www.facebook.com/tuyetanh011001',N'snowseyong')





