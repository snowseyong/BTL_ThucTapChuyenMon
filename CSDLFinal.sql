
use BTL_BanDienThoai_TTCM
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
DonGia float,
SoLuong int

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
GhiChu nvarchar(255),
SoLuongBan int
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
insert into MauSac(MaMau,TenMau,Ghichu) values
('Color1',N'Vàng đồng',''),('Color2',N'Đen',''),('Color3',N'Hồng',''),('Color4',N'Xanh lá',''),('Color5',N'Tím ',''),
('Color6',N'Trắng',''),('Color7',N'Xám',''),('Color8',N'Xanh da trời',''),('Color9',N'Đỏ',''),('Color10',N'Cam',''),
('Color11',N'Xanh nước biển','')
insert into NguoiDung(MaNguoiDung,TenNguoiDung,MatKhau,SoDienThoai,Email,GhiChu) values ('User001','DucThanh','123456','0368917001','ducthanh01@gmail.com',''),
('User002','AnhTuyet','123456','0368917001','tuyetanhgd@gmail.com',''),('User003','DoanMinhCuong','123456','0368917001','minhcuong@gmail.com','')

insert into Ram(MaRam,DungLuongRam,GhiChu) values ('Ram1',2,''),('Ram2',3,''),('Ram3',4,''),('Ram4',5,''),('Ram5',6,'')
insert into BoNhoTrong(MaBoNho,DungLuongBoNho,GhiChu) values ('Rom1',64,''),('Rom2',128,''),('Rom3',256,''),('Rom4',512,'')

insert into ThongTinWeb(NoiDung,FileAnh,GhiChu,HotLine,DiaChi,Email,FaceBook,Instagram)
values ('Đến với Hoàng Hà Mobile, quý khách có thể hoàn toàn yên tâm về uy tín, chất lượng sản phẩm với mức giá rẻ hơn khoảng 15-20% so với giá bán trên thị trường.','Thongtin.jpg','','0368917001',
N'Số 3 Đường Cầu Giấy,Phường Láng Thượng,Quận Đống Đa,TP.Hà Nội','tuyetanhgd@gmail.com',N'https://www.facebook.com/tuyetanh011001',N'snowseyong')

insert into HangSanXuat(MaHangSX,TenHang,GioiThieu) values
('H001','Apple',N'Apple Inc. là một tập đoàn công nghệ đa quốc gia của Mỹ có trụ sở chính tại Cupertino, California'),
('H002','SamSung',N'Công ty Trách nhiệm hữu hạn Điện tử Samsung là một công ty điện tử đa quốc gia của Hàn Quốc'),
('H003','Oppo',N'OPPO Electronics Corp là nhà sản xuất thiết bị điện tử, điện thoại di động Android Trung Quốc'),
('H004','Nokia',N'Nokia Corporation là một tập đoàn viễn thông đa quốc gia'),
('H005','Xiaomi',N'Xiaomi Inc. là một Tập đoàn sản xuất hàng điện tử Trung Quốc có trụ sở tại Thâm Quyến.'),
('H006','Vsmart',N'Vsmart là dòng điện thoại thông minh do chính Việt Nam sản xuất chạy hệ điều hành Android thuộc tập đoàn Vingroup')
insert into DienThoai(MaDT,TenDT ,MaHangSX,ManHinh ,HeDieuHanh  ,Chip ,CameraTruoc ,CameraSau  ,BaoHanh ,GhiChu,FileAnh ) 
values 
('DT01','Iphone 13 ProMax','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Một nâng cấp hệ thống camera chuyên nghiệp hoành tráng chưa từng có. Màn hình Super Retina XDR với ProMotion cho cảm giác nhanh nhạy hơn. Chip A15 Bionic thần tốc. Mạng 5G siêu nhanh.1 Thiết kế bền bỉ và thời lượng pin dài nhất từng có trên iPhone (2)','iphone_13_pro_1.jpg'),
('DT02','Iphone 13','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Hệ thống camera kép tiên tiến nhất từng có trên iPhone. Chip A15 Bionic thần tốc. Bước nhảy vọt về thời lượng pin. Thiết kế bền bỉ. Mạng 5G siêu nhanh (1). Cùng với màn hình Super Retina XDR sáng hơn','iphone_13_2.jpg'),
('DT03','Iphone 13 mini','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Hệ thống camera kép tiên tiến nhất từng có trên iPhone. Chip A15 Bionic thần tốc. Thời lượng pin tăng vọt. Thiết kế bền bỉ. Mạng 5G siêu nhanh.1 Cùng với màn hình Super Retina XDR sáng hơn.','iphone13_3.jpg'),
('DT04','Iphone 12 ProMax','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Hệ thống camera kép mới. Với màn hình Super Retina XDR tuyệt đẹp, nay bạn có thể chiêm ngưỡng từng chi tiết hình ảnh vô cùng sống động','iphone_12_3.jpg'),
('DT05','Iphone 12','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Hệ thống camera kép mới. Với màn hình Super Retina XDR tuyệt đẹp, nay bạn có thể chiêm ngưỡng từng chi tiết hình ảnh vô cùng sống động','iphone_12_6.jpg'),
('DT06','Iphone 12 mini','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Hệ thống camera kép mới. Với màn hình Super Retina XDR tuyệt đẹp, nay bạn có thể chiêm ngưỡng từng chi tiết hình ảnh vô cùng sống động','iphone_12_5.jpg'),
('DT07','Iphone 11 ProMax','H001','Dynamic 2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Quay video 4K, chụp ảnh chân dung tuyệt đẹp và chụp ảnh phong cảnh rộng với hệ thống camera kép hoàn toàn mới. Chụp ảnh tuyệt đẹp trong điều kiện ánh sáng yếu với chế độ Ban Đêm','iphone_11_1.jpg'),
('DT08','Iphone 11 ','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Quay video 4K, chụp ảnh chân dung tuyệt đẹp và chụp ảnh phong cảnh rộng với hệ thống camera kép hoàn toàn mới. Chụp ảnh tuyệt đẹp trong điều kiện ánh sáng yếu với chế độ Ban Đêm','iphone_12_2.jpg'),
('DT09','Iphone 11 mini','H001','Dynamic  2X','IOS',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Quay video 4K, chụp ảnh chân dung tuyệt đẹp và chụp ảnh phong cảnh rộng với hệ thống camera kép hoàn toàn mới. Chụp ảnh tuyệt đẹp trong điều kiện ánh sáng yếu với chế độ Ban Đêm','iphone_xr_1.jpg'),
('DT010','SamSung Galaxy A03S','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Nằm gọn trong túi siêu phẩm di động với màn hình gập mở độc đáo. Đóng lại bạn có một phụ kiện công nghệ vừa vặn mọi ngăn túi với kích thước 4.2-inch. Mở ra bạn có một chiếc điện thoại thông minh phá vỡ mọi giới hạn.','ss1.jpg'),
('DT011','SamSung S20 FE','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Nằm gọn trong túi siêu phẩm di động với màn hình gập mở độc đáo. Đóng lại bạn có một phụ kiện công nghệ vừa vặn mọi ngăn túi với kích thước 4.2-inch. Mở ra bạn có một chiếc điện thoại thông minh phá vỡ mọi giới hạn.','ss2.jpg'),
('DT012','SamSung Z Fold','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Tính năng tối ưu hóa tần số quét theo nội dung xem cho trải nghiệm thêm mãn nhãn. Sở hữu công nghệ Dynamic AMOLED 2X, Galaxy Z Flip3 5G mở ra thế giới giải trí chuẩn điện ảnh và sống động nhất trên Galaxy Z','ss3.jpg'),
('DT013','SamSung Galaxy S22','H002','Dynamic 2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Gặp gỡ Galaxy S22 Ultra - kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S. hiện diện với tổng thể độc bản thanh mảnh, cụm camera không viền độc đáo, tất cả làm nên một siêu phẩm di động mang đậm dấu ấn riêng','ss4.jpg'),
('DT014','SamSung Galaxy S21 Ultra ','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Gặp gỡ Galaxy S22 Ultra - kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S. hiện diện với tổng thể độc bản thanh mảnh, cụm camera không viền độc đáo, tất cả làm nên một siêu phẩm di động mang đậm dấu ấn riêng','ss5.jpg'),
('DT015','SamSung Galaxy A73','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Gặp gỡ Galaxy S22 Ultra - kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S. hiện diện với tổng thể độc bản thanh mảnh, cụm camera không viền độc đáo, tất cả làm nên một siêu phẩm di động mang đậm dấu ấn riêng','ss6.jpg'),
('DT016','SamSung Galaxy A52','H002','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Gặp gỡ Galaxy S22 Ultra - kế thừa tinh hoa Galaxy Note cùng đột phá Galaxy S. hiện diện với tổng thể độc bản thanh mảnh, cụm camera không viền độc đáo, tất cả làm nên một siêu phẩm di động mang đậm dấu ấn riêng','ss7.jpg'),
('DT017','Oppo A73','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Oppo A95 được trang bị con chip xử lý Snapdragon 662 8 nhân cho hiệu năng ổn định, mượt mà với các tác vụ hàng ngày cũng như cải thiện hiệu suất để trải nghiệm chơi game tốt hơn.','oppo1.jpg'),
('DT018','Oppo A94','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Oppo A95 được trang bị con chip xử lý Snapdragon 662 8 nhân cho hiệu năng ổn định, mượt mà với các tác vụ hàng ngày cũng như cải thiện hiệu suất để trải nghiệm chơi game tốt hơn.','oppo2.jpg'),
('DT019','Oppo A56','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Oppo A95 được trang bị con chip xử lý Snapdragon 662 8 nhân cho hiệu năng ổn định, mượt mà với các tác vụ hàng ngày cũng như cải thiện hiệu suất để trải nghiệm chơi game tốt hơn.','oppo3.jpg'),
('DT020','Oppo A76','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Oppo A95 được trang bị con chip xử lý Snapdragon 662 8 nhân cho hiệu năng ổn định, mượt mà với các tác vụ hàng ngày cũng như cải thiện hiệu suất để trải nghiệm chơi game tốt hơn.','oppo4.jpg'),
('DT021','Oppo A94','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Oppo A95 được trang bị con chip xử lý Snapdragon 662 8 nhân cho hiệu năng ổn định, mượt mà với các tác vụ hàng ngày cũng như cải thiện hiệu suất để trải nghiệm chơi game tốt hơn.','oppo5.jpg'),
('DT022','Oppo A55','H003','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Oppo A95 được trang bị con chip xử lý Snapdragon 662 8 nhân cho hiệu năng ổn định, mượt mà với các tác vụ hàng ngày cũng như cải thiện hiệu suất để trải nghiệm chơi game tốt hơn.','oppo6.jpg'),
('DT023','Nokia T20 Lite','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','nokia2.jpg'),
('DT024','Nokia T21 ','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','nokia3.jpg'),
('DT025','Nokia T22 Lite','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','nokia4.jpg'),
('DT026','Nokia T22 ','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','nokia5.jpg'),
('DT027','Nokia G63','H004','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','nokia6.jpg'),
('DT028','Xiaomi T11 pro','H005','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','xiaomi1.jpg'),
('DT029','Xiaomi Redmi note 6','H005','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','xiaomi2.jpg'),
('DT030','Xiaomi Redmi note 7','H005','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','xiaomi3.jpg'),
('DT031','Xiaomi Redmi note 8','H005','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','xiaomi4.jpg'),
('DT032','Xiaomi Redmi note 7 plus','H005','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','xiaomi5.jpg'),
('DT033','Xiaomi Redmi note 8 pro','H005','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N' Chiếc điện thoại của chúng ta không chỉ đẹp mà còn chế tác từ lớp vỏ polycarbonate chất lượng cao để mang đến độ bền trường tồn theo thời gian','xiaomi6.jpg'),
('DT034','Vsmart joy 4','H006','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Sự ra đời của Vsmart Aris Series đánh dấu thành công vị thế tiên phong thương hiệu Việt trên trường công nghệ quốc tế. Camera ẩn dưới màn hình và chip bảo mật lượng tử là bước nhảy vọt của Vsmart để thay đổi cuộc chơi công nghệ','va1.jpg'),
('DT035','Vsmart joy 3','H006','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Sự ra đời của Vsmart Aris Series đánh dấu thành công vị thế tiên phong thương hiệu Việt trên trường công nghệ quốc tế. Camera ẩn dưới màn hình và chip bảo mật lượng tử là bước nhảy vọt của Vsmart để thay đổi cuộc chơi công nghệ','va2.jpg'),
('DT036','Vsmart joy 2','H006','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Sự ra đời của Vsmart Aris Series đánh dấu thành công vị thế tiên phong thương hiệu Việt trên trường công nghệ quốc tế. Camera ẩn dưới màn hình và chip bảo mật lượng tử là bước nhảy vọt của Vsmart để thay đổi cuộc chơi công nghệ','va3.jpg'),
('DT037','Vsmart live 4','H006','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Sự ra đời của Vsmart Aris Series đánh dấu thành công vị thế tiên phong thương hiệu Việt trên trường công nghệ quốc tế. Camera ẩn dưới màn hình và chip bảo mật lượng tử là bước nhảy vọt của Vsmart để thay đổi cuộc chơi công nghệ','va4.jpg'),
('DT038','Vsmart live 5','H006','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Sự ra đời của Vsmart Aris Series đánh dấu thành công vị thế tiên phong thương hiệu Việt trên trường công nghệ quốc tế. Camera ẩn dưới màn hình và chip bảo mật lượng tử là bước nhảy vọt của Vsmart để thay đổi cuộc chơi công nghệ','va5.jpg'),
('DT039','Vsmart active 3','H006','Dynamic  2X','android',N'Snapdragon','12 MP','12 MP',N'12 tháng',N'Sự ra đời của Vsmart Aris Series đánh dấu thành công vị thế tiên phong thương hiệu Việt trên trường công nghệ quốc tế. Camera ẩn dưới màn hình và chip bảo mật lượng tử là bước nhảy vọt của Vsmart để thay đổi cuộc chơi công nghệ','va6.jpg')
insert into ChiTietDienThoai(MaChiTiet,MaDT,MaMau,MaRam,MaBoNho,FileAnh,NamSX,DonGia,SoLuong)
values 
('CT001','DT01','Color8','Ram5','Rom1','iphone_13_pro_1.jpg',2022,20000000,34),
('CT002','DT01','Color4','Ram5','Rom4','iphone_13_2.jpg',2022,22000000,45),
('CT003','DT01','Color3','Ram5','Rom3','iphone13_3.jpg',2022,21800000,12),
('CT004','DT02','Color11','Ram4','Rom3','iphone_12_3.jpg',2022,18950000,102),
('CT005','DT02','Color5','Ram4','Rom4','iphone_12_6.jpg',2022,18950000,84),
('CT006','DT02','Color2','Ram5','Rom4','iphone_12_5.jpg',2022,19000000,65),
('CT007','DT03','Color6','Ram5','Rom4','iphone_11_1.jpg',2022,20000000,106),
('CT008','DT03','Color10','Ram2','Rom3','iphone_12_2.jpg',2022,21500000,854),
('CT009','DT03','Color4','Ram5','Rom4','iphone_13_2.jpg',2022,22000000,948),
('CT010','DT010','Color4','Ram5','Rom4','ss1.jpg',2022,30000000,43),
('CT011','DT010','Color6','Ram5','Rom4','ss2.jpg',2022,32000000,43),
('CT012','DT010','Color11','Ram2','Rom4','ss3.jpg',2022,31000000,44),
('CT013','DT011','Color8','Ram2','Rom3','ss4.jpg',2022,15000000,23),
('CT014','DT011','Color4','Ram1','Rom3','ss5.jpg',2022,16000000,12),
('CT015','DT011','Color7','Ram1','Rom4','ss6.jpg',2022,16500000,43),
('CT016','DT012','Color4','Ram2','Rom3','ss1.jpg',2022,18000000,65),
('CT017','DT012','Color11','Ram5','Rom3','ss3.jpg',2022,18300000,43),
('CT018','DT012','Color7','Ram5','Rom4','ss6.jpg',2022,18500000,90),
('CT027','DT017','Color11','Ram5','Rom4','oppo5.jpg',2022,35000000,23),
('CT019','DT017','Color6','Ram5','Rom4','oppo1.jpg',2022,37000000,94),
('CT020','DT017','Color8','Ram5','Rom4','oppo3.jpg',2022,36000000,10),
('CT021','DT018','Color6','Ram5','Rom4','oppo1.jpg',2022,27000000,32),
('CT022','DT018','Color2','Ram5','Rom4','oppo2.jpg',2022,27800000,40),
('CT023','DT018','Color8','Ram5','Rom4','oppo3.jpg',2022,27500000,33),
('CT024','DT019','Color7','Ram5','Rom4','oppo4.jpg',2022,10000000,943),
('CT025','DT019','Color11','Ram5','Rom4','oppo5.jpg',2022,12000000,743),
('CT026','DT019','Color4','Ram5','Rom4','oppo6.jpg',2022,12500000,100)
select * from ChiTietDienThoai

select * from MauSac
insert into NguoiDung(MaNguoiDung,TenNguoiDung,MatKhau,SoDienThoai,Email)
values ('Admin','Admin','123456','0368917001','TTCsellerphone@gmail.com')



