create database QUANLYBENHAN77
go
use	QUANLYBENHAN77
go
CREATE TABLE NhanVien (
    MaNV VARCHAR(10) PRIMARY KEY ,
    HoTen NVARCHAR(100) NOT NULL,
    NgaySinh DATE,
    DiaChi NVARCHAR(200),
    CCCD VARCHAR(12),
    SDT VARCHAR(15) NOT NULL,
    ChucVu NVARCHAR(50),
    GioiTinh NVARCHAR(10),
    TaiKhoan VARCHAR(50)  NOT NULL,
    MatKhau VARCHAR(100)  NOT NULL,
    Khoa VARCHAR(50)
);

CREATE TABLE BenhNhan (
    MaBN VARCHAR(10) PRIMARY KEY,
    CCCD VARCHAR(12),
    HoTen NVARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GTinh NVARCHAR(10),
    NgheNghiep NVARCHAR(50),
    DanToc NVARCHAR(50),
    NgoaiKieu NVARCHAR(50),
    DiaChi NVARCHAR(200)  NOT NULL,
    NoiLamViec NVARCHAR(200),
    DoiTuong NVARCHAR(50)  NOT NULL,
    SoBHYT VARCHAR(20) ,
    GitriBHYT DATE,
    HoTenNTNhan NVARCHAR(100)  NOT NULL,
    DiaChiNT NVARCHAR(200)  NOT NULL,
    SDTNTNhan VARCHAR(15)  NOT NULL,
    MatKhau VARCHAR(100)  NOT NULL,
    STT INT,
    TrieuChung NVARCHAR(200),
    Khoa NVARCHAR(50),
    TaiKham NVARCHAR(50),
    TgKham DATE, 
	ngayTao datetime
);


CREATE TABLE HSBA (
    MaHSBA VARCHAR(10) PRIMARY KEY,
    NgayTao DATE,
    TrangThai NVARCHAR(50),
    Khoa NVARCHAR(50),
    NguoiTao NVARCHAR(100),
    MaBN VARCHAR(10),
    FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN)
);

CREATE TABLE TaiKham (
    MaHSBA VARCHAR(10),
    TGTaiKham DATE,
    TrangThai NVARCHAR(50),
    PRIMARY KEY ( MaHSBA),
    FOREIGN KEY (MaHSBA) REFERENCES HSBA(MaHSBA)
);
CREATE TABLE XetNghiem (
    MaXN VARCHAR(10) PRIMARY KEY,
    LoaiXN NVARCHAR(100),
	
);

CREATE TABLE HSBA_XetNghiem (
    MaHSBA VARCHAR(10),
    MaXN VARCHAR(10),
    KQXetNghiem NVARCHAR(200),
    TgianTao DATE,
	AnhXetNghiem NVARCHAR(max),
    BacSyXN NVARCHAR(100),
    PRIMARY KEY (MaHSBA, MaXN),
    FOREIGN KEY (MaHSBA) REFERENCES HSBA(MaHSBA),
	FOREIGN KEY (MaXN) REFERENCES XetNghiem(MaXN)
);



CREATE TABLE PhieuChamSoc (
    MaHSBA VARCHAR(10),
    Ngay DATE,
    DienBienBenh NVARCHAR(200),
    YLenh NVARCHAR(200),
    TenDieuDuong NVARCHAR(100),
    PRIMARY KEY (MaHSBA, Ngay),
    FOREIGN KEY (MaHSBA) REFERENCES HSBA(MaHSBA)
);

CREATE TABLE ChanDoan (
    MaHSBA VARCHAR(10) PRIMARY KEY,
    NoiChuyenDen NVARCHAR(100),
    KKB_CapCuu NVARCHAR(100),
    TTBanDau NVARCHAR(100),
    PhauThuat NVARCHAR(100),
    BenhChinh NVARCHAR(100),
    BenhKemTheo NVARCHAR(100),
    TaiBien NVARCHAR(100),
    BienChung NVARCHAR(100),
    NoiTru NVARCHAR(100),
    NgoaiTru NVARCHAR(100),
    TaiKham NVARCHAR(100),
    NgayTaiKham DATE,
    FOREIGN KEY (MaHSBA) REFERENCES HSBA(MaHSBA)
);
CREATE TABLE Thuoc (
    IDThuoc VARCHAR(10) PRIMARY KEY,
    TenThuoc NVARCHAR(100),
    NSX DATE,
    HSD DATE,
    BH BIT
);

create table DonThuoc (
	MaDonThuoc VARCHAR(10) primary key,
	ngayTao date,
	nguoiTao nvarchar(10));

CREATE TABLE DonThuocDetal (
    MaDonThuoc VARCHAR(10),
    IDThuoc VARCHAR(10),
    SoLg INT,
    DvTinh NVARCHAR(50),
    LieuDung NVARCHAR(100),
    GhiChu NVARCHAR(200),
	primary key (MaDonThuoc, IDThuoc),
	    FOREIGN KEY (MaDonThuoc) REFERENCES DonThuoc(MaDonThuoc),
	FOREIGN KEY (IDThuoc) REFERENCES Thuoc(IDThuoc)
);
CREATE TABLE DonThuoc_HSBA (
    MaHSBA VARCHAR(10),
    MaDonThuoc VARCHAR(10),
    TGianBDauSD DATE,
    TGianKThucSD DATE,
    PRIMARY KEY (MaHSBA, MaDonThuoc),
    FOREIGN KEY (MaHSBA) REFERENCES HSBA(MaHSBA),
    FOREIGN KEY (MaDonThuoc) REFERENCES DonThuoc(MaDonThuoc)
);

CREATE TABLE Khoa (
    MaKhoa VARCHAR(10) PRIMARY KEY,
    TenKhoa NVARCHAR(100)
);


CREATE TABLE TTNhapVien (
    MaHSBA VARCHAR(10),
	MaNhapVien VARCHAR(10) Primary key,
    TgianVnVien DATE,
    Buong NVARCHAR(50),
    Giuong NVARCHAR(50),
    LyDoVao NVARCHAR(100),
    NoiGTieu NVARCHAR(100),
    NVienLanThu INT,
    ChuyenVien NVARCHAR(100),
    BVChuyenDen NVARCHAR(100),
    TGRaVien DATE,
    LyDoRaVien NVARCHAR(100),
    FOREIGN KEY (MaHSBA) REFERENCES HSBA(MaHSBA));

CREATE TABLE TTNV_KHOA (
    MaNhapVien VARCHAR(10),
    MaKhoa VARCHAR(10),
    TgChuyenDen DATE,
    PRIMARY KEY (MaNhapVien, MaKhoa),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa),
	FOREIGN KEY (MaNhapVien) REFERENCES TTNhapVien(MaNhapVien)
);


CREATE TABLE KhieuNai (
    IDKNai VARCHAR(10),
    IDBenhNhan VARCHAR(10),
    LyDo NVARCHAR(200),
    NgayKN DATE,
    TrangThai NVARCHAR(50),
    XuLyKN NVARCHAR(200),
    MaNV VARCHAR(10),
    PRIMARY KEY (IDKNai, IDBenhNhan),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    FOREIGN KEY (IDBenhNhan) REFERENCES BenhNhan(MaBN)
);

ALTER TABLE NhanVien
ADD CONSTRAINT CHK_GioiTinh CHECK (GioiTinh IN (N'Nam', N'Nữ', N'Khác'));

ALTER TABLE Thuoc
ADD CONSTRAINT CHK_HSD CHECK (HSD > NSX);

ALTER TABLE DonThuocDetal
ADD CONSTRAINT CHK_SoLg_Positive CHECK (SoLg > 0);


ALTER TABLE HSBA
ADD CONSTRAINT DF_TrangThai DEFAULT N'Chưa duyệt' FOR TrangThai;

ALTER TABLE DonThuocDetal
ADD CONSTRAINT DF_GhiChu DEFAULT N'Không có ghi chú' FOR GhiChu;

ALTER TABLE Thuoc
ADD CONSTRAINT DF_BH DEFAULT 1 FOR BH; -- 1 = Có bảo hiểm

INSERT INTO NhanVien (
    MaNV, HoTen, NgaySinh, DiaChi, CCCD, SDT, ChucVu, GioiTinh, TaiKhoan, MatKhau, Khoa
)
VALUES
('BS001', N'Nguyễn Văn A', '1980-05-10', N'123 Lê Lợi, Q1', '012345678901', '0901234567', N'Bác sĩ', N'Nam', 'nva', 'matkhau1', 'K001'),
('NV001', N'Trần Thị B', '1985-07-20', N'45 Nguyễn Huệ, Q3', '012345678902', '0902345678', N'Y tá', N'Nữ', 'ttb', 'matkhau2', 'K002'),
('BS002', N'Lê Văn C', '1990-01-15', N'78 Trần Hưng Đạo, Q5', '012345678903', '0903456789', N'Bác sĩ', N'Nam', 'lvc', 'matkhau3', 'K003'),
('NV002', N'Phạm Thị D', '1988-03-30', N'12 Lý Tự Trọng, Q1', '012345678904', '0904567890', N'Y sĩ', N'Nữ', 'ptd', 'matkhau4', 'K004'),
('NV003', N'Hoàng Văn E', '1992-09-25', N'91 Cách Mạng Tháng 8, Q10', '012345678905', '0905678901', N'Hộ lý', N'Nam', 'hve', 'matkhau5', 'K005'),
('NV004', N'Ngô Thị F', '1991-11-12', N'15 Phạm Ngũ Lão, Q1', '012345678906', '0906789012', N'Điều dưỡng', N'Nữ', 'ntf', 'matkhau6', 'K001'),
('BS003', N'Vũ Văn G', '1983-08-19', N'36 Nguyễn Trãi, Q5', '012345678907', '0907890123', N'Bác sĩ', N'Nam', 'vvg', 'matkhau7', 'K002'),
('NV005', N'Đặng Thị H', '1995-06-22', N'88 Lê Lai, Q3', '012345678908', '0908901234', N'Y tá', N'Nữ', 'dth', 'matkhau8', 'K003'),
('NV006', N'Trương Văn I', '1987-12-05', N'102 Hai Bà Trưng, Q1', '012345678909', '0909012345', N'Y sĩ', N'Nam', 'tvi', 'matkhau9', 'K004'),
('NV007', N'Bùi Thị K', '1993-02-18', N'55 Trường Chinh, Q12', '012345678910', '0910123456', N'Hộ lý', N'Nữ', 'btk', 'matkhau10', 'K005'),
('BS004', N'Phan Văn L', '1986-04-14', N'23 Nguyễn Văn Cừ, Q5', '012345678911', '0911234567', N'Bác sĩ xét nghiệm', N'Nam', 'pvl', 'matkhau11', 'K001'),
('NV008', N'Huỳnh Thị M', '1994-10-01', N'19 Lý Thường Kiệt, Q10', '012345678912', '0912345678', N'Y tá', N'Nữ', 'htm', 'matkhau12', 'K002'),
('NV009', N'Tô Văn N', '1989-09-09', N'7 Pasteur, Q3', '012345678913', '0913456789', N'Điều dưỡng', N'Nam', 'tvn', 'matkhau13', 'K003'),
('NV010', N'Đỗ Thị O', '1996-03-27', N'61 Nguyễn Đình Chiểu, Q1', '012345678914', '0914567890', N'Hộ lý', N'Nữ', 'dto', 'matkhau14', 'K004'),
('BS005', N'Lâm Văn P', '1984-07-07', N'10 Cộng Hòa, Tân Bình', '012345678915', '0915678901', N'Bác sĩ', N'Nam', 'lvp', 'matkhau15', 'K005'),
('NV011', N'Nguyễn Thị Q', '1997-01-21', N'14 Phan Đăng Lưu, Q.Bình Thạnh', '012345678916', '0916789012', N'Y tá', N'Nữ', 'ntq', 'matkhau16', 'K001'),
('BS006', N'Trần Văn R', '1982-05-02', N'39 Nguyễn Văn Cừ, Q5', '012345678917', '0917890123', N'Bác sĩ', N'Nam', 'tvr', 'matkhau17', 'K002'),
('NV012', N'Lê Thị S', '1993-12-11', N'25 D2, Q.Bình Thạnh', '012345678918', '0918901234', N'Điều dưỡng', N'Nữ', 'lts', 'matkhau18', 'K003'),
('NV013', N'Đoàn Văn T', '1988-08-08', N'10 Phan Xích Long, Q.Phú Nhuận', '012345678919', '0919012345', N'Y sĩ', N'Nam', 'dvt', 'matkhau19', 'K004'),
('NV014', N'Phạm Thị U', '1995-06-19', N'70 Hoàng Hoa Thám, Q.Tân Bình', '012345678920', '0920123456', N'Hộ lý', N'Nữ', 'ptu', 'matkhau20', 'K005'),
('BS007', N'Hoàng Văn V', '1981-03-03', N'89 Điện Biên Phủ, Q.Bình Thạnh', '012345678921', '0921234567', N'Bác sĩ', N'Nam', 'hvv', 'matkhau21', 'K001'),
('NV015', N'Lý Thị W', '1996-09-12', N'100 Nguyễn Kiệm, Q.Gò Vấp', '012345678922', '0922345678', N'Y tá', N'Nữ', 'ltw', 'matkhau22', 'K002'),
('NV016', N'Tăng Văn X', '1990-11-09', N'3 Cách Mạng Tháng 8, Q10', '012345678923', '0923456789', N'Điều dưỡng', N'Nam', 'tvx', 'matkhau23', 'K003'),
('BS008', N'Châu Thị Y', '1987-06-25', N'48 Nguyễn Oanh, Q.Gò Vấp', '012345678924', '0924567890', N'Bác sĩ xét nghiệm', N'Nữ', 'cty', 'matkhau24', 'K004'),
('NV017', N'Đinh Văn Z', '1994-04-04', N'120 Trần Quốc Thảo, Q3', '012345678925', '0925678901', N'Hộ lý', N'Nam', 'dvz', 'matkhau25', 'K005'),
('NV018', N'Nguyễn Thị A1', '1991-01-01', N'01 Nguyễn Trãi, Q1', '012345678926', '0931234567', N'Y tá', N'Nữ', 'nta1', 'matkhau26', 'K001'),
('BS009', N'Lê Văn B2', '1980-02-02', N'02 Trần Hưng Đạo, Q5', '012345678927', '0932345678', N'Bác sĩ', N'Nam', 'lvb2', 'matkhau27', 'K002'),
('NV019', N'Phạm Thị C3', '1992-03-03', N'03 Lý Tự Trọng, Q3', '012345678928', '0933456789', N'Điều dưỡng', N'Nữ', 'ptc3', 'matkhau28', 'K003'),
('NV020', N'Trần Văn D4', '1985-04-04', N'04 Pasteur, Q1', '012345678929', '0934567890', N'Y sĩ', N'Nam', 'tvd4', 'matkhau29', 'K004'),
('NV021', N'Hoàng Thị E5', '1993-05-05', N'05 Nguyễn Huệ, Q10', '012345678930', '0935678901', N'Hộ lý', N'Nữ', 'hte5', 'matkhau30', 'K005'),
('BS010', N'Vũ Văn F6', '1982-06-06', N'06 Điện Biên Phủ, Q.BT', '012345678931', '0936789012', N'Bác sĩ', N'Nam', 'vvf6', 'matkhau31', 'K001'),
('NV022', N'Đoàn Thị G7', '1994-07-07', N'07 Hoàng Sa, Q3', '012345678932', '0937890123', N'Y tá', N'Nữ', 'dtg7', 'matkhau32', 'K002'),
('NV023', N'Ngô Văn H8', '1990-08-08', N'08 Cách Mạng Tháng 8, Q10', '012345678933', '0938901234', N'Điều dưỡng', N'Nam', 'nvh8', 'matkhau33', 'K003'),
('BS011', N'Phan Thị I9', '1987-09-09', N'09 Nguyễn Văn Cừ, Q5', '012345678934', '0939012345', N'Bác sĩ', N'Nữ', 'pti9', 'matkhau34', 'K004'),
('NV024', N'Lâm Văn J0', '1995-10-10', N'10 Trần Quốc Thảo, Q3', '012345678935', '0940123456', N'Hộ lý', N'Nam', 'lvj0', 'matkhau35', 'K005'),
('BS012', N'Tạ Thị K1', '1981-11-11', N'11 Lê Văn Sỹ, Q.Phú Nhuận', '012345678936', '0941234567', N'Bác sĩ xét nghiệm', N'Nữ', 'ttk1', 'matkhau36', 'K001'),
('NV025', N'Hồ Văn L2', '1996-12-12', N'12 Đinh Tiên Hoàng, Q1', '012345678937', '0942345678', N'Y tá', N'Nam', 'hvl2', 'matkhau37', 'K002'),
('NV026', N'Tống Thị M3', '1993-01-13', N'13 Nguyễn Đình Chiểu, Q3', '012345678938', '0943456789', N'Y sĩ', N'Nữ', 'ttm3', 'matkhau38', 'K003'),
('BS013', N'Cao Văn N4', '1986-02-14', N'14 Phạm Văn Đồng, Q.Thủ Đức', '012345678939', '0944567890', N'Bác sĩ', N'Nam', 'cvn4', 'matkhau39', 'K004'),
('NV027', N'Lê Thị O5', '1994-03-15', N'15 Võ Thị Sáu, Q3', '012345678940', '0945678901', N'Điều dưỡng', N'Nữ', 'lto5', 'matkhau40', 'K005'),
('NV028', N'Nguyễn Văn P6', '1989-04-16', N'16 Phạm Hồng Thái, Q1', '012345678941', '0946789012', N'Hộ lý', N'Nam', 'nvp6', 'matkhau41', 'K001'),
('BS014', N'Lý Thị Q7', '1985-05-17', N'17 Cộng Hòa, Q.Tân Bình', '012345678942', '0947890123', N'Bác sĩ', N'Nữ', 'ltq7', 'matkhau42', 'K002'),
('NV029', N'Trương Văn R8', '1991-06-18', N'18 Nguyễn Trọng Tuyển, Q.PN', '012345678943', '0948901234', N'Y tá', N'Nam', 'tvr8', 'matkhau43', 'K003'),
('NV030', N'Phạm Thị S9', '1997-07-19', N'19 Nguyễn Thượng Hiền, Q3', '012345678944', '0949012345', N'Y sĩ', N'Nữ', 'pts9', 'matkhau44', 'K004'),
('BS015', N'Tô Văn T0', '1983-08-20', N'20 Đinh Công Tráng, Q1', '012345678945', '0950123456', N'Bác sĩ xét nghiệm', N'Nam', 'tvt0', 'matkhau45', 'K005'),
('NV031', N'Nguyễn Thị U1', '1991-01-21', N'21 Nguyễn Trãi, Q5', '012345678946', '0951234567', N'Y tá', N'Nữ', 'ntu1', 'matkhau46', 'K001'),
('BS016', N'Đào Văn V2', '1980-02-22', N'22 Trần Hưng Đạo, Q1', '012345678947', '0952345678', N'Bác sĩ', N'Nam', 'dvv2', 'matkhau47', 'K002'),
('NV032', N'Lê Thị W3', '1992-03-23', N'23 Lý Tự Trọng, Q3', '012345678948', '0953456789', N'Điều dưỡng', N'Nữ', 'ltw3', 'matkhau48', 'K003'),
('NV033', N'Phạm Văn X4', '1985-04-24', N'24 Pasteur, Q3', '012345678949', '0954567890', N'Y sĩ', N'Nam', 'pvx4', 'matkhau49', 'K004'),
('NV034', N'Trương Thị Y5', '1993-05-25', N'25 Nguyễn Huệ, Q10', '012345678950', '0955678901', N'Hộ lý', N'Nữ', 'tty5', 'matkhau50', 'K005'),
('BS017', N'Hà Văn Z6', '1982-06-26', N'26 Điện Biên Phủ, Q.BT', '012345678951', '0956789012', N'Bác sĩ', N'Nam', 'hvz6', 'matkhau51', 'K001'),
('NV035', N'Đinh Thị A7', '1994-07-27', N'27 Hoàng Sa, Q1', '012345678952', '0957890123', N'Y tá', N'Nữ', 'dta7', 'matkhau52', 'K002'),
('NV036', N'Cao Văn B8', '1990-08-28', N'28 CMT8, Q10', '012345678953', '0958901234', N'Điều dưỡng', N'Nam', 'cvb8', 'matkhau53', 'K003'),
('BS018', N'Tống Thị C9', '1987-09-29', N'29 Nguyễn Văn Cừ, Q5', '012345678954', '0959012345', N'Bác sĩ', N'Nữ', 'ttc9', 'matkhau54', 'K004'),
('NV037', N'Lâm Văn D0', '1995-10-30', N'30 Trần Quốc Thảo, Q3', '012345678955', '0960123456', N'Hộ lý', N'Nam', 'lvd0', 'matkhau55', 'K005'),
('BS019', N'Nguyễn Thị E1', '1981-11-11', N'31 Lê Văn Sỹ, Q.PN', '012345678956', '0961234567', N'Bác sĩ xét nghiệm', N'Nữ', 'nte1', 'matkhau56', 'K001'),
('NV038', N'Hồ Văn F2', '1996-12-12', N'32 Đinh Tiên Hoàng, Q1', '012345678957', '0962345678', N'Y tá', N'Nam', 'hvf2', 'matkhau57', 'K002'),
('NV039', N'Phan Thị G3', '1993-01-13', N'33 Nguyễn Đình Chiểu, Q3', '012345678958', '0963456789', N'Y sĩ', N'Nữ', 'ptg3', 'matkhau58', 'K003'),
('BS020', N'Cao Văn H4', '1986-02-14', N'34 Phạm Văn Đồng, Q.Thủ Đức', '012345678959', '0964567890', N'Bác sĩ', N'Nam', 'cvh4', 'matkhau59', 'K004'),
('NV040', N'Võ Thị I5', '1994-03-15', N'35 Võ Thị Sáu, Q3', '012345678960', '0965678901', N'Điều dưỡng', N'Nữ', 'vti5', 'matkhau60', 'K005'),
('NV041', N'Nguyễn Văn J6', '1989-04-16', N'36 Phạm Hồng Thái, Q1', '012345678961', '0966789012', N'Hộ lý', N'Nam', 'nvj6', 'matkhau61', 'K001'),
('BS021', N'Lý Thị K7', '1985-05-17', N'37 Cộng Hòa, Q.Tân Bình', '012345678962', '0967890123', N'Bác sĩ', N'Nữ', 'ltk7', 'matkhau62', 'K002'),
('NV042', N'Trần Văn L8', '1991-06-18', N'38 Nguyễn Trọng Tuyển, Q.PN', '012345678963', '0968901234', N'Y tá', N'Nam', 'tvl8', 'matkhau63', 'K003'),
('NV043', N'Phạm Thị M9', '1997-07-19', N'39 Nguyễn Thượng Hiền, Q3', '012345678964', '0969012345', N'Y sĩ', N'Nữ', 'ptm9', 'matkhau64', 'K004'),
('BS022', N'Tô Văn N0', '1983-08-20', N'40 Đinh Công Tráng, Q1', '012345678965', '0970123456', N'Bác sĩ xét nghiệm', N'Nam', 'tvn0', 'matkhau65', 'K005'),
('NV044', N'Nguyễn Thị O1', '1990-01-01', N'41 Nguyễn Trãi, Q5', '012345678966', '0971234567', N'Y tá', N'Nữ', 'nto1', 'matkhau66', 'K001'),
('BS023', N'Trần Văn P2', '1981-02-02', N'42 Trần Hưng Đạo, Q1', '012345678967', '0972345678', N'Bác sĩ', N'Nam', 'tvp2', 'matkhau67', 'K002'),
('NV045', N'Lê Thị Q3', '1992-03-03', N'43 Lý Tự Trọng, Q3', '012345678968', '0973456789', N'Điều dưỡng', N'Nữ', 'ltq3', 'matkhau68', 'K003'),
('NV046', N'Phạm Văn R4', '1986-04-04', N'44 Pasteur, Q3', '012345678969', '0974567890', N'Y sĩ', N'Nam', 'pvr4', 'matkhau69', 'K004'),
('NV047', N'Trương Thị S5', '1993-05-05', N'45 Nguyễn Huệ, Q10', '012345678970', '0975678901', N'Hộ lý', N'Nữ', 'tts5', 'matkhau70', 'K005'),
('BS024', N'Hà Văn T6', '1982-06-06', N'46 Điện Biên Phủ, Q.BT', '012345678971', '0976789012', N'Bác sĩ', N'Nam', 'hvt6', 'matkhau71', 'K001'),
('NV048', N'Đinh Thị U7', '1994-07-07', N'47 Hoàng Sa, Q1', '012345678972', '0977890123', N'Y tá', N'Nữ', 'dtu7', 'matkhau72', 'K002'),
('NV049', N'Cao Văn V8', '1990-08-08', N'48 CMT8, Q10', '012345678973', '0978901234', N'Điều dưỡng', N'Nam', 'cvv8', 'matkhau73', 'K003'),
('BS025', N'Tống Thị W9', '1987-09-09', N'49 Nguyễn Văn Cừ, Q5', '012345678974', '0979012345', N'Bác sĩ', N'Nữ', 'ttw9', 'matkhau74', 'K004'),
('NV050', N'Lâm Văn X0', '1995-10-10', N'50 Trần Quốc Thảo, Q3', '012345678975', '0980123456', N'Hộ lý', N'Nam', 'lvx0', 'matkhau75', 'K005'),
('BS026', N'Nguyễn Thị Y1', '1981-11-11', N'51 Lê Văn Sỹ, Q.PN', '012345678976', '0981234567', N'Bác sĩ xét nghiệm', N'Nữ', 'nty1', 'matkhau76', 'K001'),
('NV051', N'Hồ Văn Z2', '1996-12-12', N'52 Đinh Tiên Hoàng, Q1', '012345678977', '0982345678', N'Y tá', N'Nam', 'hvz2', 'matkhau77', 'K002'),
('NV052', N'Phan Thị A3', '1993-01-13', N'53 Nguyễn Đình Chiểu, Q3', '012345678978', '0983456789', N'Y sĩ', N'Nữ', 'pta3', 'matkhau78', 'K003'),
('BS027', N'Cao Văn B4', '1986-02-14', N'54 Phạm Văn Đồng, Q.Thủ Đức', '012345678979', '0984567890', N'Bác sĩ', N'Nam', 'cvb4', 'matkhau79', 'K004'),
('NV053', N'Võ Thị C5', '1994-03-15', N'55 Võ Thị Sáu, Q3', '012345678980', '0985678901', N'Điều dưỡng', N'Nữ', 'vtc5', 'matkhau80', 'K005'),
('NV054', N'Nguyễn Văn D6', '1989-04-16', N'56 Phạm Hồng Thái, Q1', '012345678981', '0986789012', N'Hộ lý', N'Nam', 'nvd6', 'matkhau81', 'K001'),
('BS028', N'Lý Thị E7', '1985-05-17', N'57 Cộng Hòa, Q.Tân Bình', '012345678982', '0987890123', N'Bác sĩ', N'Nữ', 'lte7', 'matkhau82', 'K002'),
('NV055', N'Trần Văn F8', '1991-06-18', N'58 Nguyễn Trọng Tuyển, Q.PN', '012345678983', '0988901234', N'Y tá', N'Nam', 'tvf8', 'matkhau83', 'K003'),
('NV056', N'Phạm Thị G9', '1997-07-19', N'59 Nguyễn Thượng Hiền, Q3', '012345678984', '0989012345', N'Y sĩ', N'Nữ', 'ptg9', 'matkhau84', 'K004'),
('BS029', N'Tô Văn H0', '1983-08-20', N'60 Đinh Công Tráng, Q1', '012345678985', '0990123456', N'Bác sĩ xét nghiệm', N'Nam', 'tvh0', 'matkhau85', 'K005');



INSERT INTO BenhNhan (
    MaBN, CCCD, HoTen, NgaySinh, GTinh, NgheNghiep, DanToc, NgoaiKieu, DiaChi,
    NoiLamViec, DoiTuong, SoBHYT, GitriBHYT, HoTenNTNhan, DiaChiNT, SDTNTNhan,
    MatKhau, STT, TrieuChung, Khoa, TaiKham, TgKham, ngayTao
)
VALUES
('BN001', '123456789001', N'Nguyễn Văn Phúc', '1990-01-01', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'123 Lê Lợi, Q1',
 N'Công ty ABC', N'BHYT', 'SV123456789', '2025-12-31', N'Trần Thị Mai', N'456 Nguyễn Trãi', '0909123456',
 'mkbn001', 1001, N'Sốt cao', N'K001', N'Có', '2025-04-01', '2025-01-01'),

('BN002', '123456789002', N'Trần Thị Hạnh', '1985-05-20', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'78 Lý Thường Kiệt, Q3',
 N'Trường THCS X', N'BHYT', 'SV123456790', '2025-10-30', N'Ngô Văn Minh', N'789 Trần Hưng Đạo', '0909876543',
 'mkbn002', 2002, N'Đau đầu', N'K002', N'Không', '2025-04-02','2025-01-01'),

('BN003', '123456789003', N'Lê Văn Huy', '2000-09-09', N'Nam', N'Sinh viên', N'Kinh', NULL, N'45 Đinh Tiên Hoàng, Q5',
 N'Đại học Y', N'BHYT', 'SV123456791', '2026-01-01', N'Phạm Thị Tuyết', N'12 Lê Văn Sỹ', '0912123456',
 'mkbn003', 2003, N'Nôn ói', N'K003', N'Có', '2025-04-03', '2025-01-01'),

('BN004', '123456789004', N'Hoàng Thị Mai', '1978-12-12', N'Nữ', N'Nội trợ', N'Kinh', NULL, N'67 CMT8, Q10',
 N'Nhà riêng', N'BHYT', 'SV123456792', '2025-11-15', N'Nguyễn Văn Hùng', N'34 Nguyễn Du', '0912987654',
 'mkbn004', 1004, N'Mất ngủ', N'K004', N'Không', '2025-04-04', '2025-02-02'),

('BN005', '123456789005', N'Phạm Văn Hòa', '1995-03-15', N'Nam', N'Lái xe', N'Kinh', NULL, N'23 Phan Đình Phùng, Q1',
 N'Công ty J', N'BHYT', 'SV123456793', '2025-09-20', N'Vũ Thị Hoa', N'88 Hùng Vương', '0909999888',
 'mkbn005', 1005, N'Tiêu chảy', N'K005', N'Có', '2025-04-05', '2025-02-02'),

('BN006', '123456789006', N'Đặng Thị Lan', '1988-08-08', N'Nữ', N'Nhân viên văn phòng', N'Kinh', NULL, N'34 Hai Bà Trưng, Q1',
 N'Công ty Z', N'BHYT', 'SV123456794', '2025-11-30', N'Trần Văn Nam', N'56 Bạch Đằng', '0908123456',
 'mkbn006', 1006, N'Viêm họng', N'K001', N'Không', '2025-04-06', '2025-03-03'),

('BN007', '123456789007', N'Lý Văn Hùng', '1992-06-12', N'Nam', N'Công nhân', N'Kinh', NULL, N'90 Nguyễn Văn Cừ, Q5',
 N'Công ty C', N'BHYT', 'SV123456795', '2025-08-25', N'Lê Thị Thủy', N'77 Điện Biên Phủ', '0907345678',
 'mkbn007', 2007, N'Đau bụng', N'K002', N'Không', '2025-04-07', '2025-04-04'),

('BN008', '123456789008', N'Ngô Thị Hương', '1999-11-11', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'112 Tôn Đức Thắng, Q3',
 N'ĐH Bách Khoa', N'BHYT', 'SV123456796', '2026-01-01', N'Nguyễn Văn Long', N'101 Trần Não', '0913456789',
 'mkbn008', 1008, N'Chóng mặt', N'K003', N'Có', '2025-04-08', '2025-04-04'),

('BN009', '123456789009', N'Trịnh Văn Toàn', '1970-10-10', N'Nam', N'Bác sĩ', N'Kinh', NULL, N'200 Nam Kỳ Khởi Nghĩa, Q1',
 N'BV Nhân Dân', N'BHYT', 'SV123456797', '2026-06-30', N'Trịnh Thị Dung', N'10 Trần Phú', '0908765432',
 'mkbn009', 1009, N'Khó thở', N'K004', N'Không', '2025-04-09', '2025-05-05'),

('BN010', '123456789010', N'Võ Thị Minh', '1983-07-23', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'65 Phạm Văn Đồng, Q2',
 N'Trường MN Hoa Mai', N'BHYT', 'SV123456798', '2025-07-15', N'Nguyễn Văn Phát', N'4 Pasteur', '0919876543',
 'mkbn010', 1010, N'Mẩn ngứa', N'K005', N'Có', '2025-04-10','2025-06-06'),

('BN011', '123456789011', N'Phạm Minh Quân', '1991-02-14', N'Nam', N'Nhân viên IT', N'Kinh', NULL, N'78 Nguyễn Thái Học, Q1',
 N'Công ty IT A', N'BHYT', 'SV123456799', '2026-01-10', N'Lê Thị Bích', N'123 Tạ Quang Bửu', '0901234567',
 'mkbn011', 2011, N'Rối loạn tiêu hóa', N'K003', N'Không', '2025-04-11', '2025-07-07'),

('BN012', '123456789012', N'Lê Thị Kim', '1996-05-18', N'Nữ', N'Nhân viên ngân hàng', N'Kinh', NULL, N'89 Võ Văn Tần, Q3',
 N'Ngân hàng Y', N'BHYT', 'SV123456800', '2026-02-20', N'Lê Văn Hoàng', N'199 Cách Mạng Tháng 8', '0919988776',
 'mkbn012', 1012, N'Đau ngực', N'K002', N'Có', '2025-04-12', '2025-08-08'),

('BN013', '123456789013', N'Nguyễn Hữu Tài', '1989-04-04', N'Nam', N'Tài xế', N'Kinh', NULL, N'11 Phan Văn Trị, Q5',
 N'Công ty vận tải B', N'BHYT', 'SV123456801', '2025-12-01', N'Nguyễn Thị Liên', N'88 Lý Chính Thắng', '0901234987',
 'mkbn013', 2013, N'Đau lưng', N'K004', N'Không', '2025-04-13', '2025-08-08'),

('BN014', '123456789014', N'Huỳnh Thị Nga', '1997-01-01', N'Nữ', N'Kế toán', N'Kinh', NULL, N'54 Hoàng Hoa Thám, Q3',
 N'Công ty Tài chính Z', N'BHYT', 'SV123456802', '2026-03-15', N'Phạm Văn Phúc', N'22 Trương Định', '0911122334',
 'mkbn014', 1014, N'Mất vị giác', N'K005', N'Có', '2025-04-14', '2025-09-09'),

('BN015', '123456789015', N'Vũ Văn Dũng', '1986-09-09', N'Nam', N'Giám đốc', N'Kinh', NULL, N'23 Lý Thường Kiệt, Q1',
 N'Công ty Đầu tư ABC', N'BHYT', 'SV123456803', '2026-01-30', N'Nguyễn Thị Hạnh', N'45 Trần Quốc Toản', '0909876543',
 'mkbn015', 1015, N'Ho, sốt', N'K001', N'Không', '2025-04-15', '2025-10-10'),

('BN016', '123456789016', N'Nguyễn Thị Thu', '1993-11-21', N'Nữ', N'Bác sĩ', N'Kinh', NULL, N'67 Nguyễn Du, Q1',
 N'BV Phụ sản', N'BHYT', 'SV123456804', '2026-04-01', N'Trần Văn Bình', N'98 Nguyễn Huệ', '0912345678',
 'mkbn016', 1016, N'Viêm phổi', N'K002', N'Có', '2025-04-16', '2025-10-10'),

('BN017', '123456789017', N'Phan Văn Hoàng', '1990-12-30', N'Nam', N'Nhân viên', N'Kinh', NULL, N'89 Phan Chu Trinh, Q5',
 N'Công ty X', N'BHYT', 'SV123456805', '2025-12-31', N'Lê Thị Hương', N'56 Bùi Viện', '0901122334',
 'mkbn017', 2017, N'Đau đầu', N'K003', N'Không', '2025-04-17', '2025-11-11'),

('BN018', '123456789018', N'Trần Thị Bích', '1998-07-07', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'45 Nguyễn Trãi, Q3',
 N'ĐH Kinh tế', N'BHYT', 'SV123456806', '2026-05-01', N'Nguyễn Văn Quang', N'78 Trần Hưng Đạo', '0912123456',
 'mkbn018', 1018, N'Mệt mỏi', N'K004', N'Có', '2025-04-18', '2025-12-12'),

('BN019', '123456789019', N'Đỗ Văn Nam', '1987-03-03', N'Nam', N'Công nhân', N'Kinh', NULL, N'67 Lê Lợi, Q1',
 N'Công ty D', N'BHYT', 'SV123456807', '2025-11-30', N'Phạm Thị Hồng', N'34 Nguyễn Huệ', '0909988776',
 'mkbn019', 1019, N'Đau bụng', N'K005', N'Không', '2025-04-19', '2025-12-12'),

('BN020', '123456789020', N'Nguyễn Thị Lan', '1994-08-08', N'Nữ', N'Nhân viên bán hàng', N'Kinh', NULL, N'78 Hai Bà Trưng, Q3',
 N'Cửa hàng thời trang', N'BHYT', 'SV123456808', '2026-02-15', N'Nguyễn Văn Hòa', N'90 Lý Thường Kiệt', '0913456789',
 'mkbn020', 1020, N'Ho', N'K001', N'Có', '2025-04-20', '2025-12-12'),

('BN021', '123456789021', N'Hồ Văn Đức', '1979-07-07', N'Nam', N'Kỹ thuật viên', N'Kinh', NULL, N'99 Lê Hồng Phong, Q.10',
 N'Cty Điện máy ABC', N'BHYT', 'SV123456808', '2026-03-31', N'Phạm Thị Hạnh', N'66 Điện Biên Phủ', '0915667788',
 'mkbn021', 2021, N'Suy nhược cơ thể', N'K001', N'Có', '2025-04-20', '2025-12-02'),

('BN022', '123456789022', N'Đặng Thị Hòa', '1993-10-10', N'Nữ', N'Sale Marketing', N'Kinh', NULL, N'33 Nguyễn Trãi, Q.5',
 N'Công ty Quảng cáo XYZ', N'BHYT', 'SV123456809', '2026-06-30', N'Nguyễn Quốc Bảo', N'57 Trần Não', '0901122333',
 'mkbn022', 2022, N'Viêm xoang', N'K002', N'Không', '2025-04-21', '2025-05-02'),

('BN023', '123456789023', N'Tống Văn Hòa', '1984-04-22', N'Nam', N'Tài xế xe tải', N'Kinh', NULL, N'75 Âu Cơ, Q.Tân Bình',
 N'Công ty vận tải Hưng Thịnh', N'BHYT', 'SV123456810', '2026-04-15', N'Tống Thị Lan', N'10 Hoàng Sa', '0912444555',
 'mkbn023', 1023, N'Mệt mỏi kéo dài', N'K003', N'Có', '2025-04-22', '2025-05-02'),

('BN024', '123456789024', N'Lý Thị Ngọc', '1998-09-30', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'22 Nguyễn Thị Minh Khai, Q1',
 N'Đại học Kinh tế', N'BHYT', 'SV123456811', '2026-12-01', N'Lý Văn Hậu', N'35 Phan Văn Hớn', '0907766554',
 'mkbn024', 2024, N'Sốt siêu vi', N'K004', N'Không', '2025-04-23', '2025-05-03'),

('BN025', '123456789025', N'Nguyễn Văn Khoa', '1981-01-25', N'Nam', N'Trưởng phòng nhân sự', N'Kinh', NULL, N'12 Đặng Văn Bi, Q.Thủ Đức',
 N'Công ty TNHH Hưng Phát', N'BHYT', 'SV123456812', '2026-08-31', N'Nguyễn Thị Huệ', N'80 Nguyễn Thị Nhỏ', '0909988111',
 'mkbn025', 1025, N'Cảm lạnh thông thường', N'K005', N'Có', '2025-04-24', '2025-05-04'),

 ('BN026', '123456789026', N'Trịnh Văn Bình', '1985-02-20', N'Nam', N'Công an', N'Kinh', NULL, N'25 Đinh Bộ Lĩnh, Q.Bình Thạnh',
 N'Công an TP', N'BHYT', 'SV123456813', '2026-05-15', N'Trịnh Thị Hồng', N'30 Nguyễn Du', '0912999888',
 'mkbn026', 1026, N'Say nắng', N'K001', N'Không', '2025-04-25', '2025-05-04'),

('BN027', '123456789027', N'Lê Văn Sơn', '1991-06-12', N'Nam', N'Kế toán', N'Kinh', NULL, N'47 Nguyễn Khoái, Q.4',
 N'Công ty XD Thành Công', N'BHYT', 'SV123456814', '2026-11-20', N'Lê Thị Yến', N'88 Phạm Ngũ Lão', '0908777666',
 'mkbn027', 2027, N'Đau đầu', N'K002', N'Có', '2025-04-26', '2025-05-05'),

('BN028', '123456789028', N'Tạ Thị Hà', '1989-03-08', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'56 Đoàn Văn Bơ, Q.4',
 N'Trường THCS Tân Phong', N'BHYT', 'SV123456815', '2026-10-01', N'Tạ Văn Minh', N'22 Nguyễn Hữu Cảnh', '0913555777',
 'mkbn028', 1028, N'Viêm họng', N'K003', N'Không', '2025-04-27','2025-05-06'),

('BN029', '123456789029', N'Hoàng Văn Phúc', '1978-09-14', N'Nam', N'Thợ điện', N'Kinh', NULL, N'12 Trần Quang Diệu, Q.3',
 N'Cty Điện lạnh Ánh Dương', N'BHYT', 'SV123456816', '2026-09-01', N'Hoàng Thị Nhàn', N'10 Nguyễn Văn Cừ', '0912333444',
 'mkbn029', 2029, N'Đau vai gáy', N'K004', N'Có', '2025-04-28', '2025-05-07'),

('BN030', '123456789030', N'Phan Thị Quỳnh', '1997-01-11', N'Nữ', N'Lập trình viên', N'Kinh', NULL, N'134 Lý Thường Kiệt, Q.10',
 N'Cty Phần mềm ABC', N'BHYT', 'SV123456817', '2026-03-10', N'Phan Văn Hòa', N'45 Nguyễn Thiện Thuật', '0908123456',
 'mkbn030', 1030, N'Đau bụng', N'K005', N'Không', '2025-04-29', '2025-05-07'),

('BN031', '123456789031', N'Ngô Văn Hưng', '1995-05-25', N'Nam', N'Bác sĩ', N'Kinh', NULL, N'14 Nguyễn Văn Trỗi, Q.Phú Nhuận',
 N'BV Chợ Rẫy', N'BHYT', 'SV123456818', '2026-06-01', N'Ngô Thị Mai', N'18 Huỳnh Văn Bánh', '0918112233',
 'mkbn031', 2031, N'Mất ngủ', N'K001', N'Có', '2025-04-30', '2025-05-08'),

('BN032', '123456789032', N'Trần Thị Diễm', '1990-04-18', N'Nữ', N'Thu ngân', N'Kinh', NULL, N'99 Hòa Hưng, Q.10',
 N'Siêu thị CoopMart', N'BHYT', 'SV123456819', '2026-08-20', N'Trần Văn Lợi', N'52 Nguyễn Biểu', '0908333444',
 'mkbn032', 1032, N'Đau bụng dưới', N'K002', N'Không', '2025-05-01', '2025-05-08'),

('BN033', '123456789033', N'Hà Văn Tùng', '1983-07-09', N'Nam', N'Thiết kế đồ họa', N'Kinh', NULL, N'42 Nguyễn Văn Cừ, Q.5',
 N'Cty Truyền thông H3', N'BHYT', 'SV123456820', '2026-04-22', N'Hà Thị Hoa', N'100 Hùng Vương', '0911445566',
 'mkbn033', 1033, N'Đau dạ dày', N'K003', N'Có', '2025-05-02', '2025-05-08'),

('BN034', '123456789034', N'Doãn Thị Kim', '1988-12-22', N'Nữ', N'Nhân viên hành chính', N'Kinh', NULL, N'10 Tản Đà, Q.5',
 N'Công ty TNHH PNC', N'BHYT', 'SV123456821', '2026-12-31', N'Doãn Văn Quang', N'45 Nguyễn Trãi', '0908001223',
 'mkbn034', 2034, N'Cảm cúm', N'K004', N'Không', '2025-05-03','2025-05-09'),

('BN035', '123456789035', N'Lâm Văn Cường', '1992-08-03', N'Nam', N'Tài xế công nghệ', N'Kinh', NULL, N'21 Hoàng Diệu, Q.4',
 N'Grab', N'BHYT', 'SV123456822', '2026-05-30', N'Lâm Thị Bé', N'9 Phan Đăng Lưu', '0913667788',
 'mkbn035', 1035, N'Sốt cao', N'K005', N'Có', '2025-05-04', '2025-05-09'),

 ('BN036', '123456789036', N'Nguyễn Quốc An', '1986-03-14', N'Nam', N'Tài xế', N'Kinh', NULL, N'61 Nguyễn Đình Chiểu, Q.3',
 N'Cty Vận tải Hòa Bình', N'BHYT', 'SV123456823', '2026-07-01', N'Nguyễn Thị Tươi', N'20 Lê Hồng Phong', '0909345123',
 'mkbn036', 2036, N'Đau đầu', N'K001', N'Có', '2025-05-05', '2025-05-10'),

('BN037', '123456789037', N'Phạm Văn Đức', '1975-12-01', N'Nam', N'Công nhân', N'Kinh', NULL, N'18 Nguyễn Trãi, Q.5',
 N'Cty May Việt Tiến', N'BHYT', 'SV123456824', '2026-10-01', N'Phạm Thị Hằng', N'19 Lý Tự Trọng', '0911223344',
 'mkbn037', 2037, N'Ho kéo dài', N'K002', N'Không', '2025-05-06', '2025-05-11'),

('BN038', '123456789038', N'Lê Thị Hòa', '1990-09-30', N'Nữ', N'Y tá', N'Kinh', NULL, N'79 Lý Chính Thắng, Q.3',
 N'BV Nguyễn Tri Phương', N'BHYT', 'SV123456825', '2026-08-15', N'Lê Văn Bình', N'33 Trần Hưng Đạo', '0912334455',
 'mkbn038', 1038, N'Đau dạ dày', N'K003', N'Không', '2025-05-07', '2025-05-12'),

('BN039', '123456789039', N'Trần Văn Nhân', '1993-05-20', N'Nam', N'Bảo vệ', N'Kinh', NULL, N'45 Phạm Hùng, Q.8',
 N'Cty Bảo vệ 24H', N'BHYT', 'SV123456826', '2026-09-09', N'Trần Thị Minh', N'90 Cách Mạng Tháng 8', '0908771234',
 'mkbn039', 1039, N'Đau khớp', N'K004', N'Có', '2025-05-08', '2025-05-12'),

('BN040', '123456789040', N'Đinh Thị Như', '1996-04-25', N'Nữ', N'Nhân viên ngân hàng', N'Kinh', NULL, N'121 Nguyễn Thị Minh Khai, Q.1',
 N'Ngân hàng ACB', N'BHYT', 'SV123456827', '2026-10-10', N'Đinh Văn Tùng', N'55 Nguyễn Trãi', '0908999234',
 'mkbn040', 2040, N'Sốt nhẹ', N'K005', N'Không', '2025-05-09', '2025-05-13'),

('BN041', '123456789041', N'Vũ Văn Long', '1982-02-10', N'Nam', N'Thợ mộc', N'Kinh', NULL, N'29 Cộng Hòa, Q.Tân Bình',
 N'Xưởng Mộc Hưng Thịnh', N'BHYT', 'SV123456828', '2026-11-01', N'Vũ Thị Thanh', N'12 Tân Kỳ Tân Quý', '0912445566',
 'mkbn041', 1041, N'Đau thắt lưng', N'K001', N'Có', '2025-05-10', '2025-05-14'),

('BN042', '123456789042', N'Tống Thị Bích', '1987-07-14', N'Nữ', N'Thu ngân', N'Kinh', NULL, N'72 Phạm Văn Hai, Q.Tân Bình',
 N'Big C Tân Bình', N'BHYT', 'SV123456829', '2026-12-12', N'Tống Văn Đạt', N'33 Nguyễn Oanh', '0908123455',
 'mkbn042', 1042, N'Nôn ói', N'K002', N'Không', '2025-05-11', '2025-05-14'),

('BN043', '123456789043', N'Hoàng Văn Quân', '1998-11-23', N'Nam', N'Sinh viên', N'Kinh', NULL, N'34 Võ Thị Sáu, Q.1',
 N'Đại học Khoa học Tự nhiên', N'BHYT', 'SV123456830', '2026-07-20', N'Hoàng Thị Hà', N'61 Nguyễn Du', '0908777888',
 'mkbn043', 2043, N'Đau họng', N'K003', N'Không', '2025-05-12', '2025-05-14'),

('BN044', '123456789044', N'Mai Thị Thanh', '1994-06-02', N'Nữ', N'Bán hàng online', N'Kinh', NULL, N'86 Trường Sa, Q.3',
 N'Nhà riêng', N'BHYT', 'SV123456831', '2026-09-11', N'Mai Văn Lâm', N'67 Cô Giang', '0911334455',
 'mkbn044', 1044, N'Mệt mỏi', N'K004', N'Có', '2025-05-13', '2025-05-14'),

('BN045', '123456789045', N'Trịnh Công Hòa', '1977-03-03', N'Nam', N'Lái xe tải', N'Kinh', NULL, N'10 Tô Hiến Thành, Q.10',
 N'Cty vận tải Minh Long', N'BHYT', 'SV123456832', '2026-06-06', N'Trịnh Thị Lan', N'123 Cộng Hòa', '0909667788',
 'mkbn045', 2045, N'Sốt cao', N'K005', N'Không', '2025-05-14', '2025-05-15'),

 ('BN046', '123456789046', N'Nguyễn Mỹ Duyên', '1991-09-15', N'Nữ', N'Biên tập viên', N'Kinh', NULL, N'45 Nguyễn Gia Trí, Q.Bình Thạnh',
 N'Đài Truyền hình HTV', N'BHYT', 'SV123456833', '2026-07-01', N'Nguyễn Văn Đức', N'90 Điện Biên Phủ', '0918776655',
 'mkbn046', 1046, N'Đau vai gáy', N'K001', N'Có', '2025-05-15', '2025-05-15'),

('BN047', '123456789047', N'Đoàn Thị Hồng', '1984-01-01', N'Nữ', N'Chăm sóc khách hàng', N'Kinh', NULL, N'72 Nguyễn Xí, Q.Bình Thạnh',
 N'Cty FPT', N'BHYT', 'SV123456834', '2026-07-15', N'Đoàn Văn Quý', N'70 D2 Bình Thạnh', '0912345566',
 'mkbn047', 2047, N'Mất ngủ', N'K002', N'Không', '2025-05-16', '2025-05-16'),

('BN048', '123456789048', N'Phan Văn Kiệt', '1988-10-10', N'Nam', N'Thợ sửa xe', N'Kinh', NULL, N'15 Nguyễn Oanh, Q.Gò Vấp',
 N'Tiệm sửa xe 68', N'BHYT', 'SV123456835', '2026-05-10', N'Phan Thị Hường', N'78 Quang Trung', '0909887766',
 'mkbn048', 1048, N'Đau bụng', N'K003', N'Có', '2025-05-17', '2025-05-16'),

('BN049', '123456789049', N'Trương Thị Ngọc', '1993-08-18', N'Nữ', N'Kế toán', N'Kinh', NULL, N'99 Phan Văn Trị, Q.Gò Vấp',
 N'Cty Bảo hiểm Bảo Việt', N'BHYT', 'SV123456836', '2026-11-18', N'Trương Văn Hòa', N'15 Phan Văn Hớn', '0908111222',
 'mkbn049', 1049, N'Cảm cúm', N'K004', N'Không', '2025-05-18','2025-05-17'),

('BN050', '123456789050', N'Lý Văn An', '1990-12-30', N'Nam', N'Phụ hồ', N'Kinh', NULL, N'20 Nguyễn Ảnh Thủ, Hóc Môn',
 N'Công trình tư nhân', N'BHYT', 'SV123456837', '2026-12-01', N'Lý Thị Yến', N'92 Tô Ký', '0912446677',
 'mkbn050', 1050, N'Sốt siêu vi', N'K005', N'Có', '2025-05-19', '2025-05-18'),

('BN051', '123456789051', N'Phùng Văn Hòa', '1981-06-22', N'Nam', N'Thợ điện lạnh', N'Kinh', NULL, N'23 Nguyễn Văn Bảo, Gò Vấp',
 N'Điện lạnh Hòa Phát', N'BHYT', 'SV123456838', '2026-09-09', N'Phùng Thị Lan', N'45 Tân Sơn Nhì', '0908667788',
 'mkbn051', 2051, N'Chóng mặt', N'K001', N'Không', '2025-05-20', '2025-05-19'),

('BN052', '123456789052', N'Võ Thị Tuyết', '1996-11-11', N'Nữ', N'Nhân viên bán hàng', N'Kinh', NULL, N'10 Phan Văn Hớn, Q.12',
 N'VinMart Q.12', N'BHYT', 'SV123456839', '2026-10-10', N'Võ Văn Duy', N'30 Hà Huy Giáp', '0912448899',
 'mkbn052', 2052, N'Đau lưng', N'K002', N'Có', '2025-05-21', '2025-05-20'),

('BN053', '123456789053', N'Huỳnh Văn Cường', '1980-03-09', N'Nam', N'Thợ sửa máy', N'Kinh', NULL, N'55 Tô Ký, Q.12',
 N'Tiệm máy Huỳnh Cường', N'BHYT', 'SV123456840', '2026-07-07', N'Huỳnh Thị Hồng', N'22 Hà Huy Giáp', '0909776655',
 'mkbn053', 2053, N'Viêm phế quản', N'K003', N'Không', '2025-05-22', '2025-05-20'),

('BN054', '123456789054', N'Hồ Ngọc Mai', '1997-04-14', N'Nữ', N'Chuyên viên Marketing', N'Kinh', NULL, N'76 Phạm Văn Chiêu, Gò Vấp',
 N'Cty Quảng Cáo Sky', N'BHYT', 'SV123456841', '2026-12-30', N'Hồ Văn Tài', N'12 Quang Trung', '0908991122',
 'mkbn054', 1054, N'Đau họng', N'K004', N'Không', '2025-05-23', '2025-05-21'),

('BN055', '123456789055', N'Tạ Văn Dũng', '1992-01-07', N'Nam', N'Giáo viên thể dục', N'Kinh', NULL, N'21 Lê Đức Thọ, Gò Vấp',
 N'Trường THPT Nguyễn Du', N'BHYT', 'SV123456842', '2026-08-10', N'Tạ Thị Thảo', N'78 Nguyễn Văn Nghi', '0912668899',
 'mkbn055', 1055, N'Sổ mũi', N'K005', N'Có', '2025-05-24', '2025-05-22'),

 ('BN056', '123456789051', N'Đặng Thị Kim Ngân', '1985-06-11', N'Nữ', N'Nhân viên bán hàng', N'Kinh', NULL, N'75 Trần Khắc Chân, Q.1',
 N'Siêu thị Coopmart', N'BHYT', 'SV123456838', '2026-11-01', N'Đặng Văn Lợi', N'90 Nguyễn Văn Thủ', '0908997887',
 'mkbn051', 2056, N'Đau đầu', N'K001', N'Không', '2025-05-20', '2025-05-22'),

('BN057', '123456789052', N'Ngô Văn Hiếu', '1978-08-08', N'Nam', N'Bác tài', N'Kinh', NULL, N'88 Điện Biên Phủ, Q.Bình Thạnh',
 N'GrabCar', N'BHYT', 'SV123456839', '2026-12-31', N'Ngô Thị Hòa', N'42 Lê Quang Định', '0912667788',
 'mkbn052', 1057, N'Tức ngực', N'K002', N'Có', '2025-05-21', '2025-05-23'),

('BN058', '123456789053', N'Trần Hồng Sơn', '1992-04-22', N'Nam', N'Kỹ thuật viên', N'Kinh', NULL, N'15 Nguyễn Cư Trinh, Q.1',
 N'Cty TNHH Công nghệ MTech', N'BHYT', 'SV123456840', '2026-09-01', N'Trần Ngọc Thảo', N'31 Nguyễn Huệ', '0912333444',
 'mkbn053', 1058, N'Sốt nhẹ', N'K003', N'Không', '2025-05-22', '2025-05-24'),

('BN059', '123456789054', N'Lê Thị Bích Thủy', '1995-03-18', N'Nữ', N'Nhân viên ngân hàng', N'Kinh', NULL, N'30 Trần Hưng Đạo, Q.5',
 N'Ngân hàng BIDV', N'BHYT', 'SV123456841', '2026-08-15', N'Lê Văn Quang', N'20 Phạm Ngọc Thạch', '0908776665',
 'mkbn054', 2059, N'Mất ngủ', N'K004', N'Không', '2025-05-23', '2025-05-25'),

('BN060', '123456789055', N'Võ Văn Tài', '1983-11-05', N'Nam', N'Trợ lý luật sư', N'Kinh', NULL, N'49 Nguyễn Đình Chiểu, Q.3',
 N'Văn phòng Luật Hưng Phát', N'BHYT', 'SV123456842', '2026-07-10', N'Võ Thị Nga', N'56 Cao Thắng', '0911223344',
 'mkbn055', 2060, N'Đau bụng', N'K005', N'Có', '2025-05-24', '2025-05-25'),

('BN061', '123456789056', N'Phạm Quang Hưng', '1989-02-28', N'Nam', N'Giáo viên', N'Kinh', NULL, N'87 Lê Duẩn, Q.1',
 N'Trường THPT Lê Quý Đôn', N'BHYT', 'SV123456843', '2026-06-20', N'Phạm Thị Hồng', N'91 Võ Văn Tần', '0908111555',
 'mkbn056', 2061, N'Ho khan', N'K001', N'Không', '2025-05-25', '2025-05-25'),

('BN062', '123456789057', N'Huỳnh Thị Ánh', '1997-10-12', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'62 Trần Bình Trọng, Q.5',
 N'Đại học Y Dược TP.HCM', N'BHYT', 'SV123456844', '2026-07-22', N'Huỳnh Văn Bình', N'63 Nguyễn Trãi', '0912998877',
 'mkbn057', 1062, N'Mệt mỏi', N'K002', N'Không', '2025-05-26', '2025-05-26'),

('BN063', '123456789058', N'Đỗ Văn Thịnh', '1990-01-17', N'Nam', N'Công nhân cơ khí', N'Kinh', NULL, N'50 Nguyễn Văn Linh, Q.7',
 N'Cty Cơ khí Thành Đạt', N'BHYT', 'SV123456845', '2026-10-05', N'Đỗ Thị Hường', N'70 Tôn Đức Thắng', '0909445566',
 'mkbn058', 1063, N'Đau lưng', N'K003', N'Có', '2025-05-27', '2025-05-27'),

('BN064', '123456789059', N'Thái Minh Trí', '1994-06-08', N'Nam', N'Lập trình viên', N'Kinh', NULL, N'101 Điện Biên Phủ, Q.Bình Thạnh',
 N'Cty phần mềm VNG', N'BHYT', 'SV123456846', '2026-11-01', N'Thái Thị Hoa', N'66 Lý Thường Kiệt', '0913445566',
 'mkbn059', 2064, N'Cảm lạnh', N'K004', N'Không', '2025-05-28', '2025-05-28'),

('BN065', '123456789060', N'Trịnh Văn Hào', '1986-05-25', N'Nam', N'Kinh doanh tự do', N'Kinh', NULL, N'22 Cộng Hòa, Q.Tân Bình',
 N'Nhà riêng', N'BHYT', 'SV123456847', '2026-08-08', N'Trịnh Thị Huyền', N'19 Tân Kỳ Tân Quý', '0909887666',
 'mkbn060', 1065, N'Khó thở', N'K005', N'Có', '2025-05-29', '2025-05-28'),

 ('BN066', '123456789061', N'Nguyễn Thị Thắm', '1993-09-10', N'Nữ', N'Y tá', N'Kinh', NULL, N'77 Tô Hiến Thành, Q.10',
 N'Bệnh viện Từ Dũ', N'BHYT', 'SV123456848', '2026-07-30', N'Nguyễn Văn Thế', N'22 Nguyễn Tri Phương', '0909667788',
 'mkbn061', 1066, N'Đau bụng', N'K001', N'Không', '2025-05-30', '2025-05-28'),

('BN067', '123456789062', N'Phan Văn Minh', '1982-07-17', N'Nam', N'Lao động phổ thông', N'Kinh', NULL, N'16 Phạm Văn Đồng, Q.Thủ Đức',
 N'Công trình xây dựng', N'BHYT', 'SV123456849', '2026-10-10', N'Phan Thị Tươi', N'35 Trần Quốc Hoàn', '0912331122',
 'mkbn062', 1067, N'Đau lưng', N'K002', N'Có', '2025-06-01', '2025-05-29'),

('BN068', '123456789063', N'Lý Thị Mai', '1991-11-09', N'Nữ', N'Nhân viên chăm sóc khách hàng', N'Kinh', NULL, N'102 Lê Văn Sỹ, Q.3',
 N'Cty Điện lực TP.HCM', N'BHYT', 'SV123456850', '2026-09-15', N'Lý Văn Hiền', N'12 Võ Thị Sáu', '0908773344',
 'mkbn063', 2068, N'Sốt', N'K003', N'Không', '2025-06-02', '2025-05-30'),

('BN069', '123456789064', N'Vũ Văn Dũng', '1987-03-05', N'Nam', N'Bảo vệ', N'Kinh', NULL, N'41 Nguyễn Thị Minh Khai, Q.1',
 N'Tòa nhà Bitexco', N'BHYT', 'SV123456851', '2026-12-01', N'Vũ Thị Sen', N'18 Lê Thánh Tôn', '0912556677',
 'mkbn064', 1069, N'Mất ngủ', N'K004', N'Không', '2025-06-03', '2025-05-31'),

('BN070', '123456789065', N'Trần Nhật Long', '1990-06-19', N'Nam', N'Kỹ sư xây dựng', N'Kinh', NULL, N'28 Phan Xích Long, Q.Phú Nhuận',
 N'Cty XD Nam Long', N'BHYT', 'SV123456852', '2026-11-20', N'Trần Thị Hoa', N'60 Pasteur', '0909334455',
 'mkbn065', 2070, N'Khó thở', N'K005', N'Có', '2025-06-04', '2025-05-31'),

 ('BN071', '123456789071', N'Nguyễn Văn An', '1980-01-15', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'10 Lê Lợi, Q1',
 N'Công ty A', N'BHYT', 'BH0710001', '2024-12-31', N'Trần Thị Hoa', N'50 Nguyễn Trãi', '0912345671',
 'mkbn071', 1071, N'Sốt cao', N'K001', N'Có', '2024-01-05', '2024-01-05'),

('BN072', '123456789072', N'Lê Thị Bích', '1985-02-20', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'22 Phan Đình Phùng, Q3',
 N'Trường B', N'BHYT', 'BH0720002', '2024-11-30', N'Phạm Văn Minh', N'45 Lý Thường Kiệt', '0922333444',
 'mkbn072', 2072, N'Ho kéo dài', N'K002', N'Không', '2024-02-10', '2024-02-10'),

('BN073', '123456789073', N'Phạm Văn Cường', '1978-03-10', N'Nam', N'Kế toán', N'Kinh', NULL, N'33 Nguyễn Huệ, Q5',
 N'Công ty C', N'BHYT', 'BH0730003', '2024-10-31', N'Nguyễn Thị Lan', N'12 Nguyễn Du', '0933444555',
 'mkbn073', 1073, N'Đau đầu', N'K003', N'Có', '2024-03-15', '2024-03-15'),

('BN074', '123456789074', N'Hồ Thị Dung', '1990-04-05', N'Nữ', N'Nhân viên văn phòng', N'Kinh', NULL, N'44 Trần Hưng Đạo, Q10',
 N'Công ty D', N'BHYT', 'BH0740004', '2024-09-30', N'Trần Văn Bình', N'30 Phan Đình Phùng', '0944555666',
 'mkbn074', 2074, N'Đau bụng', N'K004', N'Không', '2024-04-20', '2024-04-20'),

('BN075', '123456789075', N'Hoàng Văn Đông', '1982-05-25', N'Nam', N'Công nhân', N'Kinh', NULL, N'55 Nguyễn Trãi, Q1',
 N'Nhà máy E', N'BHYT', 'BH0750005', '2024-08-31', N'Phạm Thị Hồng', N'55 Trần Hưng Đạo', '0955666777',
 'mkbn075', 2075, N'Khó thở', N'K005', N'Có', '2024-05-25', '2024-05-25'),

('BN076', '123456789076', N'Nguyễn Thị Hà', '1995-06-12', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'66 Trường Chinh, Q4',
 N'Đại học F', N'BHYT', 'BH0760006', '2024-07-31', N'Trần Văn Dũng', N'12 Lê Duẩn', '0966777888',
 'mkbn076', 1076, N'Sốt nhẹ', N'K006', N'Không', '2024-06-15', '2024-06-15'),

('BN077', '123456789077', N'Phan Văn Hải', '1988-07-07', N'Nam', N'Lái xe', N'Kinh', NULL, N'77 Cách Mạng Tháng 8, Q3',
 N'Công ty G', N'BHYT', 'BH0770007', '2024-06-30', N'Nguyễn Thị Thu', N'40 Nguyễn Văn Cừ', '0977888999',
 'mkbn077', 1077, N'Đau lưng', N'K007', N'Có', '2024-07-10', '2024-07-10'),

('BN078', '123456789078', N'Trần Thị Hoa', '1979-08-14', N'Nữ', N'Bác sĩ', N'Kinh', NULL, N'88 Lý Thường Kiệt, Q5',
 N'Bệnh viện H', N'BHYT', 'BH0780008', '2024-05-31', N'Phạm Văn Nam', N'60 Trần Phú', '0988999000',
 'mkbn078', 2078, N'Mệt mỏi', N'K008', N'Không', '2024-08-20', '2024-08-20'),

('BN079', '123456789079', N'Vũ Văn Nam', '1991-09-19', N'Nam', N'Kỹ thuật viên', N'Kinh', NULL, N'99 Nguyễn Văn Linh, Q1',
 N'Công ty I', N'BHYT', 'BH0790009', '2024-04-30', N'Nguyễn Thị Mai', N'70 Nguyễn Huệ', '0999000111',
 'mkbn079', 2079, N'Ho khan', N'K009', N'Có', '2024-09-10', '2024-09-10'),

('BN080', '123456789080', N'Đặng Thị Mai', '1983-10-25', N'Nữ', N'Nhân viên bán hàng', N'Kinh', NULL, N'101 Trần Cao Vân, Q6',
 N'Cửa hàng J', N'BHYT', 'BH0800010', '2024-03-31', N'Trần Văn Hải', N'15 Nguyễn Trãi', '0900111222',
 'mkbn080', 2080, N'Đau họng', N'K010', N'Không', '2024-10-05', '2024-10-05'),

('BN081', '123456789081', N'Phạm Văn Quang', '1987-11-30', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'102 Phan Chu Trinh, Q2',
 N'Công ty K', N'BHYT', 'BH0810011', '2024-02-28', N'Nguyễn Thị Bình', N'90 Lý Thường Kiệt', '0911222333',
 'mkbn081', 1081, N'Sốt cao', N'K001', N'Có', '2024-11-15', '2024-11-15'),

('BN082', '123456789082', N'Ngô Thị Thanh', '1994-12-17', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'103 Nguyễn Du, Q4',
 N'Trường L', N'BHYT', 'BH0820012', '2024-01-31', N'Phạm Văn Long', N'20 Trần Phú', '0922333444',
 'mkbn082', 2082, N'Đau đầu', N'K002', N'Không', '2024-12-20', '2024-12-20'),

('BN083', '123456789083', N'Bùi Văn Tùng', '1975-01-05', N'Nam', N'Công nhân', N'Kinh', NULL, N'104 Lê Hồng Phong, Q7',
 N'Nhà máy M', N'BHYT', 'BH0830013', '2024-12-15', N'Trần Thị Hoa', N'33 Nguyễn Trãi', '0933444555',
 'mkbn083', 1083, N'Khó thở', N'K003', N'Có', '2024-01-25', '2024-01-25'),

('BN084', '123456789084', N'Trương Thị Linh', '1989-02-18', N'Nữ', N'Nhân viên văn phòng', N'Kinh', NULL, N'105 Trần Hưng Đạo, Q8',
 N'Công ty N', N'BHYT', 'BH0840014', '2024-11-20', N'Phạm Văn Sơn', N'55 Nguyễn Huệ', '0944555666',
 'mkbn084', 1084, N'Đau bụng', N'K004', N'Không', '2024-02-28', '2024-02-28'),

('BN085', '123456789085', N'Đỗ Văn Bình', '1981-03-23', N'Nam', N'Lái xe', N'Kinh', NULL, N'106 Nguyễn Trãi, Q9',
 N'Công ty O', N'BHYT', 'BH0850015', '2024-10-18', N'Nguyễn Thị Mai', N'60 Lý Thường Kiệt', '0955666777',
 'mkbn085', 1085, N'Đau lưng', N'K005', N'Có', '2024-03-15', '2024-03-15'),

('BN086', '123456789086', N'Võ Thị Hương', '1992-04-30', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'107 Phan Chu Trinh, Q10',
 N'Đại học P', N'BHYT', 'BH0860016', '2024-09-22', N'Trần Văn Hùng', N'80 Trần Phú', '0966777888',
 'mkbn086', 1086, N'Sốt nhẹ', N'K006', N'Không', '2024-04-10', '2024-04-10'),

('BN087', '123456789087', N'Nguyễn Văn Sơn', '1977-05-12', N'Nam', N'Kỹ thuật viên', N'Kinh', NULL, N'108 Cách Mạng Tháng 8, Q1',
 N'Công ty Q', N'BHYT', 'BH0870017', '2024-08-25', N'Phạm Thị Hằng', N'35 Nguyễn Du', '0977888999',
 'mkbn087', 2087, N'Ho khan', N'K007', N'Có', '2024-05-20', '2024-05-20'),

('BN088', '123456789088', N'Phạm Thị Duyên', '1986-06-28', N'Nữ', N'Bác sĩ', N'Kinh', NULL, N'109 Lý Thường Kiệt, Q2',
 N'Bệnh viện R', N'BHYT', 'BH0880018', '2024-07-30', N'Nguyễn Văn Hải', N'65 Nguyễn Huệ', '0988999000',
 'mkbn088', 2088, N'Mệt mỏi', N'K008', N'Không', '2024-06-15', '2024-06-15'),

('BN089', '123456789089', N'Vũ Văn Phúc', '1993-07-19', N'Nam', N'Kỹ sư phần mềm', N'Kinh', NULL, N'110 Nguyễn Văn Linh, Q3',
 N'Công ty S', N'BHYT', 'BH0890019', '2024-06-25', N'Trần Thị Thu', N'70 Nguyễn Du', '0999000111',
 'mkbn089', 2089, N'Ho kéo dài', N'K009', N'Có', '2024-07-20', '2024-07-20'),

('BN090', '123456789090', N'Đinh Thị Nga', '1984-08-15', N'Nữ', N'Nhân viên bán hàng', N'Kinh', NULL, N'111 Trần Cao Vân, Q4',
 N'Cửa hàng T', N'BHYT', 'BH0900020', '2024-05-15', N'Phạm Văn Long', N'25 Trần Phú', '0900111222',
 'mkbn090', 1090, N'Đau họng', N'K010', N'Không', '2024-08-10', '2024-08-10'),

 ('BN091', '123456789091', N'Nguyễn Văn A', '1980-01-10', N'Nam', N'Công nhân', N'Kinh', NULL, N'10 Lê Lợi, Q1',
 N'Nhà máy A', N'BHYT', 'BH0910001', '2023-12-31', N'Trần Thị B', N'20 Nguyễn Trãi', '0912345091',
 'mkbn091', 1091, N'Sốt cao', N'K001', N'Có', '2023-01-05', '2023-01-05'),

('BN092', '123456789092', N'Lê Thị B', '1985-02-20', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'22 Phan Đình Phùng, Q3',
 N'Trường B', N'BHYT', 'BH0920002', '2023-12-31', N'Phạm Văn C', N'45 Lý Thường Kiệt', '0922333492',
 'mkbn092', 1092, N'Ho kéo dài', N'K002', N'Không', '2023-02-10', '2023-02-10'),

('BN093', '123456789093', N'Phạm Văn C', '1978-03-10', N'Nam', N'Kế toán', N'Kinh', NULL, N'33 Nguyễn Huệ, Q5',
 N'Công ty C', N'BHYT', 'BH0930003', '2023-12-31', N'Nguyễn Thị D', N'12 Nguyễn Du', '0933444593',
 'mkbn093', 1093, N'Đau đầu', N'K003', N'Có', '2023-03-12', '2023-03-12'),

('BN094', '123456789094', N'Hồ Thị D', '1990-04-05', N'Nữ', N'Nhân viên', N'Kinh', NULL, N'44 Trần Hưng Đạo, Q10',
 N'Công ty D', N'BHYT', 'BH0940004', '2023-12-31', N'Trần Văn E', N'30 Phan Đình Phùng', '0944555694',
 'mkbn094', 1094, N'Đau bụng', N'K004', N'Không', '2023-04-08', '2023-04-08'),

('BN095', '123456789095', N'Hoàng Văn E', '1982-05-25', N'Nam', N'Lái xe', N'Kinh', NULL, N'55 Nguyễn Trãi, Q1',
 N'Cty vận tải E', N'BHYT', 'BH0950005', '2023-12-31', N'Phạm Thị F', N'55 Trần Hưng Đạo', '0955666795',
 'mkbn095', 2095, N'Khó thở', N'K005', N'Có', '2023-05-11', '2023-05-11'),

('BN096', '123456789096', N'Nguyễn Thị F', '1995-06-12', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'66 Trường Chinh, Q4',
 N'Đại học F', N'BHYT', 'BH0960006', '2023-12-31', N'Trần Văn G', N'12 Lê Duẩn', '0966777896',
 'mkbn096', 1096, N'Đau họng', N'K006', N'Không', '2023-06-17', '2023-06-17'),

('BN097', '123456789097', N'Phan Văn G', '1977-07-18', N'Nam', N'IT', N'Kinh', NULL, N'77 Hai Bà Trưng, Q2',
 N'Công ty G', N'BHYT', 'BH0970007', '2023-12-31', N'Nguyễn Thị H', N'8 Phạm Ngọc Thạch', '0977888997',
 'mkbn097', 1097, N'Đau lưng', N'K007', N'Có', '2023-07-09', '2023-07-09'),

('BN098', '123456789098', N'Võ Thị H', '1988-08-22', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'88 Lý Thường Kiệt, Q5',
 N'Trường H', N'BHYT', 'BH0980008', '2023-12-31', N'Phạm Văn I', N'22 Nguyễn Huệ', '0988999008',
 'mkbn098', 2098, N'Viêm họng', N'K008', N'Không', '2023-08-14', '2023-08-14'),

('BN099', '123456789099', N'Đinh Văn I', '1992-09-30', N'Nam', N'Công nhân', N'Kinh', NULL, N'99 Nguyễn Văn Cừ, Q1',
 N'Nhà máy I', N'BHYT', 'BH0990009', '2023-12-31', N'Trần Thị J', N'11 Hùng Vương', '0999000119',
 'mkbn099', 1099, N'Sốt nhẹ', N'K009', N'Có', '2023-09-20', '2023-09-20'),

('BN100', '123456789100', N'Nguyễn Thị J', '1983-10-15', N'Nữ', N'NV Kinh doanh', N'Kinh', NULL, N'100 Trần Phú, Q6',
 N'Công ty J', N'BHYT', 'BH1000010', '2023-12-31', N'Phạm Văn K', N'33 Lê Lai', '0900112233',
 'mkbn100', 2100, N'Mệt mỏi', N'K010', N'Không', '2023-10-10', '2023-10-10'),

('BN101', '123456789101', N'Trần Văn K', '1981-11-01', N'Nam', N'Bảo vệ', N'Kinh', NULL, N'1 Nguyễn Huệ, Q1',
 N'Cty bảo vệ K', N'BHYT', 'BH1010011', '2023-12-31', N'Lê Thị L', N'3 Hùng Vương', '0911223344',
 'mkbn101', 2101, N'Đau vai', N'K001', N'Có', '2023-11-11', '2023-11-11'),

('BN102', '123456789102', N'Hoàng Thị L', '1991-12-05', N'Nữ', N'Văn thư', N'Kinh', NULL, N'102 Phạm Văn Đồng, Q9',
 N'Công ty L', N'BHYT', 'BH1020012', '2023-12-31', N'Trần Văn M', N'9 Nguyễn Huệ', '0922334455',
 'mkbn102', 2102, N'Đau tai', N'K002', N'Không', '2023-12-01', '2023-12-01'),

('BN103', '123456789103', N'Nguyễn Văn M', '1987-01-17', N'Nam', N'Giáo viên', N'Kinh', NULL, N'103 Lê Hồng Phong, Q4',
 N'Trường M', N'BHYT', 'BH1030013', '2023-12-31', N'Phạm Thị N', N'44 Phan Bội Châu', '0933445566',
 'mkbn103', 2103, N'Đau răng', N'K003', N'Có', '2023-01-20', '2023-01-20'),

('BN104', '123456789104', N'Lê Thị N', '1993-02-25', N'Nữ', N'Công nhân', N'Kinh', NULL, N'104 Trường Sơn, Q3',
 N'Xí nghiệp N', N'BHYT', 'BH1040014', '2023-12-31', N'Nguyễn Văn O', N'26 Nguyễn Khuyến', '0944556677',
 'mkbn104', 1104, N'Đau khớp', N'K004', N'Không', '2023-02-28', '2023-02-28'),

('BN105', '123456789105', N'Phan Văn O', '1980-03-05', N'Nam', N'Tài xế', N'Kinh', NULL, N'105 Trần Hưng Đạo, Q2',
 N'Công ty O', N'BHYT', 'BH1050015', '2023-12-31', N'Lê Thị P', N'15 Lê Lợi', '0955777888',
 'mkbn105', 1105, N'Khó thở', N'K005', N'Có', '2023-03-30', '2023-03-30'),

('BN106', '123456789106', N'Nguyễn Thị P', '1989-04-12', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'106 Lý Chính Thắng, Q3',
 N'Trường P', N'BHYT', 'BH1060016', '2023-12-31', N'Trần Văn Q', N'13 Nguyễn Huệ', '0966888899',
 'mkbn106', 2106, N'Sốt', N'K006', N'Không', '2023-04-21', '2023-04-21'),

('BN107', '123456789107', N'Vũ Văn Q', '1985-05-14', N'Nam', N'IT', N'Kinh', NULL, N'107 Nguyễn Thái Học, Q4',
 N'Cty Q', N'BHYT', 'BH1070017', '2023-12-31', N'Nguyễn Thị R', N'8 Nguyễn Văn Linh', '0977999000',
 'mkbn107', 1107, N'Nhiễm trùng', N'K007', N'Có', '2023-05-18', '2023-05-18'),

('BN108', '123456789108', N'Phạm Thị R', '1994-06-07', N'Nữ', N'Nhân viên y tế', N'Kinh', NULL, N'108 Hùng Vương, Q5',
 N'Bệnh viện R', N'BHYT', 'BH1080018', '2023-12-31', N'Trần Văn S', N'7 Lê Văn Sỹ', '0988001122',
 'mkbn108', 2108, N'Đau ngực', N'K008', N'Không', '2023-06-15', '2023-06-15'),

('BN109', '123456789109', N'Trần Văn S', '1986-07-09', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'109 Nguyễn Cư Trinh, Q6',
 N'Công ty S', N'BHYT', 'BH1090019', '2023-12-31', N'Phạm Thị T', N'29 Lý Thường Kiệt', '0999112233',
 'mkbn109', 1109, N'Chóng mặt', N'K009', N'Có', '2023-07-29', '2023-07-29'),

('BN110', '123456789110', N'Lê Thị T', '1982-08-19', N'Nữ', N'Kế toán', N'Kinh', NULL, N'110 Tôn Đức Thắng, Q1',
 N'Công ty T', N'BHYT', 'BH1100020', '2023-12-31', N'Nguyễn Văn U', N'88 Nguyễn Trãi', '0900123456',
 'mkbn110', 1110, N'Say nắng', N'K010', N'Không', '2023-08-08', '2023-08-08'),

 ('BN111', '123456789111', N'Nguyễn Văn A1', '1990-01-15', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'111 Lê Lợi, Q1',
 N'Cty A1', N'BHYT', 'BH111001', '2022-12-31', N'Trần Thị A1', N'101 Hòa Bình', '0900000001',
 'mkbn111', 1111, N'Đau đầu', N'K001', N'Không', '2022-01-05', '2022-01-05'),

('BN112', '123456789112', N'Lê Thị B2', '1985-02-18', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'112 Nguyễn Trãi, Q5',
 N'Trường B2', N'BHYT', 'BH112002', '2022-12-31', N'Phạm Văn B2', N'102 Hòa Bình', '0900000002',
 'mkbn112', 2112, N'Sốt', N'K002', N'Có', '2022-02-10', '2022-02-10'),

('BN113', '123456789113', N'Trần Văn C3', '1992-03-20', N'Nam', N'Lập trình viên', N'Kinh', NULL, N'113 Pasteur, Q3',
 N'Cty C3', N'BHYT', 'BH113003', '2022-12-31', N'Lê Thị C3', N'103 Hòa Bình', '0900000003',
 'mkbn113', 2113, N'Ho', N'K003', N'Không', '2022-03-12', '2022-03-12'),

('BN114', '123456789114', N'Phạm Thị D4', '1995-04-25', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'114 Trần Phú, Q10',
 N'Đại học D4', N'BHYT', 'BH114004', '2022-12-31', N'Nguyễn Văn D4', N'104 Hòa Bình', '0900000004',
 'mkbn114', 2114, N'Mệt mỏi', N'K004', N'Có', '2022-04-18', '2022-04-18'),

('BN115', '123456789115', N'Doãn Văn E5', '1980-05-15', N'Nam', N'Tài xế', N'Kinh', NULL, N'115 Hai Bà Trưng, Q3',
 N'Cty vận tải E5', N'BHYT', 'BH115005', '2022-12-31', N'Trịnh Thị E5', N'105 Hòa Bình', '0900000005',
 'mkbn115', 1115, N'Viêm họng', N'K005', N'Không', '2022-05-22', '2022-05-22'),

('BN116', '123456789116', N'Ngô Thị F6', '1988-06-05', N'Nữ', N'Y tá', N'Kinh', NULL, N'116 Nguyễn Đình Chiểu, Q1',
 N'BV F6', N'BHYT', 'BH116006', '2022-12-31', N'Lê Văn F6', N'106 Hòa Bình', '0900000006',
 'mkbn116', 1116, N'Buồn nôn', N'K006', N'Có', '2022-06-14', '2022-06-14'),

('BN117', '123456789117', N'Võ Văn G7', '1991-07-10', N'Nam', N'Kế toán', N'Kinh', NULL, N'117 Cách Mạng Tháng Tám, Q10',
 N'Cty G7', N'BHYT', 'BH117007', '2022-12-31', N'Phan Thị G7', N'107 Hòa Bình', '0900000007',
 'mkbn117', 1117, N'Đau bụng', N'K007', N'Không', '2022-07-19', '2022-07-19'),

('BN118', '123456789118', N'Hà Thị H8', '1987-08-20', N'Nữ', N'Nhân viên văn phòng', N'Kinh', NULL, N'118 Lý Thường Kiệt, Q5',
 N'Cty H8', N'BHYT', 'BH118008', '2022-12-31', N'Nguyễn Văn H8', N'108 Hòa Bình', '0900000008',
 'mkbn118', 2118, N'Khó thở', N'K008', N'Có', '2022-08-05', '2022-08-05'),

('BN119', '123456789119', N'Nguyễn Văn I9', '1983-09-01', N'Nam', N'Thợ hồ', N'Kinh', NULL, N'119 Điện Biên Phủ, Q3',
 N'Công trình I9', N'BHYT', 'BH119009', '2022-12-31', N'Lý Thị I9', N'109 Hòa Bình', '0900000009',
 'mkbn119', 1119, N'Đau lưng', N'K009', N'Không', '2022-09-11', '2022-09-11'),

('BN120', '123456789120', N'Đào Thị J0', '1996-10-18', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'120 Nguyễn Văn Cừ, Q1',
 N'Đại học J0', N'BHYT', 'BH120010', '2022-12-31', N'Phan Văn J0', N'110 Hòa Bình', '0900000010',
 'mkbn120', 2120, N'Mất ngủ', N'K010', N'Có', '2022-10-28', '2022-10-28'),

 ('BN121', '123456789121', N'Nguyễn Văn K1', '1990-01-15', N'Nam', N'Bác sĩ', N'Kinh', NULL, N'121 Lê Văn Sỹ, Q3',
 N'BV K1', N'BHYT', 'BH121011', '2022-12-31', N'Lê Thị K1', N'121 Hòa Bình', '0900000011',
 'mkbn121', 2121, N'Sốt nhẹ', N'K001', N'Không', '2022-01-15', '2022-01-15'),

('BN122', '123456789122', N'Lê Thị L2', '1985-02-18', N'Nữ', N'Kế toán', N'Kinh', NULL, N'122 Nguyễn Trãi, Q5',
 N'Cty L2', N'BHYT', 'BH122012', '2022-12-31', N'Phạm Văn L2', N'122 Hòa Bình', '0900000012',
 'mkbn122', 1122, N'Viêm mũi', N'K002', N'Có', '2022-02-20', '2022-02-20'),

('BN123', '123456789123', N'Trần Văn M3', '1992-03-20', N'Nam', N'Lập trình viên', N'Kinh', NULL, N'123 Pasteur, Q3',
 N'Cty M3', N'BHYT', 'BH123013', '2022-12-31', N'Lê Thị M3', N'123 Hòa Bình', '0900000013',
 'mkbn123', 2123, N'Nổi mẩn', N'K003', N'Không', '2022-03-25', '2022-03-25'),

('BN124', '123456789124', N'Phạm Thị N4', '1995-04-25', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'124 Trần Phú, Q10',
 N'Đại học N4', N'BHYT', 'BH124014', '2022-12-31', N'Nguyễn Văn N4', N'124 Hòa Bình', '0900000014',
 'mkbn124', 2124, N'Đau khớp', N'K004', N'Có', '2022-04-09', '2022-04-09'),

('BN125', '123456789125', N'Doãn Văn O5', '1980-05-15', N'Nam', N'Tài xế', N'Kinh', NULL, N'125 Hai Bà Trưng, Q3',
 N'Cty O5', N'BHYT', 'BH125015', '2022-12-31', N'Trịnh Thị O5', N'125 Hòa Bình', '0900000015',
 'mkbn125', 2125, N'Đau bụng', N'K005', N'Không', '2022-05-11', '2022-05-11'),

('BN126', '123456789126', N'Ngô Thị P6', '1988-06-05', N'Nữ', N'Y tá', N'Kinh', NULL, N'126 Nguyễn Đình Chiểu, Q1',
 N'BV P6', N'BHYT', 'BH126016', '2022-12-31', N'Lê Văn P6', N'126 Hòa Bình', '0900000016',
 'mkbn126', 1126, N'Đau họng', N'K006', N'Có', '2022-06-20', '2022-06-20'),

('BN127', '123456789127', N'Võ Văn Q7', '1991-07-10', N'Nam', N'Kế toán', N'Kinh', NULL, N'127 CMT8, Q10',
 N'Cty Q7', N'BHYT', 'BH127017', '2022-12-31', N'Phan Thị Q7', N'127 Hòa Bình', '0900000017',
 'mkbn127', 1127, N'Suy nhược', N'K007', N'Không', '2022-07-16', '2022-07-16'),

('BN128', '123456789128', N'Hà Thị R8', '1987-08-20', N'Nữ', N'Nhân viên VP', N'Kinh', NULL, N'128 Lý Thường Kiệt, Q5',
 N'Cty R8', N'BHYT', 'BH128018', '2022-12-31', N'Nguyễn Văn R8', N'128 Hòa Bình', '0900000018',
 'mkbn128', 1128, N'Đau vai', N'K008', N'Có', '2022-08-24', '2022-08-24'),

('BN129', '123456789129', N'Nguyễn Văn S9', '1983-09-01', N'Nam', N'Thợ hồ', N'Kinh', NULL, N'129 ĐBP, Q3',
 N'Công trình S9', N'BHYT', 'BH129019', '2022-12-31', N'Lý Thị S9', N'129 Hòa Bình', '0900000019',
 'mkbn129', 2129, N'Táo bón', N'K009', N'Không', '2022-09-08', '2022-09-08'),

('BN130', '123456789130', N'Đào Thị T0', '1996-10-18', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'130 NVC, Q1',
 N'ĐH T0', N'BHYT', 'BH130020', '2022-12-31', N'Phan Văn T0', N'130 Hòa Bình', '0900000020',
 'mkbn130', 2130, N'Mất ngủ', N'K010', N'Có', '2022-10-19', '2022-10-19'),

 ('BN131', '123456789131', N'Nguyễn Văn U1', '1980-11-11', N'Nam', N'Công nhân', N'Kinh', NULL, N'131 Q1',
 N'Cty U1', N'BHYT', 'BH131021', '2022-12-31', N'Lê Thị U1', N'131 Hòa Bình', '0900000021',
 'mkbn131', 1131, N'Sốt', N'K001', N'Không', '2022-11-02', '2022-11-02'),

('BN132', '123456789132', N'Lê Thị V2', '1991-12-12', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'132 Q5',
 N'Trường V2', N'BHYT', 'BH132022', '2022-12-31', N'Phạm Văn V2', N'132 Hòa Bình', '0900000022',
 'mkbn132', 2132, N'Đau họng', N'K002', N'Có', '2022-12-08', '2022-12-08'),

('BN133', '123456789133', N'Trần Văn W3', '1990-01-13', N'Nam', N'LTV', N'Kinh', NULL, N'133 Q3',
 N'Cty W3', N'BHYT', 'BH133023', '2022-12-31', N'Lê Thị W3', N'133 Hòa Bình', '0900000023',
 'mkbn133', 2133, N'Mệt mỏi', N'K003', N'Không', '2022-01-30', '2022-01-30'),

('BN134', '123456789134', N'Phạm Thị X4', '1993-02-14', N'Nữ', N'SV', N'Kinh', NULL, N'134 Q10',
 N'ĐH X4', N'BHYT', 'BH134024', '2022-12-31', N'Nguyễn Văn X4', N'134 Hòa Bình', '0900000024',
 'mkbn134', 1134, N'Ho nhiều', N'K004', N'Có', '2022-02-25', '2022-02-25'),

('BN135', '123456789135', N'Doãn Văn Y5', '1982-03-19', N'Nam', N'Bảo vệ', N'Kinh', NULL, N'135 Q3',
 N'Cty Y5', N'BHYT', 'BH135025', '2022-12-31', N'Trịnh Thị Y5', N'135 Hòa Bình', '0900000025',
 'mkbn135', 1135, N'Nổi ban', N'K005', N'Không', '2022-03-11', '2022-03-11'),

('BN136', '123456789136', N'Ngô Thị Z6', '1986-04-04', N'Nữ', N'Y tá', N'Kinh', NULL, N'136 Q1',
 N'BV Z6', N'BHYT', 'BH136026', '2022-12-31', N'Lê Văn Z6', N'136 Hòa Bình', '0900000026',
 'mkbn136', 1136, N'Đau chân', N'K006', N'Có', '2022-04-16', '2022-04-16'),

('BN137', '123456789137', N'Võ Văn A7', '1989-05-06', N'Nam', N'Kế toán', N'Kinh', NULL, N'137 Q10',
 N'Cty A7', N'BHYT', 'BH137027', '2022-12-31', N'Phan Thị A7', N'137 Hòa Bình', '0900000027',
 'mkbn137', 2137, N'Khó ngủ', N'K007', N'Không', '2022-05-09', '2022-05-09'),

('BN138', '123456789138', N'Hà Thị B8', '1992-06-26', N'Nữ', N'NV VP', N'Kinh', NULL, N'138 Q5',
 N'Cty B8', N'BHYT', 'BH138028', '2022-12-31', N'Nguyễn Văn B8', N'138 Hòa Bình', '0900000028',
 'mkbn138', 1138, N'Khó thở', N'K008', N'Có', '2022-06-30', '2022-06-30'),

('BN139', '123456789139', N'Nguyễn Văn C9', '1980-07-01', N'Nam', N'Phụ hồ', N'Kinh', NULL, N'139 Q3',
 N'Công trình C9', N'BHYT', 'BH139029', '2022-12-31', N'Lý Thị C9', N'139 Hòa Bình', '0900000029',
 'mkbn139', 1139, N'Mất ngủ', N'K009', N'Không', '2022-07-14', '2022-07-14'),

('BN140', '123456789140', N'Đào Thị D0', '1997-08-08', N'Nữ', N'SV', N'Kinh', NULL, N'140 Q1',
 N'ĐH D0', N'BHYT', 'BH140030', '2022-12-31', N'Phan Văn D0', N'140 Hòa Bình', '0900000030',
 'mkbn140', 2140, N'Viêm mũi', N'K010', N'Có', '2022-08-17', '2022-08-17'),

 ('BN141', '123456789141', N'Nguyễn Văn A1', '1990-01-01', N'Nam', N'Công nhân', N'Kinh', NULL, N'141 Lê Lợi, Q1',
 N'Cty A1', N'BHYT', 'BH141021', '2021-12-31', N'Lê Thị A1', N'141 Hòa Bình', '0910000001',
 'mkbn141', 2141, N'Sốt cao', N'K001', N'Không', '2021-01-05', '2021-01-05'),

-- Tháng 2
('BN142', '123456789142', N'Lê Thị B2', '1988-02-02', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'142 Trần Phú, Q5',
 N'Trường B2', N'BHYT', 'BH142022', '2021-12-31', N'Phạm Văn B2', N'142 Hòa Bình', '0910000002',
 'mkbn142', 1142, N'Ho khan', N'K002', N'Có', '2021-02-14', '2021-02-14'),

-- Tháng 3
('BN143', '123456789143', N'Trần Văn C3', '1992-03-03', N'Nam', N'Tài xế', N'Kinh', NULL, N'143 Điện Biên Phủ, Q3',
 N'Cty C3', N'BHYT', 'BH143023', '2021-12-31', N'Lê Thị C3', N'143 Hòa Bình', '0910000003',
 'mkbn143', 1143, N'Đau đầu', N'K003', N'Không', '2021-03-10', '2021-03-10'),

-- Tháng 4
('BN144', '123456789144', N'Phạm Thị D4', '1995-04-04', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'144 Nguyễn Trãi, Q10',
 N'ĐH D4', N'BHYT', 'BH144024', '2021-12-31', N'Nguyễn Văn D4', N'144 Hòa Bình', '0910000004',
 'mkbn144', 2144, N'Viêm họng', N'K004', N'Có', '2021-04-22', '2021-04-22'),

-- Tháng 5
('BN145', '123456789145', N'Doãn Văn E5', '1985-05-05', N'Nam', N'Bác sĩ', N'Kinh', NULL, N'145 Hai Bà Trưng, Q1',
 N'BV E5', N'BHYT', 'BH145025', '2021-12-31', N'Trịnh Thị E5', N'145 Hòa Bình', '0910000005',
 'mkbn145', 2145, N'Đau bụng', N'K005', N'Không', '2021-05-08', '2021-05-08'),

-- Tháng 6
('BN146', '123456789146', N'Ngô Thị F6', '1986-06-06', N'Nữ', N'Y tá', N'Kinh', NULL, N'146 Nguyễn Văn Cừ, Q1',
 N'BV F6', N'BHYT', 'BH146026', '2021-12-31', N'Lê Văn F6', N'146 Hòa Bình', '0910000006',
 'mkbn146', 1146, N'Mẩn ngứa', N'K006', N'Có', '2021-06-18', '2021-06-18'),

-- Tháng 7
('BN147', '123456789147', N'Võ Văn G7', '1989-07-07', N'Nam', N'Công nhân', N'Kinh', NULL, N'147 Lý Thường Kiệt, Q10',
 N'Cty G7', N'BHYT', 'BH147027', '2021-12-31', N'Phan Thị G7', N'147 Hòa Bình', '0910000007',
 'mkbn147', 1147, N'Suy nhược', N'K007', N'Không', '2021-07-11', '2021-07-11'),

-- Tháng 8
('BN148', '123456789148', N'Hà Thị H8', '1994-08-08', N'Nữ', N'Kế toán', N'Kinh', NULL, N'148 Lê Quang Định, Q3',
 N'Cty H8', N'BHYT', 'BH148028', '2021-12-31', N'Nguyễn Văn H8', N'148 Hòa Bình', '0910000008',
 'mkbn148', 2148, N'Khó thở', N'K008', N'Có', '2021-08-22', '2021-08-22'),

-- Tháng 9
('BN149', '123456789149', N'Nguyễn Văn I9', '1983-09-09', N'Nam', N'Thợ mộc', N'Kinh', NULL, N'149 Trần Hưng Đạo, Q5',
 N'Xưởng I9', N'BHYT', 'BH149029', '2021-12-31', N'Lý Thị I9', N'149 Hòa Bình', '0910000009',
 'mkbn149', 1149, N'Táo bón', N'K009', N'Không', '2021-09-14', '2021-09-14'),

-- Tháng 10
('BN150', '123456789150', N'Đào Thị J0', '1996-10-10', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'150 Nguyễn Văn Linh, Q7',
 N'ĐH J0', N'BHYT', 'BH150030', '2021-12-31', N'Phan Văn J0', N'150 Hòa Bình', '0910000010',
 'mkbn150', 2150, N'Đau lưng', N'K010', N'Có', '2021-10-19', '2021-10-19'),

 -- Các dòng bổ sung cho mỗi tháng
('BN151', '123456789151', N'Nguyễn Thị K1', '1984-01-20', N'Nữ', N'Nội trợ', N'Kinh', NULL, N'151 Lê Lợi, Q1',
 N'Nhà riêng', N'BHYT', 'BH151031', '2021-12-31', N'Nguyễn Văn K1', N'151 Hòa Bình', '0910000011',
 'mkbn151', 2151, N'Đau đầu', N'K001', N'Không', '2021-01-25', '2021-01-25'),

('BN152', '123456789152', N'Lê Văn L2', '1990-02-15', N'Nam', N'Bảo vệ', N'Kinh', NULL, N'152 Điện Biên Phủ, Q3',
 N'Cty L2', N'BHYT', 'BH152032', '2021-12-31', N'Lê Thị L2', N'152 Hòa Bình', '0910000012',
 'mkbn152', 2152, N'Nổi mề đay', N'K002', N'Có', '2021-02-27', '2021-02-27'),

('BN153', '123456789153', N'Trần Văn M3', '1982-03-12', N'Nam', N'LTV', N'Kinh', NULL, N'153 CMT8, Q10',
 N'Cty M3', N'BHYT', 'BH153033', '2021-12-31', N'Lê Thị M3', N'153 Hòa Bình', '0910000013',
 'mkbn153', 1153, N'Mệt mỏi', N'K003', N'Không', '2021-03-20', '2021-03-20'),

('BN154', '123456789154', N'Phạm Thị N4', '1993-04-28', N'Nữ', N'Công chức', N'Kinh', NULL, N'154 Nguyễn Du, Q1',
 N'Cơ quan N4', N'BHYT', 'BH154034', '2021-12-31', N'Nguyễn Văn N4', N'154 Hòa Bình', '0910000014',
 'mkbn154', 1154, N'Ho có đờm', N'K004', N'Có', '2021-04-10', '2021-04-10'),

('BN155', '123456789155', N'Doãn Văn O5', '1980-05-30', N'Nam', N'Lái xe', N'Kinh', NULL, N'155 Hai Bà Trưng, Q3',
 N'Cty O5', N'BHYT', 'BH155035', '2021-12-31', N'Trịnh Thị O5', N'155 Hòa Bình', '0910000015',
 'mkbn155', 1155, N'Đau khớp', N'K005', N'Không', '2021-05-15', '2021-05-15'),

('BN156', '123456789156', N'Ngô Thị P6', '1987-06-25', N'Nữ', N'Y sĩ', N'Kinh', NULL, N'156 Nguyễn Đình Chiểu, Q3',
 N'Phòng khám P6', N'BHYT', 'BH156036', '2021-12-31', N'Lê Văn P6', N'156 Hòa Bình', '0910000016',
 'mkbn156', 1156, N'Tiêu chảy', N'K006', N'Có', '2021-06-10', '2021-06-10'),

('BN157', '123456789157', N'Võ Văn Q7', '1989-07-14', N'Nam', N'Công nhân', N'Kinh', NULL, N'157 CMT8, Q10',
 N'Cty Q7', N'BHYT', 'BH157037', '2021-12-31', N'Phan Thị Q7', N'157 Hòa Bình', '0910000017',
 'mkbn157', 2157, N'Đau vai gáy', N'K007', N'Không', '2021-07-20', '2021-07-20'),

('BN158', '123456789158', N'Hà Thị R8', '1991-08-12', N'Nữ', N'Nhân viên VP', N'Kinh', NULL, N'158 Lý Thường Kiệt, Q5',
 N'Cty R8', N'BHYT', 'BH158038', '2021-12-31', N'Nguyễn Văn R8', N'158 Hòa Bình', '0910000018',
 'mkbn158', 1158, N'Nhiễm lạnh', N'K008', N'Có', '2021-08-25', '2021-08-25'),

('BN159', '123456789159', N'Nguyễn Văn S9', '1983-09-23', N'Nam', N'Thợ hồ', N'Kinh', NULL, N'159 ĐBP, Q3',
 N'Xưởng S9', N'BHYT', 'BH159039', '2021-12-31', N'Lý Thị S9', N'159 Hòa Bình', '0910000019',
 'mkbn159', 2159, N'Chóng mặt', N'K009', N'Không', '2021-09-09', '2021-09-09'),

('BN160', '123456789160', N'Đào Thị T0', '1996-10-03', N'Nữ', N'SV', N'Kinh', NULL, N'160 NVC, Q1',
 N'ĐH T0', N'BHYT', 'BH160040', '2021-12-31', N'Phan Văn T0', N'160 Hòa Bình', '0910000020',
 'mkbn160', 2160, N'Viêm amidan', N'K010', N'Có', '2021-10-16', '2021-10-16'),

 ('BN161', '123456789161', N'Nguyễn Văn An', '1980-02-15', N'Nam', N'Bác sĩ', N'Kinh', NULL, N'123 Trần Hưng Đạo, Q1',
 'Bệnh viện Nhân Dân', N'BHYT', 'SV123456161', '2025-12-31', N'Trần Thị Hoa', N'456 Lê Lai, Q1', '0909161161',
 'mkbn161', 2161, N'Ho khan, sốt nhẹ', N'K005', N'Không', '2025-02-03', '2025-02-01'),

('BN162', '123456789162', N'Lê Thị Bình', '1992-04-21', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'54 Nguyễn Thái Học, Q3',
 'Trường THPT Hòa Bình', N'BHYT', 'SV123456162', '2025-12-31', N'Lê Văn Dũng', N'32 Nguyễn Văn Cừ, Q5', '0909162162',
 'mkbn162', 2162, N'Mệt mỏi, chóng mặt', N'K003', N'Có', '2025-02-05', '2025-02-02'),

('BN163', '123456789163', N'Phạm Minh Tuấn', '1975-06-11', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'87 Cách Mạng Tháng 8, Q10',
 'Công ty xây dựng Minh Tuấn', N'BHYT', 'SV123456163', '2025-12-31', N'Ngô Thị Thanh', N'27 Nguyễn Đình Chiểu, Q3', '0909163163',
 'mkbn163', 1163, N'Đau bụng, tiêu chảy', N'K001', N'Không', '2025-02-06', '2025-02-03'),

('BN164', '123456789164', N'Trần Thị Hồng', '1990-12-19', N'Nữ', N'Y tá', N'Kinh', NULL, N'33 Trương Định, Q5',
 'Phòng khám Hồng Đức', N'BHYT', 'SV123456164', '2025-12-31', N'Trần Văn Minh', N'88 Lê Văn Sỹ, Q3', '0909164164',
 'mkbn164', 2164, N'Sốt, đau đầu', N'K002', N'Có', '2025-02-07', '2025-02-04'),

('BN165', '123456789165', N'Hoàng Văn Lực', '1983-09-22', N'Nam', N'Tài xế', N'Kinh', NULL, N'71 Nguyễn Thị Minh Khai, Q1',
 'Công ty Vận tải Thành Công', N'BHYT', 'SV123456165', '2025-12-31', N'Hoàng Thị Lan', N'45 Võ Văn Tần, Q3', '0909165165',
 'mkbn165', 2165, N'Đau lưng, mỏi gối', N'K006', N'Không', '2025-02-08', '2025-02-05'),

('BN166', '123456789166', N'Võ Thị Mai', '1995-11-13', N'Nữ', N'Sinh viên', N'Kinh', NULL, N'234 Hai Bà Trưng, Q1',
 'ĐH Khoa học Tự nhiên', N'BHYT', 'SV123456166', '2025-12-31', N'Võ Văn Long', N'67 Nguyễn Du, Q1', '0909166166',
 'mkbn166', 1166, N'Sốt nhẹ, đau họng', N'K004', N'Không', '2025-02-09', '2025-02-06'),

('BN167', '123456789167', N'Ngô Văn Cường', '1988-10-05', N'Nam', N'Kỹ thuật viên', N'Kinh', NULL, N'77 Nguyễn Đình Chiểu, Q3',
 'Trung tâm CNTT ABC', N'BHYT', 'SV123456167', '2025-12-31', N'Ngô Thị Kim', N'88 Tôn Thất Tùng, Q1', '0909167167',
 'mkbn167', 1167, N'Mất ngủ, đau đầu', N'K008', N'Có', '2025-02-10', '2025-02-07'),

('BN168', '123456789168', N'Phạm Thị Loan', '1993-07-17', N'Nữ', N'Công nhân', N'Kinh', NULL, N'19 Nguyễn Văn Thủ, Q1',
 'Công ty Dệt may Hòa Phát', N'BHYT', 'SV123456168', '2025-12-31', N'Phạm Văn Toàn', N'27 Bạch Đằng, Q1', '0909168168',
 'mkbn168', 1168, N'Chóng mặt, tụt huyết áp', N'K009', N'Không', '2025-02-11', '2025-02-08'),

('BN169', '123456789169', N'Đặng Minh Khoa', '1986-03-28', N'Nam', N'IT support', N'Kinh', NULL, N'66 Pasteur, Q1',
 'Công ty Phần mềm ETech', N'BHYT', 'SV123456169', '2025-12-31', N'Đặng Thị Lý', N'11 Tân Cảng, Q2', '0909169169',
 'mkbn169', 1169, N'Đau dạ dày', N'K010', N'Có', '2025-02-12', '2025-02-09'),

('BN170', '123456789170', N'Trịnh Thị Thu', '1991-05-02', N'Nữ', N'Bán hàng', N'Kinh', NULL, N'29 Nguyễn Trãi, Q5',
 'Siêu thị Coopmart', N'BHYT', 'SV123456170', '2025-12-31', N'Trịnh Văn Tâm', N'98 Nguyễn Văn Linh, Q7', '0909170170',
 'mkbn170', 2170, N'Cảm cúm, hắt hơi', N'K007', N'Không', '2025-02-13', '2025-02-10'),

 ('BN171', '123456789171', N'Nguyễn Hữu Tâm', '1984-03-12', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'12 Lý Tự Trọng, Q1',
 'Công ty Xây dựng Hòa Bình', N'BHYT', 'SV123456171', '2025-12-31', N'Lê Thị Thu', N'56 Nguyễn Thị Minh Khai', '0909171171',
 'mkbn171', 1171, N'Đau đầu, chóng mặt', N'K002', N'Không', '2025-03-02', '2025-03-01'),

('BN172', '123456789172', N'Lê Thị Yến', '1990-08-22', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'21 Trần Quốc Toản, Q3',
 'THPT Nguyễn Du', N'BHYT', 'SV123456172', '2025-12-31', N'Lê Văn Minh', N'45 Bùi Viện', '0909172172',
 'mkbn172', 2172, N'Ho, sốt nhẹ', N'K004', N'Có', '2025-03-03', '2025-03-01'),

('BN173', '123456789173', N'Phan Văn Đức', '1981-12-11', N'Nam', N'Nhân viên IT', N'Kinh', NULL, N'73 Nguyễn Đình Chiểu',
 'Công ty Phần mềm Việt', N'BHYT', 'SV123456173', '2025-12-31', N'Trần Thị Lan', N'12 Hồng Bàng', '0909173173',
 'mkbn173', 2173, N'Sốt cao, đau họng', N'K001', N'Không', '2025-03-05', '2025-03-02'),

('BN174', '123456789174', N'Trần Thị Vân', '1996-02-17', N'Nữ', N'Nhân viên văn phòng', N'Kinh', NULL, N'45 Phan Xích Long',
 'Công ty TNHH Ánh Dương', N'BHYT', 'SV123456174', '2025-12-31', N'Trần Văn Hưng', N'92 Tân Kỳ Tân Quý', '0909174174',
 'mkbn174', 2174, N'Buồn nôn, đau bụng', N'K003', N'Không', '2025-03-06', '2025-03-02'),

('BN175', '123456789175', N'Đặng Minh Phúc', '1993-06-19', N'Nam', N'Tài xế', N'Kinh', NULL, N'11 Hoàng Sa, Q1',
 'Công ty vận tải Thành Phát', N'BHYT', 'SV123456175', '2025-12-31', N'Đặng Thị Xuân', N'13 Cộng Hòa', '0909175175',
 'mkbn175', 2175, N'Đau lưng, mỏi cổ', N'K009', N'Có', '2025-03-08', '2025-03-03'),

('BN176', '123456789176', N'Tạ Thị Hạnh', '1989-07-27', N'Nữ', N'Kế toán', N'Kinh', NULL, N'28 Điện Biên Phủ, Q1',
 'Công ty TNHH Hoàng Gia', N'BHYT', 'SV123456176', '2025-12-31', N'Tạ Văn Lâm', N'38 Trường Sa', '0909176176',
 'mkbn176', 1176, N'Cảm lạnh, hắt hơi', N'K010', N'Không', '2025-03-09', '2025-03-03'),

('BN177', '123456789177', N'Lý Văn Phong', '1985-11-05', N'Nam', N'Công nhân', N'Kinh', NULL, N'49 Tôn Đức Thắng',
 'Nhà máy May Sài Gòn', N'BHYT', 'SV123456177', '2025-12-31', N'Lý Thị Hường', N'60 Bình Giã', '0909177177',
 'mkbn177', 1177, N'Tiêu chảy, mất nước', N'K006', N'Không', '2025-03-10', '2025-03-04'),

('BN178', '123456789178', N'Trịnh Ngọc Quỳnh', '1992-01-08', N'Nữ', N'Nhân viên ngân hàng', N'Kinh', NULL, N'68 Lê Văn Sỹ',
 'Ngân hàng ACB', N'BHYT', 'SV123456178', '2025-12-31', N'Trịnh Văn Nam', N'19 Đinh Tiên Hoàng', '0909178178',
 'mkbn178', 1178, N'Mất ngủ, mệt mỏi', N'K008', N'Có', '2025-03-12', '2025-03-05'),

('BN179', '123456789179', N'Ngô Thị Bích', '1980-09-14', N'Nữ', N'Nội trợ', N'Kinh', NULL, N'31 Bạch Đằng, Q1',
 'Tự do', N'BHYT', 'SV123456179', '2025-12-31', N'Ngô Văn Tâm', N'45 Lý Thường Kiệt', '0909179179',
 'mkbn179', 1179, N'Đau bụng kinh, mỏi người', N'K005', N'Không', '2025-03-14', '2025-03-06'),

('BN180', '123456789180', N'Phạm Đức Khánh', '1991-04-10', N'Nam', N'Nhân viên bảo trì', N'Kinh', NULL, N'89 Nguyễn Kiệm',
 'Công ty TNHH Khánh Nam', N'BHYT', 'SV123456180', '2025-12-31', N'Phạm Văn Long', N'34 Tân Hóa', '0909180180',
 'mkbn180', 1180, N'Viêm họng, sốt nhẹ', N'K007', N'Không', '2025-03-16', '2025-03-06'),

 ('BN181', '123456789181', N'Phan Thị Lan', '1987-05-12', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'101 Lê Lợi, Q1',
 'Trường THPT Nguyễn Huệ', N'BHYT', 'SV123456181', '2025-12-31', N'Phan Văn Hải', N'25 Nguyễn Trãi', '0909181181',
 'mkbn181', 2181, N'Sốt cao, đau đầu', N'K001', N'Có', '2025-04-01', '2025-04-01'),

('BN182', '123456789182', N'Nguyễn Văn An', '1992-11-22', N'Nam', N'Công nhân', N'Kinh', NULL, N'22 Trần Hưng Đạo',
 'Nhà máy Inox Sài Gòn', N'BHYT', 'SV123456182', '2025-12-31', N'Nguyễn Thị Hoa', N'89 Phan Đình Phùng', '0909182182',
 'mkbn182', 2182, N'Ho kéo dài', N'K002', N'Không', '2025-04-02', '2025-04-01'),

('BN183', '123456789183', N'Lê Thị Thu', '1984-03-10', N'Nữ', N'Kế toán', N'Kinh', NULL, N'55 Điện Biên Phủ',
 'Công ty TNHH An Phát', N'BHYT', 'SV123456183', '2025-12-31', N'Lê Văn Bình', N'12 Nguyễn Hữu Cảnh', '0909183183',
 'mkbn183', 2183, N'Đau bụng, mệt mỏi', N'K003', N'Có', '2025-04-03', '2025-04-02'),

('BN184', '123456789184', N'Phạm Văn Hoàng', '1990-07-21', N'Nam', N'Nhân viên IT', N'Kinh', NULL, N'66 Nguyễn Thái Học',
 'Công ty Phần mềm Sài Gòn', N'BHYT', 'SV123456184', '2025-12-31', N'Phạm Thị Hoa', N'78 Lý Thường Kiệt', '0909184184',
 'mkbn184', 1184, N'Đau họng, sốt nhẹ', N'K004', N'Không', '2025-04-04', '2025-04-02'),

('BN185', '123456789185', N'Trần Thị Mai', '1986-12-05', N'Nữ', N'Nhân viên văn phòng', N'Kinh', NULL, N'44 Phan Xích Long',
 'Công ty TNHH Hoàng Gia', N'BHYT', 'SV123456185', '2025-12-31', N'Trần Văn Nam', N'98 Bình Giã', '0909185185',
 'mkbn185', 2185, N'Chóng mặt, buồn nôn', N'K005', N'Có', '2025-04-05', '2025-04-03'),

('BN186', '123456789186', N'Ngô Văn Trung', '1983-04-15', N'Nam', N'Tài xế', N'Kinh', NULL, N'37 Hoàng Sa',
 'Công ty Vận tải Thành Phát', N'BHYT', 'SV123456186', '2025-12-31', N'Ngô Thị Hồng', N'15 Cộng Hòa', '0909186186',
 'mkbn186', 1186, N'Đau lưng, mỏi vai', N'K006', N'Không', '2025-04-06', '2025-04-03'),

('BN187', '123456789187', N'Tạ Thị Hương', '1991-09-28', N'Nữ', N'Nhân viên ngân hàng', N'Kinh', NULL, N'28 Điện Biên Phủ',
 'Ngân hàng Vietcombank', N'BHYT', 'SV123456187', '2025-12-31', N'Tạ Văn Long', N'38 Trường Sa', '0909187187',
 'mkbn187', 1187, N'Mệt mỏi, mất ngủ', N'K007', N'Không', '2025-04-07', '2025-04-04'),

('BN188', '123456789188', N'Lý Văn Phước', '1987-01-19', N'Nam', N'Công nhân', N'Kinh', NULL, N'49 Tôn Đức Thắng',
 'Nhà máy May Sài Gòn', N'BHYT', 'SV123456188', '2025-12-31', N'Lý Thị Hương', N'60 Bình Giã', '0909188188',
 'mkbn188', 2188, N'Tiêu chảy', N'K008', N'Có', '2025-04-08', '2025-04-04'),

('BN189', '123456789189', N'Trịnh Ngọc Anh', '1992-10-02', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'68 Lê Văn Sỹ',
 'Trường Tiểu học Sao Mai', N'BHYT', 'SV123456189', '2025-12-31', N'Trịnh Văn Nam', N'19 Đinh Tiên Hoàng', '0909189189',
 'mkbn189', 2189, N'Đau đầu, chóng mặt', N'K009', N'Không', '2025-04-09', '2025-04-05'),

('BN190', '123456789190', N'Ngô Thị Bích', '1985-06-14', N'Nữ', N'Nội trợ', N'Kinh', NULL, N'31 Bạch Đằng',
 'Tự do', N'BHYT', 'SV123456190', '2025-12-31', N'Ngô Văn Tâm', N'45 Lý Thường Kiệt', '0909190190',
 'mkbn190', 1190, N'Đau bụng, mệt mỏi', N'K010', N'Có', '2025-04-10', '2025-04-05'),

 ('BN191', '123456789191', N'Phạm Đức Khánh', '1990-04-10', N'Nam', N'Nhân viên bảo trì', N'Kinh', NULL, N'89 Nguyễn Kiệm',
 'Công ty TNHH Khánh Nam', N'BHYT', 'SV123456191', '2025-12-31', N'Phạm Văn Long', N'34 Tân Hóa', '0909191191',
 'mkbn191', 1191, N'Viêm họng', N'K001', N'Không', '2025-04-11', '2025-04-06'),

('BN192', '123456789192', N'Nguyễn Văn Bình', '1983-07-25', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'23 Nguyễn Thị Minh Khai',
 'Công ty Điện lực', N'BHYT', 'SV123456192', '2025-12-31', N'Nguyễn Thị Mai', N'89 Phan Đình Phùng', '0909192192',
 'mkbn192', 1192, N'Đau lưng, mỏi vai', N'K002', N'Có', '2025-04-12', '2025-04-06'),

('BN193', '123456789193', N'Phạm Thị Hương', '1988-11-13', N'Nữ', N'Nhân viên văn phòng', N'Kinh', NULL, N'66 Điện Biên Phủ',
 'Công ty TNHH An Phát', N'BHYT', 'SV123456193', '2025-12-31', N'Phạm Văn Bình', N'12 Nguyễn Hữu Cảnh', '0909193193',
 'mkbn193', 1193, N'Cảm lạnh, sốt nhẹ', N'K003', N'Không', '2025-04-13', '2025-04-07'),

('BN194', '123456789194', N'Trần Văn Nam', '1989-08-30', N'Nam', N'Tài xế', N'Kinh', NULL, N'77 Hoàng Sa',
 'Công ty Vận tải Thành Phát', N'BHYT', 'SV123456194', '2025-12-31', N'Trần Thị Hồng', N'15 Cộng Hòa', '0909194194',
 'mkbn194', 1194, N'Đau đầu, chóng mặt', N'K004', N'Có', '2025-04-14', '2025-04-07'),

('BN195', '123456789195', N'Tạ Thị Hồng', '1985-02-17', N'Nữ', N'Nhân viên ngân hàng', N'Kinh', NULL, N'28 Điện Biên Phủ',
 'Ngân hàng Vietcombank', N'BHYT', 'SV123456195', '2025-12-31', N'Tạ Văn Long', N'38 Trường Sa', '0909195195',
 'mkbn195', 2195, N'Mệt mỏi, mất ngủ', N'K005', N'Không', '2025-04-15', '2025-04-08'),

('BN196', '123456789196', N'Lý Văn Phong', '1987-01-09', N'Nam', N'Công nhân', N'Kinh', NULL, N'49 Tôn Đức Thắng',
 'Nhà máy May Sài Gòn', N'BHYT', 'SV123456196', '2025-12-31', N'Lý Thị Hường', N'60 Bình Giã', '0909196196',
 'mkbn196', 2196, N'Tiêu chảy', N'K006', N'Có', '2025-04-16', '2025-04-08'),

('BN197', '123456789197', N'Trịnh Ngọc Quỳnh', '1991-06-08', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'68 Lê Văn Sỹ',
 'Trường Tiểu học Sao Mai', N'BHYT', 'SV123456197', '2025-12-31', N'Trịnh Văn Nam', N'19 Đinh Tiên Hoàng', '0909197197',
 'mkbn197', 1197, N'Đau đầu, chóng mặt', N'K007', N'Không', '2025-04-17', '2025-04-09'),

('BN198', '123456789198', N'Ngô Thị Bích', '1985-10-14', N'Nữ', N'Nội trợ', N'Kinh', NULL, N'31 Bạch Đằng',
 'Tự do', N'BHYT', 'SV123456198', '2025-12-31', N'Ngô Văn Tâm', N'45 Lý Thường Kiệt', '0909198198',
 'mkbn198', 1198, N'Đau bụng, mệt mỏi', N'K008', N'Có', '2025-04-18', '2025-04-09'),

('BN199', '123456789199', N'Phạm Đức Minh', '1990-03-19', N'Nam', N'Nhân viên bảo trì', N'Kinh', NULL, N'89 Nguyễn Kiệm',
 'Công ty TNHH Khánh Nam', N'BHYT', 'SV123456199', '2025-12-31', N'Phạm Văn Long', N'34 Tân Hóa', '0909199199',
 'mkbn199', 1199, N'Viêm họng', N'K009', N'Không', '2025-04-19', '2025-04-10'),

('BN200', '123456789200', N'Nguyễn Văn Long', '1983-12-25', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'23 Nguyễn Thị Minh Khai',
 'Công ty Điện lực', N'BHYT', 'SV123456200', '2025-12-31', N'Nguyễn Thị Mai', N'89 Phan Đình Phùng', '0909200200',
 'mkbn200', 2200, N'Đau lưng, mỏi vai', N'K010', N'Có', '2025-04-20', '2025-04-10');




 INSERT INTO HSBA (MaHSBA, NgayTao, TrangThai, Khoa, NguoiTao, MaBN)
VALUES 
('HSBA001', '2025-02-01', N'Đang điều trị', 'K001', 'BS001', 'BN001'),
('HSBA002', '2025-02-02', N'Đã điều trị xong', 'K002', 'BS002', 'BN002'),
('HSBA003', '2025-02-03', N'Đang điều trị', 'K003', 'BS003', 'BN003'),
('HSBA004', '2025-02-04', N'Đã kết quả xét nghiệm', 'K004', 'BS004', 'BN004'),
('HSBA005', '2025-02-05', N'Đã điều trị xong', 'K005', 'BS005', 'BN005'),
('HSBA006', '2025-02-06', N'Đang điều trị', 'K001', 'BS006', 'BN006'),
('HSBA007', '2025-02-07', N'Đã điều trị xong', 'K002', 'BS007', 'BN007'),
('HSBA008', '2025-02-08', N'Đã kết quả xét nghiệm', 'K003', 'BS008', 'BN008'),
('HSBA009', '2025-02-09', N'Đang điều trị', 'K001', 'BS009', 'BN009'),
('HSBA010', '2025-02-10', N'Đã điều trị xong', 'K005', 'BS010', 'BN010'),
('HSBA011', '2025-02-11', N'Đã kết quả xét nghiệm', 'K001', 'BS011', 'BN011'),
('HSBA012', '2025-02-12', N'Đang điều trị', 'K002', 'BS012', 'BN012'),
('HSBA013', '2025-02-13', N'Đã điều trị xong', 'K001', 'BS013', 'BN013'),
('HSBA014', '2025-02-14', N'Đã kết quả xét nghiệm', 'K003', 'BS014', 'BN014'),
('HSBA015', '2025-02-15', N'Đang điều trị', 'K003', 'BS015', 'BN015'),
('HSBA016', '2025-02-16', N'Đã điều trị xong', 'K001', 'BS016', 'BN016'),
('HSBA017', '2025-02-17', N'Đã kết quả xét nghiệm', 'K002', 'BS017', 'BN017'),
('HSBA018', '2025-02-18', N'Đang điều trị', 'K003', 'BS018', 'BN018'),
('HSBA019', '2025-02-19', N'Đã điều trị xong', 'K001', 'BS019', 'BN019'),
('HSBA020', '2025-02-20', N'Đã kết quả xét nghiệm', 'K002', 'BS020', 'BN020'),
('HSBA021', '2025-02-21', N'Đang điều trị', 'K001', 'BS021', 'BN021'),
('HSBA022', '2025-02-22', N'Đã điều trị xong', 'K002', 'BS001', 'BN022'),
('HSBA023', '2025-02-23', N'Đã kết quả xét nghiệm', 'K003', 'BS002', 'BN023'),
('HSBA024', '2025-02-24', N'Đang điều trị', 'K003', 'BS003', 'BN024'),
('HSBA025', '2025-02-25', N'Đã điều trị xong', 'K005', 'BS004', 'BN025'),
('HSBA026', '2025-02-26', N'Đã kết quả xét nghiệm', 'K001', 'BS005', 'BN026'),
('HSBA027', '2025-02-27', N'Đang điều trị', 'K002', 'BS006', 'BN027'),
('HSBA028', '2025-02-28', N'Đã điều trị xong', 'K003', 'BS007', 'BN028'),
('HSBA029', '2025-03-29', N'Đã kết quả xét nghiệm', 'K001', 'BS008', 'BN029'),
('HSBA030', '2025-03-30', N'Đang điều trị', 'K003', 'BS009', 'BN030'),
('HSBA031', '2025-03-01', N'Đã điều trị xong', 'K001', 'BS010', 'BN031'),
('HSBA032', '2025-03-02', N'Đã kết quả xét nghiệm', 'K002', 'BS011', 'BN032'),
('HSBA033', '2025-03-03', N'Đang điều trị', 'K003', 'BS012', 'BN033'),
('HSBA034', '2025-03-04', N'Đã điều trị xong', 'K002', 'BS013', 'BN034'),
('HSBA035', '2025-03-05', N'Đã kết quả xét nghiệm', 'K005', 'BS014', 'BN035'),
('HSBA036', '2025-03-06', N'Đang điều trị', 'K001', 'BS015', 'BN036'),
('HSBA037', '2025-03-07', N'Đã điều trị xong', 'K002', 'BS016', 'BN037'),
('HSBA038', '2025-03-08', N'Đã kết quả xét nghiệm', 'K003', 'BS017', 'BN038'),
('HSBA039', '2025-03-09', N'Đang điều trị', 'K004', 'BS018', 'BN039'),
('HSBA040', '2025-03-10', N'Đã điều trị xong', 'K005', 'BS019', 'BN040'),
('HSBA041', '2025-03-11', N'Đã kết quả xét nghiệm', 'K001', 'BS020', 'BN041'),
('HSBA042', '2025-03-12', N'Đang điều trị', 'K002', 'BS021', 'BN042'),
('HSBA043', '2025-03-13', N'Đã điều trị xong', 'K003', 'BS001', 'BN043'),
('HSBA044', '2025-03-14', N'Đã kết quả xét nghiệm', 'K004', 'BS002', 'BN044'),
('HSBA045', '2025-03-15', N'Đang điều trị', 'K002', 'BS003', 'BN045'),
('HSBA046', '2025-03-16', N'Đã điều trị xong', 'K001', 'BS004', 'BN046'),
('HSBA047', '2025-03-17', N'Đã kết quả xét nghiệm', 'K002', 'BS005', 'BN047'),
('HSBA048', '2025-03-18', N'Đang điều trị', 'K003', 'BS006', 'BN048'),
('HSBA049', '2025-03-19', N'Đã điều trị xong', 'K004', 'BS007', 'BN049'),
('HSBA050', '2025-03-20', N'Đã kết quả xét nghiệm', 'K005', 'BS008', 'BN050'),
('HSBA051', '2025-03-21', N'Đang điều trị', 'K001', 'BS009', 'BN051'),
('HSBA052', '2025-03-22', N'Đã điều trị xong', 'K002', 'BS010', 'BN052'),
('HSBA053', '2025-03-23', N'Đã kết quả xét nghiệm', 'K003', 'BS011', 'BN053'),
('HSBA054', '2025-03-24', N'Đang điều trị', 'K003', 'BS012', 'BN054'),
('HSBA055', '2025-03-25', N'Đã điều trị xong', 'K005', 'BS013', 'BN055'),
('HSBA056', '2025-03-26', N'Đã kết quả xét nghiệm', 'K001', 'BS014', 'BN056'),
('HSBA057', '2025-03-27', N'Đang điều trị', 'K002', 'BS015', 'BN057'),
('HSBA058', '2025-03-28', N'Đã điều trị xong', 'K003', 'BS016', 'BN058'),
('HSBA059', '2025-03-29', N'Đã kết quả xét nghiệm', 'K004', 'BS017', 'BN059'),
('HSBA060', '2025-03-30', N'Đang điều trị', 'K005', 'BS018', 'BN060'),
('HSBA061', '2025-03-31', N'Đã điều trị xong', 'K001', 'BS019', 'BN061'),
('HSBA062', '2025-04-01', N'Đã kết quả xét nghiệm', 'K002', 'BS020', 'BN062'),
('HSBA063', '2025-04-02', N'Đang điều trị', 'K003', 'BS021', 'BN063'),
('HSBA064', '2025-04-03', N'Đã điều trị xong', 'K004', 'BS001', 'BN064'),
('HSBA065', '2025-04-04', N'Đã kết quả xét nghiệm', 'K005', 'BS002', 'BN065'),
('HSBA066', '2025-04-05', N'Đang điều trị', 'K001', 'BS003', 'BN066'),
('HSBA067', '2025-04-06', N'Đã điều trị xong', 'K002', 'BS004', 'BN067'),
('HSBA068', '2025-04-07', N'Đã kết quả xét nghiệm', 'K003', 'BS005', 'BN068'),
('HSBA069', '2025-04-08', N'Đang điều trị', 'K004', 'BS006', 'BN069'),
('HSBA070', '2025-04-09', N'Đã điều trị xong', 'K005', 'BS007', 'BN070'),
('HSBA071', '2025-04-10', N'Đã kết quả xét nghiệm', 'K001', 'BS008', 'BN001'),
('HSBA072', '2025-04-11', N'Đang điều trị', 'K002', 'BS009', 'BN002'),
('HSBA073', '2025-04-12', N'Đã điều trị xong', 'K003', 'BS010', 'BN003'),
('HSBA074', '2025-04-13', N'Đã kết quả xét nghiệm', 'K004', 'BS011', 'BN004'),
('HSBA075', '2025-04-14', N'Đang điều trị', 'K002', 'BS012', 'BN005'),
('HSBA076', '2025-04-15', N'Đã điều trị xong', 'K001', 'BS013', 'BN006'),
('HSBA077', '2025-04-16', N'Đã kết quả xét nghiệm', 'K002', 'BS014', 'BN007'),
('HSBA078', '2025-04-17', N'Đang điều trị', 'K001', 'BS015', 'BN008'),
('HSBA079', '2025-04-18', N'Đã điều trị xong', 'K003', 'BS016', 'BN009'),
('HSBA080', '2025-04-19', N'Đã kết quả xét nghiệm', 'K005', 'BS017', 'BN010'),
('HSBA081', '2025-04-20', N'Đang điều trị', 'K001', 'BS018', 'BN011'),
('HSBA082', '2025-04-21', N'Đã điều trị xong', 'K002', 'BS019', 'BN012'),
('HSBA083', '2025-04-22', N'Đã kết quả xét nghiệm', 'K003', 'BS020', 'BN013'),
('HSBA084', '2025-04-23', N'Đang điều trị', 'K004', 'BS021', 'BN014'),
('HSBA085', '2025-04-24', N'Đã điều trị xong', 'K001', 'BS001', 'BN015'),
('HSBA086', '2025-04-25', N'Đã kết quả xét nghiệm', 'K001', 'BS002', 'BN016'),
('HSBA087', '2025-04-26', N'Đang điều trị', 'K002', 'BS003', 'BN017'),
('HSBA088', '2025-04-27', N'Đã điều trị xong', 'K003', 'BS004', 'BN018'),
('HSBA089', '2025-04-28', N'Đã kết quả xét nghiệm', 'K004', 'BS005', 'BN019'),
('HSBA090', '2025-04-29', N'Đang điều trị', 'K001', 'BS006', 'BN020'),
('HSBA091', '2025-04-30', N'Đã điều trị xong', 'K001', 'BS007', 'BN021'),
('HSBA092', '2025-05-01', N'Đã kết quả xét nghiệm', 'K002', 'BS008', 'BN022'),
('HSBA093', '2025-05-02', N'Đang điều trị', 'K003', 'BS009', 'BN023'),
('HSBA094', '2025-05-03', N'Đã điều trị xong', 'K002', 'BS010', 'BN024'),
('HSBA095', '2025-05-04', N'Đã kết quả xét nghiệm', 'K002', 'BS011', 'BN025'),
('HSBA096', '2025-05-05', N'Đang điều trị', 'K001', 'BS012', 'BN026'),
('HSBA097', '2025-05-06', N'Đã điều trị xong', 'K002', 'BS013', 'BN027'),
('HSBA098', '2025-05-07', N'Đã kết quả xét nghiệm', 'K003', 'BS014', 'BN028'),
('HSBA099', '2025-05-08', N'Đang điều trị', 'K004', 'BS015', 'BN029'),
('HSBA100', '2025-05-09', N'Đã điều trị xong', 'K005', 'BS016', 'BN030'),
('HSBA101', '2025-05-10', N'Đã kết quả xét nghiệm', 'K001', 'BS017', 'BN031'),
('HSBA102', '2025-05-11', N'Đang điều trị', 'K002', 'BS018', 'BN032'),
('HSBA103', '2025-05-12', N'Đã điều trị xong', 'K003', 'BS019', 'BN033'),
('HSBA104', '2025-05-13', N'Đã kết quả xét nghiệm', 'K004', 'BS020', 'BN034'),
('HSBA105', '2025-05-14', N'Đang điều trị', 'K005', 'BS021', 'BN035'),
('HSBA106', '2025-05-15', N'Đã điều trị xong', 'K001', 'BS001', 'BN036'),
('HSBA107', '2025-05-16', N'Đã kết quả xét nghiệm', 'K002', 'BS002', 'BN037'),
('HSBA108', '2025-05-17', N'Đang điều trị', 'K003', 'BS003', 'BN038'),
('HSBA109', '2025-05-18', N'Đã điều trị xong', 'K004', 'BS004', 'BN039'),
('HSBA110', '2025-05-19', N'Đã kết quả xét nghiệm', 'K005', 'BS005', 'BN040');


INSERT INTO TaiKham (MaHSBA, TGTaiKham, TrangThai)
VALUES 
('HSBA001', '2025-03-10', N'Đã tái khám'),
('HSBA002', '2025-03-22', N'Đã tái khám'),
('HSBA003', '2025-04-05', N'Đã tái khám'),
('HSBA004', '2025-04-18', N'Chưa tái khám'),
('HSBA005', '2025-05-03', N'Đã tái khám'),
('HSBA006', '2025-03-02', N'Đã tái khám'),
('HSBA007', '2025-03-04', N'Đã tái khám'),
('HSBA008', '2025-03-06', N'Chưa tái khám'),
('HSBA009', '2025-03-08', N'Đã tái khám'),
('HSBA010', '2025-03-10', N'Đã tái khám'),
('HSBA011', '2025-03-12', N'Chưa tái khám'),
('HSBA012', '2025-03-14', N'Đã tái khám'),
('HSBA013', '2025-03-16', N'Đã tái khám'),
('HSBA014', '2025-03-18', N'Chưa tái khám'),
('HSBA015', '2025-03-20', N'Đã tái khám'),
('HSBA016', '2025-03-22', N'Đã tái khám'),
('HSBA017', '2025-03-24', N'Chưa tái khám'),
('HSBA018', '2025-03-26', N'Đã tái khám'),
('HSBA019', '2025-03-28', N'Đã tái khám'),
('HSBA020', '2025-03-30', N'Chưa tái khám'),
('HSBA021', '2025-04-01', N'Đã tái khám'),
('HSBA022', '2025-04-03', N'Đã tái khám'),
('HSBA023', '2025-04-05', N'Chưa tái khám'),
('HSBA024', '2025-04-07', N'Đã tái khám'),
('HSBA025', '2025-04-09', N'Đã tái khám'),
('HSBA026', '2025-04-11', N'Chưa tái khám'),
('HSBA027', '2025-04-13', N'Đã tái khám'),
('HSBA028', '2025-04-15', N'Đã tái khám'),
('HSBA029', '2025-04-17', N'Chưa tái khám'),
('HSBA030', '2025-04-19', N'Đã tái khám'),
('HSBA031', '2025-04-21', N'Đã tái khám'),
('HSBA032', '2025-04-23', N'Chưa tái khám'),
('HSBA033', '2025-04-25', N'Đã tái khám'),
('HSBA034', '2025-04-27', N'Đã tái khám'),
('HSBA035', '2025-04-29', N'Chưa tái khám'),
('HSBA036', '2025-05-01', N'Đã tái khám'),
('HSBA037', '2025-05-03', N'Đã tái khám'),
('HSBA038', '2025-05-05', N'Chưa tái khám'),
('HSBA039', '2025-05-07', N'Đã tái khám'),
('HSBA040', '2025-05-09', N'Đã tái khám'),
('HSBA041', '2025-05-11', N'Chưa tái khám'),
('HSBA042', '2025-05-13', N'Đã tái khám'),
('HSBA043', '2025-05-15', N'Đã tái khám'),
('HSBA044', '2025-05-17', N'Chưa tái khám'),
('HSBA045', '2025-05-19', N'Đã tái khám'),
('HSBA046', '2025-05-21', N'Đã tái khám'),
('HSBA047', '2025-05-23', N'Chưa tái khám'),
('HSBA048', '2025-05-25', N'Đã tái khám'),
('HSBA049', '2025-05-27', N'Đã tái khám'),
('HSBA050', '2025-05-29', N'Chưa tái khám'),

('HSBA051', '2025-05-31', N'Đã tái khám'),
('HSBA052', '2025-05-30', N'Đã tái khám'),
('HSBA053', '2025-05-28', N'Chưa tái khám'),
('HSBA054', '2025-05-26', N'Đã tái khám'),
('HSBA055', '2025-05-24', N'Đã tái khám'),
('HSBA056', '2025-03-01', N'Chưa tái khám'),
('HSBA057', '2025-03-03', N'Đã tái khám'),
('HSBA058', '2025-03-05', N'Đã tái khám'),
('HSBA059', '2025-03-07', N'Chưa tái khám'),
('HSBA060', '2025-03-09', N'Đã tái khám'),
('HSBA061', '2025-03-11', N'Đã tái khám'),
('HSBA062', '2025-03-13', N'Chưa tái khám'),
('HSBA063', '2025-03-15', N'Đã tái khám'),
('HSBA064', '2025-03-17', N'Đã tái khám'),
('HSBA065', '2025-03-19', N'Chưa tái khám'),
('HSBA066', '2025-03-21', N'Đã tái khám'),
('HSBA067', '2025-03-23', N'Đã tái khám'),
('HSBA068', '2025-03-25', N'Chưa tái khám'),
('HSBA069', '2025-03-27', N'Đã tái khám'),
('HSBA070', '2025-03-29', N'Đã tái khám'),
('HSBA071', '2025-04-02', N'Chưa tái khám'),
('HSBA072', '2025-04-04', N'Đã tái khám'),
('HSBA073', '2025-04-06', N'Đã tái khám'),
('HSBA074', '2025-04-08', N'Chưa tái khám'),
('HSBA075', '2025-04-10', N'Đã tái khám'),
('HSBA076', '2025-04-12', N'Đã tái khám'),
('HSBA077', '2025-04-14', N'Chưa tái khám'),
('HSBA078', '2025-04-16', N'Đã tái khám'),
('HSBA079', '2025-04-18', N'Đã tái khám'),
('HSBA080', '2025-04-20', N'Chưa tái khám'),
('HSBA081', '2025-04-22', N'Đã tái khám'),
('HSBA082', '2025-04-24', N'Đã tái khám'),
('HSBA083', '2025-04-26', N'Chưa tái khám'),
('HSBA084', '2025-04-28', N'Đã tái khám'),
('HSBA085', '2025-04-30', N'Đã tái khám'),
('HSBA086', '2025-05-02', N'Chưa tái khám'),
('HSBA087', '2025-05-04', N'Đã tái khám'),
('HSBA088', '2025-05-06', N'Đã tái khám'),
('HSBA089', '2025-05-08', N'Chưa tái khám'),
('HSBA090', '2025-05-10', N'Đã tái khám'),
('HSBA091', '2025-05-12', N'Đã tái khám'),
('HSBA092', '2025-05-14', N'Chưa tái khám'),
('HSBA093', '2025-05-16', N'Đã tái khám'),
('HSBA094', '2025-05-18', N'Đã tái khám'),
('HSBA095', '2025-05-20', N'Chưa tái khám'),
('HSBA096', '2025-05-22', N'Đã tái khám'),
('HSBA097', '2025-05-24', N'Đã tái khám'),
('HSBA098', '2025-05-26', N'Chưa tái khám'),
('HSBA099', '2025-05-28', N'Đã tái khám'),
('HSBA100', '2025-05-30', N'Đã tái khám'),
('HSBA101', '2025-05-29', N'Chưa tái khám'),
('HSBA102', '2025-05-27', N'Đã tái khám'),
('HSBA103', '2025-05-25', N'Đã tái khám'),
('HSBA104', '2025-05-23', N'Chưa tái khám'),
('HSBA105', '2025-05-21', N'Đã tái khám');


INSERT INTO XetNghiem (MaXN, LoaiXN)
VALUES 
('XN001', N'Xét nghiệm máu'),
('XN002', N'Xét nghiệm nước tiểu'),
('XN003', N'Xét nghiệm X-ray'),
('XN004', N'Xét nghiệm siêu âm'),
('XN005', N'Xét nghiệm PCR'),
('XN006', N'Xét nghiệm huyết học'),
('XN007', N'Xét nghiệm sinh hóa máu'),
('XN008', N'Xét nghiệm miễn dịch'),
('XN009', N'Xét nghiệm vi sinh'),
('XN010', N'Xét nghiệm di truyền');

INSERT INTO HSBA_XetNghiem (MaHSBA, MaXN, KQXetNghiem, TgianTao, BacSyXN,AnhXetNghiem)
VALUES 
('HSBA001', 'XN001', N'Kết quả xét nghiệm máu bình thường', '2025-03-05', 'BS001', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA001', 'XN002', N'Kết quả Xét nghiệm nước tiểu bình thường', '2025-04-06', 'BS001', 'https://th.bing.com/th/id/R.307d4bf6d15046aa1346f7ad6ca7916d?rik=HNz9VWKGMaBOfw&riu=http%3a%2f%2fsan43nguyenkhang.vn%2fuploads%2ftiny_uploads%2fnt4.jpg&ehk=TOBxWIOrLJF3KglMkVXKDjM649Q3tBHoUxMKluBIEOI%3d&risl=&pid=ImgRaw&r=0'),
('HSBA002', 'XN002', N'Nước tiểu có dấu hiệu viêm', '2025-03-12', 'BS002', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA002', 'XN004', N'Kết quả xét nghiệm siêu âm bình thường', '2025-03-04', 'BS002', 'https://nld.mediacdn.vn/2018/2675394518307669936638642137990143n-crop-1515577592553.jpg'),
('HSBA003', 'XN003', N'Kết quả X-ray cho thấy có dấu hiệu vỡ xương', '2025-04-08', 'BS003', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA004', 'XN004', N'Siêu âm bình thường, không có vấn đề lớn', '2025-04-15', 'BS004', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA005', 'XN005', N'Xét nghiệm PCR âm tính với virus', '2025-05-02', 'BS005', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA006', 'XN006', N'Huyết áp bình thường', '2025-03-11', 'BS006', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA007', 'XN007', N'Nồng độ đường huyết cao hơn mức bình thường', '2025-03-13', 'BS007', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA008', 'XN008', N'Chỉ số cholesterol trong giới hạn an toàn', '2025-03-15', 'BS008', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA009', 'XN009', N'Dấu hiệu viêm phổi nhẹ trên X-ray', '2025-03-17', 'BS009', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA010', 'XN010', N'Siêu âm tim bình thường', '2025-03-19', 'BS010', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA011', 'XN001', N'Xét nghiệm máu cho thấy thiếu máu nhẹ', '2025-03-21', 'BS011', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA012', 'XN002', N'Nước tiểu sạch, không phát hiện vi khuẩn', '2025-03-23', 'BS012', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA013', 'XN003', N'Xét nghiệm sinh hóa gan bình thường', '2025-03-25', 'BS013', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA014', 'XN004', N'Chỉ số men gan tăng nhẹ', '2025-03-27', 'BS014', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA015', 'XN005', N'Xét nghiệm PCR dương tính với virus', '2025-03-29', 'BS015', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA016', 'XN006', N'X-ray khớp gối không phát hiện tổn thương', '2025-03-31', 'BS016', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA017', 'XN007', N'Siêu âm tuyến giáp bình thường', '2025-04-02', 'BS017', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA018', 'XN008', N'Xét nghiệm máu có dấu hiệu nhiễm trùng nhẹ', '2025-04-04', 'BS018', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA019', 'XN009', N'Nồng độ canxi trong máu bình thường', '2025-04-06', 'BS019', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA020', 'XN010', N'Chỉ số men tim bình thường', '2025-04-08', 'BS020', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA021', 'XN001', N'Xét nghiệm nước tiểu có máu', '2025-04-10', 'BS021', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA022', 'XN002', N'X-ray phát hiện dấu hiệu thoái hóa', '2025-04-12', 'BS001', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA023', 'XN003', N'Siêu âm ổ bụng không phát hiện bất thường', '2025-04-14', 'BS002', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA024', 'XN004', N'Xét nghiệm PCR âm tính', '2025-04-16', 'BS003', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA025', 'XN005', N'Chỉ số đường huyết tăng nhẹ', '2025-04-18', 'BS004', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA026', 'XN006', N'Xét nghiệm máu không phát hiện dấu hiệu bất thường', '2025-04-20', 'BS005', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA027', 'XN007', N'Nước tiểu sạch, không có vi khuẩn', '2025-04-22', 'BS006', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA028', 'XN008', N'X-ray phổi bình thường', '2025-04-24', 'BS007', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA029', 'XN009', N'Siêu âm tim không có tổn thương', '2025-04-26', 'BS008', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA030', 'XN010', N'Xét nghiệm máu cho thấy thiếu máu', '2025-04-28', 'BS009', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA031', 'XN001', N'Nồng độ cholesterol cao hơn bình thường', '2025-04-30', 'BS010', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA032', 'XN002', N'Dấu hiệu viêm trên X-ray khớp', '2025-05-02', 'BS011', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA033', 'XN003', N'Siêu âm tuyến giáp không phát hiện vấn đề', '2025-05-04', 'BS012', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA034', 'XN004', N'Xét nghiệm PCR dương tính', '2025-05-06', 'BS013', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA035', 'XN005', N'Chỉ số men gan bình thường', '2025-05-08', 'BS014', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA036', 'XN006', N'Xét nghiệm nước tiểu bình thường', '2025-05-10', 'BS015', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA037', 'XN007', N'X-ray phổi phát hiện tổn thương nhẹ', '2025-05-12', 'BS016', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA038', 'XN008', N'Siêu âm ổ bụng bình thường', '2025-05-14', 'BS017', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA039', 'XN009', N'Xét nghiệm máu cho thấy nhiễm trùng', '2025-05-16', 'BS018', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA040', 'XN010', N'Nồng độ canxi trong giới hạn bình thường', '2025-05-18', 'BS019', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),

('HSBA041', 'XN007', N'Xét nghiệm PCR âm tính', '2025-05-20', 'BS020', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'), 
('HSBA042', 'XN002', N'X-ray phát hiện vết nứt nhỏ', '2025-05-22', 'BS021', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'), 
('HSBA043', 'XN005', N'Siêu âm tuyến giáp bình thường', '2025-05-24', 'BS001', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA044', 'XN001', N'Xét nghiệm máu bình thường', '2025-05-26', 'BS002', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA045', 'XN010', N'Nước tiểu có dấu hiệu viêm nhẹ', '2025-05-28', 'BS003', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA046', 'XN006', N'X-ray không phát hiện tổn thương', '2025-05-30', 'BS004', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA047', 'XN004', N'Siêu âm tim bình thường', '2025-05-31', 'BS005', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA048', 'XN009', N'Xét nghiệm PCR dương tính', '2025-05-29', 'BS006', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA049', 'XN003', N'Chỉ số men gan tăng nhẹ', '2025-05-27', 'BS007', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA050', 'XN008', N'Xét nghiệm máu thiếu máu nhẹ', '2025-05-25', 'BS008', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA051', 'XN002', N'Kết quả xét nghiệm máu bình thường', '2025-03-02', 'BS009', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA052', 'XN005', N'Nước tiểu có dấu hiệu viêm nhẹ', '2025-03-04', 'BS010', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA053', 'XN001', N'X-ray cho thấy dấu hiệu gãy xương nhỏ', '2025-03-06', 'BS011', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA054', 'XN010', N'Siêu âm ổ bụng bình thường', '2025-03-08', 'BS012', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA055', 'XN003', N'PCR âm tính với virus cúm', '2025-03-10', 'BS013', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA056', 'XN007', N'Huyết áp bình thường', '2025-03-12', 'BS014', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA057', 'XN009', N'Nồng độ đường huyết cao hơn mức bình thường', '2025-03-14', 'BS015', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA058', 'XN008', N'Chỉ số cholesterol trong giới hạn an toàn', '2025-03-16', 'BS016', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA059', 'XN004', N'Dấu hiệu viêm phổi nhẹ trên X-ray', '2025-03-18', 'BS017', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA060', 'XN006', N'Siêu âm tim bình thường', '2025-03-20', 'BS018', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA061', 'XN001', N'Xét nghiệm máu cho thấy thiếu máu nhẹ', '2025-03-22', 'BS019', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA062', 'XN010', N'Nước tiểu sạch, không phát hiện vi khuẩn', '2025-03-24', 'BS020', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA063', 'XN005', N'Xét nghiệm sinh hóa gan bình thường', '2025-03-26', 'BS021', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA064', 'XN003', N'Chỉ số men gan tăng nhẹ', '2025-03-28', 'BS001', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA065', 'XN008', N'Xét nghiệm PCR dương tính với virus', '2025-03-30', 'BS002', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA066', 'XN007', N'X-ray khớp gối không phát hiện tổn thương', '2025-04-01', 'BS003', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA067', 'XN002', N'Siêu âm tuyến giáp bình thường', '2025-04-03', 'BS004', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA068', 'XN010', N'Xét nghiệm máu có dấu hiệu nhiễm trùng nhẹ', '2025-04-05', 'BS005', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA069', 'XN001', N'Nồng độ canxi trong máu bình thường', '2025-04-07', 'BS006', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA070', 'XN004', N'Chỉ số men tim bình thường', '2025-04-09', 'BS007', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA071', 'XN006', N'Xét nghiệm nước tiểu có máu', '2025-04-11', 'BS008', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA072', 'XN003', N'X-ray phát hiện dấu hiệu thoái hóa', '2025-04-13', 'BS009', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA073', 'XN009', N'Siêu âm ổ bụng không phát hiện bất thường', '2025-04-15', 'BS010', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA074', 'XN008', N'Xét nghiệm PCR âm tính', '2025-04-17', 'BS011', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA075', 'XN005', N'Chỉ số đường huyết tăng nhẹ', '2025-04-19', 'BS012', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA076', 'XN002', N'Xét nghiệm máu không phát hiện dấu hiệu bất thường', '2025-04-21', 'BS013', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA077', 'XN010', N'Nước tiểu sạch, không có vi khuẩn', '2025-04-23', 'BS014', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA078', 'XN004', N'X-ray phổi bình thường', '2025-04-25', 'BS015', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA079', 'XN007', N'Siêu âm tim không có tổn thương', '2025-04-27', 'BS016', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA080', 'XN001', N'Xét nghiệm máu cho thấy thiếu máu', '2025-04-29', 'BS017', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA081', 'XN003', N'Nồng độ cholesterol cao hơn bình thường', '2025-05-01', 'BS018', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA082', 'XN006', N'Dấu hiệu viêm trên X-ray khớp', '2025-05-03', 'BS019', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA083', 'XN009', N'Siêu âm tuyến giáp không phát hiện vấn đề', '2025-05-05', 'BS020', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA084', 'XN002', N'Xét nghiệm PCR dương tính', '2025-05-07', 'BS021', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA085', 'XN010', N'Chỉ số men gan bình thường', '2025-05-09', 'BS001', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA086', 'XN005', N'Xét nghiệm nước tiểu bình thường', '2025-05-11', 'BS002', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA087', 'XN004', N'X-ray phổi phát hiện tổn thương nhẹ', '2025-05-13', 'BS003', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA088', 'XN003', N'Siêu âm ổ bụng bình thường', '2025-05-15', 'BS004', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA089', 'XN001', N'Xét nghiệm máu cho thấy nhiễm trùng', '2025-05-17', 'BS005', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA090', 'XN008', N'Nồng độ canxi trong giới hạn bình thường', '2025-05-19', 'BS006', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA091', 'XN007', N'Xét nghiệm PCR âm tính', '2025-05-21', 'BS007', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA092', 'XN009', N'X-ray phát hiện vết nứt nhỏ', '2025-05-23', 'BS008', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA093', 'XN006', N'Siêu âm tuyến giáp bình thường', '2025-05-25', 'BS009', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA094', 'XN005', N'Xét nghiệm máu bình thường', '2025-05-27', 'BS010', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA095', 'XN002', N'Nước tiểu có dấu hiệu viêm nhẹ', '2025-05-29', 'BS011', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA096', 'XN010', N'X-ray không phát hiện tổn thương', '2025-05-31', 'BS012', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA097', 'XN004', N'Siêu âm tim bình thường', '2025-05-28', 'BS013', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA098', 'XN001', N'Xét nghiệm PCR dương tính', '2025-05-26', 'BS014', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA099', 'XN003', N'Chỉ số men gan tăng nhẹ', '2025-05-24', 'BS015', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png'),
('HSBA100', 'XN008', N'Xét nghiệm máu thiếu máu nhẹ', '2025-05-22', 'BS016', 'https://giadinh.mediacdn.vn/296230595582509056/2023/7/6/base64-1688453893588990280963-1688613312715-16886133137421684729132.png');


INSERT INTO PhieuChamSoc (MaHSBA, Ngay, DienBienBenh, YLenh, TenDieuDuong)
VALUES 
('HSBA011', '2025-03-15', N'Bệnh nhân ổn định, đã cải thiện', N'Xét nghiệm lại', 'NV001'),
('HSBA071', '2025-03-16', N'Bệnh nhân có dấu hiệu ổn định', N'Được xuất viện', 'NV002'),
('HSBA091', '2025-03-17', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiến hành phẫu thuật', 'NV003'),
('HSBA052', '2025-03-16', N'Bệnh nhân ổn định, đã cải thiện', N'Tiếp tục điều trị', 'NV004'),
('HSBA062', '2025-03-17', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiến hành phẫu thuật', 'NV005'),
('HSBA049', '2025-05-23', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV001'),
('HSBA030', '2025-05-11', N'Bệnh nhân ổn định, đã cải thiện', N'Xét nghiệm lại', 'NV002'),
('HSBA022', '2025-05-22', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiếp tục điều trị', 'NV003'),
('HSBA037', '2025-05-04', N'Bệnh nhân có dấu hiệu ổn định', N'Tiến hành phẫu thuật', 'NV004'),
('HSBA023', '2025-04-29', N'Bệnh nhân có dấu hiệu ổn định', N'Tiếp tục điều trị', 'NV005'),
('HSBA028', '2025-04-28', N'Bệnh nhân ổn định, đã cải thiện', N'Xét nghiệm lại', 'NV006'),
('HSBA028', '2025-04-21', N'Bệnh nhân ổn định, đã cải thiện', N'Ra viện sau khi điều trị xong', 'NV007'),
('HSBA037', '2025-04-04', N'Bệnh nhân có triệu chứng đau nhẹ', N'Ra viện sau khi điều trị xong', 'NV008'),
('HSBA030', '2025-04-06', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV009'),
('HSBA022', '2025-05-29', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiến hành phẫu thuật', 'NV010'),
('HSBA034', '2025-04-10', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV011'),
('HSBA001', '2025-03-12', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV012'),
('HSBA002', '2025-03-14', N'Bệnh nhân có dấu hiệu ổn định', N'Tiến hành phẫu thuật', 'NV013'),
('HSBA003', '2025-03-16', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Được xuất viện', 'NV014'),

('HSBA004', '2025-03-17', N'Bệnh nhân có triệu chứng đau nhẹ', N'Ra viện sau khi điều trị xong', 'NV015'),
('HSBA005', '2025-03-18', N'Bệnh nhân ổn định, đã cải thiện', N'Tiếp tục điều trị', 'NV016'),
('HSBA006', '2025-03-19', N'Bệnh nhân có dấu hiệu ổn định', N'Xét nghiệm lại', 'NV017'),
('HSBA007', '2025-03-20', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV018'),
('HSBA008', '2025-03-21', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Được xuất viện', 'NV019'),
('HSBA009', '2025-03-22', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiếp tục điều trị', 'NV020'),
('HSBA010', '2025-03-23', N'Bệnh nhân ổn định, đã cải thiện', N'Ra viện sau khi điều trị xong', 'NV021'),
('HSBA011', '2025-03-24', N'Bệnh nhân có dấu hiệu ổn định', N'Xét nghiệm lại', 'NV022'),
('HSBA012', '2025-03-25', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV023'),
('HSBA013', '2025-03-26', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV024'),
('HSBA014', '2025-03-27', N'Bệnh nhân có triệu chứng đau nhẹ', N'Được xuất viện', 'NV025'),
('HSBA015', '2025-03-28', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV026'),
('HSBA016', '2025-03-29', N'Bệnh nhân ổn định, đã cải thiện', N'Tiếp tục điều trị', 'NV027'),
('HSBA017', '2025-03-30', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Xét nghiệm lại', 'NV028'),
('HSBA018', '2025-04-01', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiến hành phẫu thuật', 'NV029'),
('HSBA019', '2025-04-02', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Được xuất viện', 'NV030'),
('HSBA020', '2025-04-03', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV031'),
('HSBA021', '2025-04-04', N'Bệnh nhân ổn định, đã cải thiện', N'Tiếp tục điều trị', 'NV032'),
('HSBA022', '2025-04-05', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Xét nghiệm lại', 'NV033'),
('HSBA023', '2025-04-06', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiến hành phẫu thuật', 'NV034'),
('HSBA024', '2025-04-07', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Được xuất viện', 'NV035'),
('HSBA025', '2025-04-08', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV036'),

('HSBA026', '2025-04-09', N'Bệnh nhân ổn định, đã cải thiện', N'Tiếp tục điều trị', 'NV037'),
('HSBA027', '2025-04-10', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Xét nghiệm lại', 'NV038'),
('HSBA028', '2025-04-11', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiến hành phẫu thuật', 'NV039'),
('HSBA029', '2025-04-12', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Được xuất viện', 'NV040'),
('HSBA030', '2025-04-13', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV041'),
('HSBA031', '2025-04-14', N'Bệnh nhân ổn định, đã cải thiện', N'Tiếp tục điều trị', 'NV042'),
('HSBA032', '2025-04-15', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Xét nghiệm lại', 'NV043'),
('HSBA033', '2025-04-16', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiến hành phẫu thuật', 'NV044'),
('HSBA034', '2025-04-17', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Được xuất viện', 'NV045'),
('HSBA035', '2025-04-18', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV046'),
('HSBA036', '2025-04-19', N'Bệnh nhân ổn định, đã cải thiện', N'Tiếp tục điều trị', 'NV047'),
('HSBA037', '2025-04-20', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Xét nghiệm lại', 'NV048'),
('HSBA038', '2025-04-21', N'Bệnh nhân có triệu chứng đau nhẹ', N'Tiến hành phẫu thuật', 'NV049'),
('HSBA039', '2025-04-22', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV050'),
('HSBA040', '2025-04-23', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV051'),
('HSBA041', '2025-04-24', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV052'),
('HSBA042', '2025-04-25', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV053'),
('HSBA043', '2025-04-26', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV054'),
('HSBA044', '2025-04-27', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV055'),
('HSBA045', '2025-04-28', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV056'),
('HSBA046', '2025-04-29', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV001'),
('HSBA047', '2025-04-30', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV002'),
('HSBA048', '2025-05-01', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV003'),
('HSBA049', '2025-05-02', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV004'),

('HSBA050', '2025-05-03', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV005'),
('HSBA051', '2025-05-04', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV006'),
('HSBA052', '2025-05-05', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV007'),
('HSBA053', '2025-05-06', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV008'),
('HSBA054', '2025-05-07', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV009'),
('HSBA055', '2025-05-08', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV010'),
('HSBA056', '2025-05-09', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV011'),
('HSBA057', '2025-05-10', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV012'),
('HSBA058', '2025-05-11', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV013'),
('HSBA059', '2025-05-12', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV014'),
('HSBA060', '2025-05-13', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV015'),
('HSBA061', '2025-05-14', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV016'),
('HSBA062', '2025-05-15', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV017'),
('HSBA063', '2025-05-16', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV018'),
('HSBA064', '2025-05-17', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV019'),
('HSBA065', '2025-05-18', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV020'),
('HSBA066', '2025-05-19', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV021'),
('HSBA067', '2025-05-20', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV022'),
('HSBA068', '2025-05-21', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV023'),
('HSBA069', '2025-05-22', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV024'),
('HSBA080', '2025-05-23', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV025'),
('HSBA091', '2025-05-24', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV026'),
('HSBA052', '2025-05-25', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV027'),
('HSBA063', '2025-05-26', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV028'),
('HSBA064', '2025-05-27', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV029'),
('HSBA075', '2025-05-28', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV030'),
('HSBA076', '2025-05-29', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV031'),
('HSBA077', '2025-05-30', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV032'),
('HSBA078', '2025-05-31', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV033'),
('HSBA099', '2025-05-31', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV034'),
('HSBA080', '2025-05-30', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV035'),
('HSBA081', '2025-05-29', N'Bệnh nhân đau dữ dội, cần can thiệp', N'Tiến hành phẫu thuật', 'NV036'),
('HSBA082', '2025-05-28', N'Bệnh nhân ổn định, đã cải thiện', N'Được xuất viện', 'NV037'),
('HSBA083', '2025-05-27', N'Bệnh nhân có dấu hiệu ổn định', N'Ra viện sau khi điều trị xong', 'NV038'),
('HSBA084', '2025-05-26', N'Bệnh nhân tỉnh táo, có thể ra viện', N'Tiếp tục điều trị', 'NV039'),
('HSBA085', '2025-05-25', N'Bệnh nhân có triệu chứng đau nhẹ', N'Xét nghiệm lại', 'NV040');



INSERT INTO ChanDoan (MaHSBA, NoiChuyenDen, KKB_CapCuu, TTBanDau, PhauThuat, BenhChinh, BenhKemTheo, TaiBien, BienChung, NoiTru, NgoaiTru, TaiKham, NgayTaiKham)
VALUES 
('HSBA001', N'Bệnh viện A', N'Không có', N'Tình trạng ổn định', N'Không', N'Viêm phổi', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA002', N'Bệnh viện B', N'Có', N'Tình trạng nặng', N'Có', N'Viêm đường tiết niệu', N'Viêm gan', N'Không', N'Sốt cao', N'Có', N'Không', N'Không', NULL),
('HSBA003', N'Bệnh viện C', N'Có', N'Chấn thương nặng', N'Có', N'Gãy xương', N'Không', N'Không', N'Dị ứng thuốc', N'Có', N'Không', N'Đã kết quả', '2025-04-20'),
('HSBA004', NULL, N'Không có', N'Sốt, đau nhẹ', N'Không', N'Cảm cúm', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA005', N'Bệnh viện E', N'Không có', N'Đau nhẹ', N'Không', N'Cảm cúm', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA006', NULL, N'Không có', N'Ổn định', N'Không', N'Viêm họng', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA007', N'Bệnh viện G', N'Có', N'Sốc phản vệ', N'Có', N'Dị ứng', N'Không', N'Có', N'Không', N'Có', N'Không', N'Đã kết quả', '2025-04-12'),
('HSBA008', N'Bệnh viện H', N'Không có', N'Mệt mỏi kéo dài', N'Không', N'Thiếu máu', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA009', NULL, N'Có', N'Hôn mê', N'Có', N'Chấn thương sọ não', N'Không', N'Có', N'Suy hô hấp', N'Có', N'Không', N'Đã kết quả', '2025-05-01'),
('HSBA010', N'Bệnh viện I', N'Không có', N'Sốt nhẹ', N'Không', N'Cảm cúm', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA011', NULL, N'Có', N'Đau dữ dội', N'Có', N'Viêm ruột thừa', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-04-18'),
('HSBA012', N'Bệnh viện K', N'Không có', N'Khó thở nhẹ', N'Không', N'Hen suyễn', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA013', NULL, N'Không có', N'Mệt mỏi', N'Không', N'Cảm cúm', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA014', N'Bệnh viện L', N'Có', N'Ngất xỉu', N'Không', N'Hạ đường huyết', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-05-10'),
('HSBA015', NULL, N'Không có', N'Đau đầu nhẹ', N'Không', N'Thiếu máu', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA016', N'Bệnh viện M', N'Có', N'Đau bụng dữ dội', N'Có', N'Viêm tụy cấp', N'Không', N'Có', N'Sốc', N'Có', N'Không', N'Có', '2025-05-14'),
('HSBA017', NULL, N'Không có', N'Sốt nhẹ', N'Không', N'Cảm cúm', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA018', N'Bệnh viện N', N'Không có', N'Đau ngực nhẹ', N'Không', N'Viêm phổi', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA019', NULL, N'Không có', N'Mệt mỏi sau khi làm việc nặng', N'Không', N'Tăng huyết áp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA020', N'Bệnh viện O', N'Có', N'Đau vùng bụng dưới', N'Có', N'Sỏi thận', N'Không', N'Không', N'Không', N'Có', N'Không', N'Đã kết quả', '2025-04-22'),

('HSBA021', NULL, N'Không có', N'Ho kéo dài', N'Không', N'Lao phổi', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-05-05'),
('HSBA022', N'Bệnh viện P', N'Không có', N'Ngứa da', N'Không', N'Viêm da cơ địa', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA023', NULL, N'Không có', N'Khó ngủ', N'Không', N'Rối loạn giấc ngủ', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA024', N'Bệnh viện Q', N'Có', N'Đau ngực dữ dội', N'Có', N'Nhồi máu cơ tim', N'Tăng huyết áp', N'Có', N'Suy tim', N'Có', N'Không', N'Có', '2025-04-30'),
('HSBA025', NULL, N'Không có', N'Tình trạng ổn định', N'Không', N'Cảm lạnh', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA026', N'Bệnh viện R', N'Không có', N'Đau họng', N'Không', N'Viêm họng cấp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA027', NULL, N'Không có', N'Suy nhược cơ thể', N'Không', N'Căng thẳng thần kinh', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-04-28'),
('HSBA028', N'Bệnh viện S', N'Có', N'Đau mắt', N'Không', N'Viêm kết mạc', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA029', NULL, N'Không có', N'Đau tai', N'Không', N'Viêm tai giữa', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA030', N'Bệnh viện T', N'Có', N'Chảy máu cam liên tục', N'Không', N'Viêm mũi dị ứng', N'Không', N'Không', N'Không', N'Có', N'Không', N'Đã kết quả', '2025-05-09'),
('HSBA031', NULL, N'Không có', N'Đau chân khi di chuyển', N'Không', N'Thoái hóa khớp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA032', N'Bệnh viện U', N'Không có', N'Khó nuốt', N'Không', N'Viêm họng hạt', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA033', NULL, N'Không có', N'Đau lưng mạn tính', N'Không', N'Thoát vị đĩa đệm', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-05-11'),
('HSBA034', N'Bệnh viện V', N'Không có', N'Buồn nôn', N'Không', N'Rối loạn tiêu hóa', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA035', NULL, N'Có', N'Tiêu chảy kéo dài', N'Không', N'Viêm ruột', N'Không', N'Không', N'Mất nước', N'Có', N'Không', N'Có', '2025-05-15'),
('HSBA036', N'Bệnh viện W', N'Không có', N'Khó thở nhẹ', N'Không', N'Hen phế quản', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA037', NULL, N'Không có', N'Mắt mờ', N'Không', N'Tăng nhãn áp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-05-20'),
('HSBA038', N'Bệnh viện X', N'Có', N'Đau vùng chậu', N'Có', N'U nang buồng trứng', N'Không', N'Không', N'Không', N'Có', N'Không', N'Đã kết quả', '2025-05-22'),
('HSBA039', NULL, N'Không có', N'Mất ngủ kéo dài', N'Không', N'Rối loạn lo âu', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA040', N'Bệnh viện Y', N'Có', N'Đau nhói vùng tim', N'Không', N'Rối loạn nhịp tim', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-05-24'),

('HSBA041', NULL, N'Không có', N'Ngứa toàn thân', N'Không', N'Dị ứng thời tiết', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA042', N'Bệnh viện Z', N'Có', N'Tê tay chân', N'Không', N'Thiếu vitamin B12', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA043', NULL, N'Không có', N'Chán ăn', N'Không', N'Viêm dạ dày', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA044', N'Bệnh viện A1', N'Có', N'Đau bụng từng cơn', N'Không', N'Viêm đại tràng', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-05-28'),
('HSBA045', NULL, N'Không có', N'Buồn ngủ quá mức', N'Không', N'Thiểu năng tuyến giáp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA046', N'Bệnh viện B1', N'Không có', N'Tăng cân nhanh', N'Không', N'Rối loạn chuyển hóa', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA047', NULL, N'Có', N'Tiểu nhiều lần', N'Không', N'Đái tháo đường', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-01'),
('HSBA048', N'Bệnh viện C1', N'Không có', N'Đau khớp gối', N'Không', N'Viêm khớp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA049', NULL, N'Không có', N'Rụng tóc nhiều', N'Không', N'Thiếu máu', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA050', N'Bệnh viện D1', N'Không có', N'Rối loạn kinh nguyệt', N'Không', N'Mất cân bằng nội tiết', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-05'),
('HSBA051', NULL, N'Không có', N'Đau cổ vai gáy', N'Không', N'Thoái hóa đốt sống cổ', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA052', N'Bệnh viện E1', N'Có', N'Huyết áp cao đột ngột', N'Không', N'Tăng huyết áp cấp tính', N'Không', N'Có', N'Đột quỵ nhẹ', N'Có', N'Không', N'Có', '2025-06-07'),
('HSBA053', NULL, N'Không có', N'Mỏi mệt', N'Không', N'Thiếu máu', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA054', N'Bệnh viện F1', N'Không có', N'Đau ngực sau vận động', N'Không', N'Thiếu máu cơ tim', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-09'),
('HSBA055', NULL, N'Không có', N'Tiểu đêm', N'Không', N'Tuyến tiền liệt phì đại', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA056', N'Bệnh viện G1', N'Không có', N'Khó ngủ kéo dài', N'Không', N'Mất ngủ kinh niên', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA057', NULL, N'Có', N'Tức ngực', N'Không', N'Viêm phế quản', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-12'),
('HSBA058', N'Bệnh viện H1', N'Không có', N'Sưng tay chân', N'Không', N'Viêm khớp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA059', NULL, N'Không có', N'Khó tiêu', N'Không', N'Viêm dạ dày', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA060', N'Bệnh viện I1', N'Không có', N'Đau đầu từng cơn', N'Không', N'Migraine', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-14'),
('HSBA061', NULL, N'Không có', N'Phát ban', N'Không', N'Dị ứng thời tiết', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA062', N'Bệnh viện J1', N'Có', N'Khó thở cấp', N'Không', N'Viêm phổi cấp', N'Không', N'Không', N'Không', N'Có', N'Không', N'Đã kết quả', '2025-06-15'),
('HSBA063', NULL, N'Không có', N'Mất thăng bằng', N'Không', N'Rối loạn tiền đình', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA064', N'Bệnh viện K1', N'Không có', N'Run tay', N'Không', N'Parkinson giai đoạn sớm', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-16'),
('HSBA065', NULL, N'Không có', N'Ngứa vùng kín', N'Không', N'Viêm nhiễm phụ khoa', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA066', N'Bệnh viện L1', N'Không có', N'Đầy bụng', N'Không', N'Viêm dạ dày', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA067', NULL, N'Có', N'Ngất xỉu', N'Không', N'Hạ đường huyết', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-17'),
('HSBA068', N'Bệnh viện M1', N'Không có', N'Co giật', N'Không', N'Động kinh', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-18'),
('HSBA069', NULL, N'Không có', N'Tiểu buốt', N'Không', N'Nhiễm trùng tiểu', N'Không', N'Không', N'Không', N'Có', N'Không', N'Không', NULL),
('HSBA070', N'Bệnh viện N1', N'Không có', N'Huyết áp cao nhẹ', N'Không', N'Tăng huyết áp mạn', N'Không', N'Không', N'Không', N'Có', N'Không', N'Có', '2025-06-20');


INSERT INTO Thuoc (IDThuoc, TenThuoc, NSX, HSD, BH)
VALUES 
('T001', 'Paracetamol', '2025-01-01', '2027-01-01', 1),
('T002', 'Amoxicillin', '2024-05-10', '2026-05-10', 0),
('T003', 'Ibuprofen', '2025-03-15', '2027-03-15', 1),
('T004', 'Aspirin', '2023-09-20', '2025-09-20', 1),
('T005', 'Vitamin C', '2024-06-01', '2026-06-01', 0),
('T006', 'Ciprofloxacin', '2024-01-15', '2026-01-15', 1),
('T007', 'Metronidazole', '2023-12-01', '2025-12-01', 0),
('T008', 'Loratadine', '2024-04-10', '2026-04-10', 1),
('T009', 'Cetirizine', '2024-05-20', '2026-05-20', 1),
('T010', 'Ranitidine', '2023-11-05', '2025-11-05', 0),
('T011', 'Omeprazole', '2024-03-25', '2026-03-25', 1),
('T012', 'Pantoprazole', '2024-02-15', '2026-02-15', 0),
('T013', 'Doxycycline', '2023-12-20', '2025-12-20', 1),
('T014', 'Clarithromycin', '2024-07-01', '2026-07-01', 1),
('T015', 'Azithromycin', '2024-08-10', '2026-08-10', 0),
('T016', 'Hydrochlorothiazide', '2023-10-30', '2025-10-30', 1),
('T017', 'Losartan', '2024-03-01', '2026-03-01', 0),
('T018', 'Enalapril', '2024-05-01', '2026-05-01', 1),
('T019', 'Lisinopril', '2024-06-15', '2026-06-15', 1),
('T020', 'Simvastatin', '2024-01-05', '2026-01-05', 0),
('T021', 'Atorvastatin', '2023-09-10', '2025-09-10', 1),
('T022', 'Metformin', '2024-02-28', '2026-02-28', 1),
('T023', 'Glibenclamide', '2024-04-01', '2026-04-01', 0),
('T024', 'Insulin', '2025-01-01', '2026-01-01', 1),
('T025', 'Salbutamol', '2023-08-15', '2025-08-15', 1),
('T026', 'Budesonide', '2024-03-20', '2026-03-20', 0),
('T027', 'Prednisolone', '2024-01-30', '2026-01-30', 1),
('T028', 'Dexamethasone', '2024-02-10', '2026-02-10', 1),
('T029', 'Hydrocortisone', '2024-04-15', '2026-04-15', 0),
('T030', 'Diazepam', '2023-11-20', '2025-11-20', 1),
('T031', 'Lorazepam', '2024-05-05', '2026-05-05', 1),
('T032', 'Amitriptyline', '2024-06-10', '2026-06-10', 0),
('T033', 'Fluoxetine', '2024-07-15', '2026-07-15', 1),
('T034', 'Sertraline', '2024-08-01', '2026-08-01', 1),
('T035', 'Citalopram', '2024-09-01', '2026-09-01', 0),
('T036', 'Haloperidol', '2023-12-15', '2025-12-15', 1),
('T037', 'Olanzapine', '2024-01-10', '2026-01-10', 1),
('T038', 'Quetiapine', '2024-02-20', '2026-02-20', 0),
('T039', 'Risperidone', '2024-03-15', '2026-03-15', 1),
('T040', 'Lamotrigine', '2024-04-20', '2026-04-20', 1),
('T041', 'Valproic Acid', '2024-05-25', '2026-05-25', 0),
('T042', 'Carbamazepine', '2024-06-30', '2026-06-30', 1),
('T043', 'Levetiracetam', '2024-07-05', '2026-07-05', 1),
('T044', 'Gabapentin', '2024-08-10', '2026-08-10', 0),
('T045', 'Pregabalin', '2024-09-15', '2026-09-15', 1),
('T046', 'Sildenafil', '2024-10-01', '2026-10-01', 1),
('T047', 'Tadalafil', '2024-10-20', '2026-10-20', 0),
('T048', 'Finasteride', '2024-11-05', '2026-11-05', 1),
('T049', 'Dutasteride', '2024-11-25', '2026-11-25', 1),
('T050', 'Omeprazole DR', '2024-12-10', '2026-12-10', 0),
('T051', 'Esomeprazole', '2025-01-20', '2027-01-20', 1),
('T052', 'Rabeprazole', '2025-02-01', '2027-02-01', 1),
('T053', 'Famotidine', '2025-02-15', '2027-02-15', 0),
('T054', 'Sucralfate', '2025-03-01', '2027-03-01', 1),
('T055', 'Bismuth Subsalicylate', '2025-03-10', '2027-03-10', 1);

INSERT INTO DonThuoc (MaDonThuoc, ngayTao, nguoiTao)
VALUES
('DT001', '2025-05-01', 'BS012'),
('DT002', '2025-05-02', 'BS004'),
('DT003', '2025-05-03', 'BS017'),
('DT004', '2025-05-04', 'BS003'),
('DT005', '2025-05-05', 'BS021'),
('DT006', '2025-05-06', 'BS008'),
('DT007', '2025-05-07', 'BS001'),
('DT008', '2025-05-08', 'BS011'),
('DT009', '2025-05-09', 'BS020'),
('DT010', '2025-05-10', 'BS007'),
('DT011', '2025-05-11', 'BS019'),
('DT012', '2025-05-12', 'BS014'),
('DT013', '2025-05-13', 'BS016'),
('DT014', '2025-05-14', 'BS002'),
('DT015', '2025-05-15', 'BS005'),
('DT016', '2025-05-16', 'BS013'),
('DT017', '2025-05-17', 'BS009'),
('DT018', '2025-05-18', 'BS006'),
('DT019', '2025-05-19', 'BS018'),
('DT020', '2025-05-20', 'BS010'),
('DT021', '2025-05-21', 'BS015'),
('DT022', '2025-05-22', 'BS011'),
('DT023', '2025-05-23', 'BS003'),
('DT024', '2025-05-24', 'BS014'),
('DT025', '2025-05-25', 'BS001'),
('DT026', '2025-05-26', 'BS019'),
('DT027', '2025-05-27', 'BS020'),
('DT028', '2025-05-28', 'BS005'),
('DT029', '2025-05-29', 'BS017'),
('DT030', '2025-05-30', 'BS006');


INSERT INTO DonThuocDetal(MaDonThuoc, IDThuoc, SoLg, DvTinh, LieuDung, GhiChu)
VALUES 
('DT001', 'T001', 10, N'Viên', N'1 viên mỗi 4 giờ', N'Dùng khi có triệu chứng sốt'),
('DT002', 'T002', 20, N'Viên', N'500mg mỗi 8 giờ', N'Chữa viêm họng cấp'),
('DT003', 'T003', 15, N'Viên', N'1 viên mỗi 6 giờ', N'Giảm đau, hạ sốt'),
('DT004', 'T004', 5, N'Viên', N'1 viên mỗi ngày', N'Giảm đau, chống viêm'),
('DT005', 'T005', 30, N'Viên', N'1 viên mỗi ngày', N'Tăng cường sức đề kháng'),
('DT006', 'T006', 10, N'Viên', N'1 viên sáng, 1 viên tối', N'Kháng sinh phổ rộng'),
('DT006', 'T007', 5, N'Viên', N'1 viên mỗi 12 giờ', N'Điều trị nhiễm trùng đường tiêu hóa'),
('DT007', 'T008', 20, N'Viên', N'1 viên mỗi ngày', N'Chống dị ứng'),
('DT007', 'T009', 20, N'Viên', N'1 viên mỗi tối', N'Giảm hắt hơi, sổ mũi'),
('DT008', 'T010', 10, N'Viên', N'1 viên trước ăn', N'Chữa đau dạ dày'),
('DT008', 'T011', 10, N'Viên', N'1 viên mỗi sáng', N'Chống trào ngược dạ dày'),
('DT009', 'T012', 15, N'Viên', N'1 viên mỗi ngày', N'Bảo vệ niêm mạc dạ dày'),
('DT009', 'T013', 12, N'Viên', N'1 viên mỗi 12 giờ', N'Kháng khuẩn'),
('DT010', 'T014', 6, N'Viên', N'1 viên mỗi ngày', N'Trị viêm phổi'),
('DT010', 'T015', 3, N'Viên', N'1 viên mỗi ngày', N'Trị viêm hô hấp trên'),
('DT011', 'T016', 10, N'Viên', N'1 viên mỗi sáng', N'Hạ huyết áp'),
('DT011', 'T017', 15, N'Viên', N'1 viên/ngày', N'Kiểm soát huyết áp cao'),
('DT012', 'T018', 14, N'Viên', N'1 viên mỗi tối', N'Ổn định huyết áp'),
('DT012', 'T019', 10, N'Viên', N'1 viên sáng và tối', N'Chống tăng huyết áp'),
('DT013', 'T020', 30, N'Viên', N'1 viên mỗi tối', N'Giảm cholesterol'),
('DT013', 'T021', 30, N'Viên', N'1 viên trước ngủ', N'Giảm mỡ máu'),
('DT014', 'T022', 20, N'Viên', N'1 viên sau ăn', N'Kiểm soát đường huyết'),
('DT014', 'T023', 20, N'Viên', N'1 viên sau bữa trưa', N'Chống tăng đường huyết'),
('DT015', 'T024', 3, N'Ống', N'1 ống mỗi sáng', N'Tiêm insulin điều trị tiểu đường'),
('DT015', 'T025', 2, N'Ống', N'Xịt khi khó thở', N'Giãn phế quản'),
('DT016', 'T026', 1, N'Ống', N'Xịt 2 lần/ngày', N'Viêm mũi dị ứng'),
('DT016', 'T027', 10, N'Viên', N'1 viên/ngày', N'Chống viêm, dị ứng'),
('DT017', 'T028', 12, N'Viên', N'1 viên sáng và tối', N'Kháng viêm mạnh'),
('DT017', 'T029', 8, N'Viên', N'1 viên mỗi sáng', N'Kháng viêm'),
('DT018', 'T030', 5, N'Viên', N'1 viên khi mất ngủ', N'An thần, gây ngủ'),
('DT018', 'T031', 5, N'Viên', N'1 viên trước khi ngủ', N'Giảm lo âu'),
('DT019', 'T032', 10, N'Viên', N'1 viên/ngày', N'Trầm cảm mức độ nhẹ'),
('DT019', 'T033', 10, N'Viên', N'1 viên/ngày', N'Trị trầm cảm'),
('DT020', 'T034', 15, N'Viên', N'1 viên mỗi sáng', N'Trị lo âu, trầm cảm'),
('DT020', 'T035', 15, N'Viên', N'1 viên/ngày', N'Cải thiện tâm trạng'),
('DT021', 'T036', 10, N'Viên', N'1 viên/ngày', N'Chống loạn thần'),
('DT021', 'T037', 10, N'Viên', N'1 viên mỗi tối', N'Điều trị tâm thần phân liệt'),
('DT022', 'T038', 12, N'Viên', N'1 viên/ngày', N'Ổn định tâm thần'),
('DT022', 'T039', 10, N'Viên', N'1 viên/ngày', N'Chống loạn thần'),
('DT023', 'T040', 20, N'Viên', N'1 viên/ngày', N'Động kinh nhẹ'),
('DT023', 'T041', 15, N'Viên', N'1 viên sáng và tối', N'Chống co giật'),
('DT024', 'T042', 14, N'Viên', N'1 viên/ngày', N'Trị động kinh'),
('DT024', 'T043', 20, N'Viên', N'1 viên sáng và tối', N'Chống động kinh'),
('DT025', 'T044', 10, N'Viên', N'1 viên mỗi ngày', N'Giảm đau thần kinh'),
('DT025', 'T045', 10, N'Viên', N'1 viên sáng', N'Giảm đau thần kinh ngoại biên'),
('DT026', 'T046', 5, N'Viên', N'1 viên trước sinh hoạt', N'Tăng cường sinh lý nam'),
('DT026', 'T047', 5, N'Viên', N'1 viên/ngày', N'Hỗ trợ sinh lý nam'),
('DT027', 'T048', 15, N'Viên', N'1 viên/ngày', N'Trị rụng tóc do nội tiết'),
('DT027', 'T049', 10, N'Viên', N'1 viên/ngày', N'Giảm phì đại tuyến tiền liệt'),
('DT028', 'T050', 20, N'Viên', N'1 viên trước ăn', N'Trào ngược dạ dày'),
('DT028', 'T051', 20, N'Viên', N'1 viên/ngày', N'Điều trị viêm loét dạ dày'),
('DT029', 'T052', 12, N'Viên', N'1 viên sáng và tối', N'Trào ngược thực quản'),
('DT029', 'T053', 15, N'Viên', N'1 viên sau ăn', N'Giảm tiết axit dạ dày'),
('DT030', 'T054', 10, N'Viên', N'1 viên mỗi 6 giờ', N'Bảo vệ dạ dày'),
('DT030', 'T055', 10, N'Viên', N'1 viên/ngày', N'Tiêu hóa, chống tiêu chảy');



INSERT INTO DonThuoc_HSBA (MaHSBA, MaDonThuoc, TGianBDauSD, TGianKThucSD)
VALUES 
('HSBA001', 'DT001', '2025-04-06', '2025-04-10'),
('HSBA002', 'DT002', '2025-04-07', '2025-04-15'),
('HSBA003', 'DT003', '2025-04-08', '2025-04-12'),
('HSBA004', 'DT004', '2025-04-09', '2025-04-14'),
('HSBA005', 'DT005', '2025-04-10', '2025-04-20'),
('HSBA001', 'DT006', '2025-04-11', '2025-04-15'),
('HSBA001', 'DT007', '2025-04-16', '2025-04-20'),
('HSBA002', 'DT008', '2025-04-10', '2025-04-18'),
('HSBA002', 'DT009', '2025-04-19', '2025-04-25'),
('HSBA003', 'DT010', '2025-04-13', '2025-04-17'),
('HSBA003', 'DT011', '2025-04-18', '2025-04-21'),
('HSBA004', 'DT012', '2025-04-15', '2025-04-20'),
('HSBA004', 'DT013', '2025-04-21', '2025-04-26'),
('HSBA005', 'DT014', '2025-04-22', '2025-04-28'),
('HSBA005', 'DT015', '2025-04-29', '2025-05-03'),
('HSBA006', 'DT016', '2025-04-05', '2025-04-10'),
('HSBA006', 'DT017', '2025-04-11', '2025-04-16'),
('HSBA007', 'DT018', '2025-04-07', '2025-04-12'),
('HSBA007', 'DT019', '2025-04-13', '2025-04-18'),
('HSBA008', 'DT020', '2025-04-09', '2025-04-14'),
('HSBA009', 'DT021', '2025-04-10', '2025-04-16'),
('HSBA009', 'DT022', '2025-04-17', '2025-04-22'),
('HSBA010', 'DT023', '2025-04-12', '2025-04-18'),
('HSBA010', 'DT024', '2025-04-19', '2025-04-25'),
('HSBA010', 'DT025', '2025-04-26', '2025-05-01'),
('HSBA011', 'DT026', '2025-04-15', '2025-04-20'),
('HSBA011', 'DT027', '2025-04-21', '2025-04-25'),
('HSBA012', 'DT028', '2025-04-10', '2025-04-14'),
('HSBA013', 'DT029', '2025-04-12', '2025-04-18'),
('HSBA013', 'DT030', '2025-04-19', '2025-04-24');

INSERT INTO Khoa (MaKhoa, TenKhoa)
VALUES 
('K001', N'Khoa Nội'),
('K002', N'Khoa Ngoại'),
('K003', N'Khoa Sản'),
('K004', N'Khoa Tim Mạch'),
('K005', N'Khoa Mắt');

INSERT INTO TTNhapVien (MaHSBA, MaNhapVien, TgianVnVien, Buong, Giuong, LyDoVao, NoiGTieu, NVienLanThu, ChuyenVien, BVChuyenDen, TGRaVien, LyDoRaVien)
VALUES 
('HSBA001', 'NV001', '2025-04-01', N'Buồng 1', N'Giuong 1', N'Khám và điều trị viêm phổi', N'Khoa Nội', 1, N'Không', N'Bệnh viện A', '2025-04-10', N'Khỏi bệnh'),
('HSBA002', 'NV002', '2025-04-02', N'Buồng 2', N'Giuong 2', N'Chữa trị viêm đường tiết niệu', N'Khoa Ngoại', 2, N'Chuyển viện', N'Bệnh viện B', '2025-04-15', N'Đã xuất viện'),
('HSBA003', 'NV003', '2025-04-03', N'Buồng 3', N'Giuong 3', N'Chấn thương xương', N'Khoa Sản', 1, N'Không', N'Bệnh viện C', '2025-04-20', N'Chưa ra viện'),
('HSBA004', 'NV004', '2025-04-04', N'Buồng 4', N'Giuong 4', N'Phẫu thuật tim mạch', N'Khoa Tim Mạch', 3, N'Chuyển viện', N'Bệnh viện D', '2025-04-25', N'Đang điều trị'),
('HSBA005', 'NV005', '2025-04-05', N'Buồng 5', N'Giuong 5', N'Khám và điều trị bệnh mắt', N'Khoa Mắt', 2, N'Không', N'Bệnh viện E', '2025-04-30', N'Chữa trị xong'),
('HSBA006', 'NV016', '2025-04-06', N'Buồng 6', N'Giuong 4', N'Đau đầu kéo dài', N'Khoa Thần Kinh', 1, N'Không', N'Bệnh viện F', '2025-04-12', N'Giảm triệu chứng'),
('HSBA007', 'NV017', '2025-04-08', N'Buồng 7', N'Giuong 5', N'Gãy tay', N'Khoa Chấn Thương', 1, N'Không', N'Bệnh viện G', '2025-04-14', N'Tạm ổn'),
('HSBA007', 'NV018', '2025-05-10', N'Buồng 3', N'Giuong 3', N'Tái khám chấn thương', N'Khoa Chấn Thương', 2, N'Không', N'Bệnh viện G', '2025-05-13', N'Ổn định'),
('HSBA018', 'NV019', '2025-04-09', N'Buồng 8', N'Giuong 1', N'Viêm phế quản', N'Khoa Nội', 1, N'Không', N'Bệnh viện H', '2025-04-16', N'Giảm nhẹ'),
('HSBA018', 'NV020', '2025-05-12', N'Buồng 8', N'Giuong 2', N'Khó thở', N'Khoa Nội', 2, N'Chuyển viện', N'Bệnh viện H', '2025-05-15', N'Chuyển theo dõi'),

('HSBA018', 'NV021', '2025-06-05', N'Buồng 5', N'Giuong 2', N'Tái khám hô hấp', N'Khoa Nội', 3, N'Không', N'Bệnh viện H', '2025-06-08', N'Đã hồi phục'),
('HSBA029', 'NV022', '2025-04-10', N'Buồng 9', N'Giuong 1', N'Viêm gan B', N'Khoa Truyền Nhiễm', 1, N'Không', N'Bệnh viện I', '2025-04-22', N'Ổn định'),
('HSBA030', 'NV023', '2025-04-12', N'Buồng 10', N'Giuong 2', N'Suy thận cấp', N'Khoa Nội Thận', 1, N'Không', N'Bệnh viện J', '2025-04-20', N'Hồi phục một phần'),
('HSBA030', 'NV024', '2025-05-18', N'Buồng 11', N'Giuong 3', N'Chạy thận định kỳ', N'Khoa Nội Thận', 2, N'Không', N'Bệnh viện J', '2025-05-22', N'Ổn định'),
('HSBA031', 'NV025', '2025-04-15', N'Buồng 12', N'Giuong 4', N'Đau bụng cấp', N'Khoa Tiêu Hóa', 1, N'Không', N'Bệnh viện K', '2025-04-19', N'Hết đau'),
('HSBA031', 'NV026', '2025-05-12', N'Buồng 13', N'Giuong 1', N'Tái khám dạ dày', N'Khoa Tiêu Hóa', 2, N'Không', N'Bệnh viện K', '2025-05-14', N'Tiếp tục theo dõi'),
('HSBA031', 'NV027', '2025-06-10', N'Buồng 14', N'Giuong 3', N'Nội soi kiểm tra', N'Khoa Tiêu Hóa', 3, N'Không', N'Bệnh viện K', '2025-06-11', N'Không phát hiện'),
('HSBA042', 'NV028', '2025-04-20', N'Buồng 15', N'Giuong 2', N'Mắt mờ', N'Khoa Mắt', 1, N'Không', N'Bệnh viện L', '2025-04-25', N'Đã điều trị'),
('HSBA023', 'NV029', '2025-04-22', N'Buồng 16', N'Giuong 3', N'Đau đầu kinh niên', N'Khoa Thần Kinh', 1, N'Không', N'Bệnh viện M', '2025-04-28', N'Giảm nhẹ'),
('HSBA023', 'NV030', '2025-05-15', N'Buồng 16', N'Giuong 4', N'Khám lại thần kinh', N'Khoa Thần Kinh', 2, N'Không', N'Bệnh viện M', '2025-05-18', N'Ổn định'),

('HSBA034', 'NV031', '2025-04-21', N'Buồng 1', N'Giuong 1', N'Viêm xoang cấp', N'Khoa Tai Mũi Họng', 1, N'Không', N'Bệnh viện N', '2025-04-26', N'Đã khỏi'),
('HSBA035', 'NV032', '2025-04-22', N'Buồng 2', N'Giuong 2', N'Khám định kỳ', N'Khoa Tổng Quát', 1, N'Không', N'Bệnh viện O', '2025-04-23', N'Không vấn đề'),
('HSBA035', 'NV033', '2025-05-03', N'Buồng 2', N'Giuong 3', N'Khó thở nhẹ', N'Khoa Hô Hấp', 2, N'Không', N'Bệnh viện O', '2025-05-07', N'Ổn định'),
('HSBA026', 'NV034', '2025-04-24', N'Buồng 3', N'Giuong 1', N'Viêm tai giữa', N'Khoa Tai Mũi Họng', 1, N'Không', N'Bệnh viện P', '2025-04-30', N'Đáp ứng thuốc'),
('HSBA017', 'NV035', '2025-04-25', N'Buồng 4', N'Giuong 2', N'Chóng mặt', N'Khoa Thần Kinh', 1, N'Không', N'Bệnh viện Q', '2025-04-29', N'Hết triệu chứng'),
('HSBA048', 'NV036', '2025-04-26', N'Buồng 5', N'Giuong 1', N'Đau lưng', N'Khoa Cơ Xương Khớp', 1, N'Không', N'Bệnh viện R', '2025-04-30', N'Đã giảm'),
('HSBA049', 'NV037', '2025-04-27', N'Buồng 6', N'Giuong 2', N'Sốt siêu vi', N'Khoa Nhiễm', 1, N'Không', N'Bệnh viện S', '2025-05-02', N'Khỏi hẳn'),
('HSBA049', 'NV038', '2025-05-20', N'Buồng 6', N'Giuong 3', N'Tái sốt', N'Khoa Nhiễm', 2, N'Chuyển viện', N'Bệnh viện S', '2025-05-25', N'Theo dõi'),
('HSBA040', 'NV039', '2025-04-28', N'Buồng 7', N'Giuong 4', N'Đau bụng dữ dội', N'Khoa Ngoại Tiêu Hóa', 1, N'Không', N'Bệnh viện T', '2025-05-05', N'Đã xử lý'),
('HSBA031', 'NV040', '2025-04-29', N'Buồng 8', N'Giuong 2', N'Viêm loét dạ dày', N'Khoa Tiêu Hóa', 1, N'Không', N'Bệnh viện U', '2025-05-04', N'Ổn định'),

('HSBA031', 'NV041', '2025-05-28', N'Buồng 8', N'Giuong 3', N'Tái phát viêm loét', N'Khoa Tiêu Hóa', 2, N'Không', N'Bệnh viện U', '2025-06-02', N'Đang theo dõi'),
('HSBA052', 'NV042', '2025-04-30', N'Buồng 9', N'Giuong 1', N'Khám thai', N'Khoa Sản', 1, N'Không', N'Bệnh viện V', '2025-05-01', N'Khám định kỳ'),
('HSBA053', 'NV043', '2025-05-01', N'Buồng 10', N'Giuong 2', N'Chấn thương gối', N'Khoa Chấn Thương', 1, N'Không', N'Bệnh viện W', '2025-05-06', N'Hồi phục tốt'),
('HSBA054', 'NV044', '2025-05-02', N'Buồng 11', N'Giuong 3', N'Đau ngực', N'Khoa Tim Mạch', 1, N'Không', N'Bệnh viện X', '2025-05-09', N'Ổn'),
('HSBA055', 'NV045', '2025-05-03', N'Buồng 12', N'Giuong 4', N'Suy nhược cơ thể', N'Khoa Dinh Dưỡng', 1, N'Không', N'Bệnh viện Y', '2025-05-08', N'Tăng sức khỏe'),
('HSBA055', 'NV046', '2025-06-10', N'Buồng 12', N'Giuong 1', N'Mệt mỏi kéo dài', N'Khoa Dinh Dưỡng', 2, N'Không', N'Bệnh viện Y', '2025-06-14', N'Đang theo dõi'),
('HSBA016', 'NV047', '2025-05-04', N'Buồng 13', N'Giuong 2', N'Cao huyết áp', N'Khoa Nội Tim Mạch', 1, N'Không', N'Bệnh viện Z', '2025-05-10', N'Ổn định'),
('HSBA037', 'NV048', '2025-05-05', N'Buồng 14', N'Giuong 3', N'Khám mắt', N'Khoa Mắt', 1, N'Không', N'Bệnh viện A', '2025-05-06', N'Chỉ định đeo kính'),
('HSBA037', 'NV049', '2025-06-01', N'Buồng 14', N'Giuong 4', N'Mắt đau nhức', N'Khoa Mắt', 2, N'Không', N'Bệnh viện A', '2025-06-05', N'Đã điều trị'),
('HSBA028', 'NV050', '2025-05-06', N'Buồng 15', N'Giuong 2', N'Phẫu thuật ruột thừa', N'Khoa Ngoại Tổng Quát', 1, N'Không', N'Bệnh viện B', '2025-05-12', N'Xuất viện')



INSERT INTO TTNV_KHOA (MaNhapVien, MaKhoa, TgChuyenDen)
VALUES 
('NV001', 'K001', '2025-04-01'),
('NV002', 'K002', '2025-04-02'),
('NV003', 'K003', '2025-04-03'),
('NV004', 'K004', '2025-04-04'),
('NV005', 'K005', '2025-04-05'),
('NV017', 'K002', '2025-04-15'),
('NV018', 'K001', '2025-04-16'),
('NV020', 'K003', '2025-04-18'),
('NV021', 'K004', '2025-04-19'),
('NV023', 'K005', '2025-04-20'),
('NV026', 'K001', '2025-04-22'),
('NV028', 'K003', '2025-04-24'),
('NV030', 'K002', '2025-04-25'),
('NV033', 'K005', '2025-05-03'),
('NV036', 'K004', '2025-05-06'),
('NV038', 'K001', '2025-05-09'),
('NV041', 'K003', '2025-05-12'),
('NV045', 'K005', '2025-05-15'),
('NV047', 'K002', '2025-05-17'),
('NV049', 'K004', '2025-05-18');


INSERT INTO KhieuNai (IDKNai, IDBenhNhan, LyDo, NgayKN, TrangThai, XuLyKN, MaNV)
VALUES 
('KN001', 'BN001', N'Bệnh nhân không hài lòng với thái độ bác sĩ', '2025-04-10', N'Đang xử lý', N'Bác sĩ được yêu cầu giải thích lại quy trình', 'NV001'),
('KN002', 'BN002', N'Bệnh nhân phàn nàn về chất lượng dịch vụ điều dưỡng', '2025-04-12', N'Đã xử lý', N'Điều dưỡng đã xin lỗi và cam kết cải thiện', 'NV002'),
('KN003', 'BN003', N'Bệnh nhân không hài lòng về thời gian Đã đợi', '2025-04-15', N'Đang xử lý', N'Lãnh đạo bệnh viện sẽ xem xét', 'NV003'),
('KN004', 'BN004', N'Bệnh nhân phản ánh về chi phí điều trị', '2025-04-18', N'Đã xử lý', N'Giải thích chi phí và điều kiện bảo hiểm', 'NV004'),
('KN005', 'BN005', N'Bệnh nhân không hài lòng về vệ sinh phòng bệnh', '2025-04-20', N'Đang xử lý', N'Đang kiểm tra lại quy trình vệ sinh', 'NV005'),
('KN006', 'BN006', N'Phản ánh về sự chậm trễ trong cấp phát thuốc', '2025-04-21', N'Chưa xử lý', N'', 'NV006'),
('KN007', 'BN007', N'Thiết bị y tế trong phòng không hoạt động tốt', '2025-04-22', N'Chưa xử lý', N'', 'NV007'),
('KN008', 'BN008', N'Bệnh nhân bị bỏ sót trong danh sách khám', '2025-04-23', N'Chưa xử lý', N'', 'NV008'),
('KN009', 'BN009', N'Phản ánh nhân viên không đeo bảng tên', '2025-04-24', N'Chưa xử lý', N'', 'NV009'),
('KN010', 'BN010', N'Thời gian khám không đúng lịch hẹn', '2025-04-25', N'Chưa xử lý', N'', 'NV010'),

('KN011', 'BN011', N'Không có hướng dẫn rõ ràng khi nhập viện', '2025-04-26', N'Chưa xử lý', N'', 'NV011'),
('KN012', 'BN012', N'Bệnh nhân bị nhầm thuốc', '2025-04-26', N'Đã xử lý', N'Đã kiểm tra và điều chỉnh quy trình cấp thuốc', 'NV012'),
('KN013', 'BN013', N'Nhân viên trực lễ tân thô lỗ', '2025-04-27', N'Chưa xử lý', N'', 'NV013'),
('KN014', 'BN014', N'Thiết bị vệ sinh bị hỏng không được sửa', '2025-04-27', N'Chưa xử lý', N'', 'NV014'),
('KN015', 'BN015', N'Bệnh nhân yêu cầu đối chiếu lại chi phí điều trị', '2025-04-28', N'Đang xử lý', N'Phòng tài chính đang kiểm tra lại hóa đơn', 'NV015'),

('KN016', 'BN016', N'Nhân viên y tế quên nhắc nhở giờ uống thuốc', '2025-04-28', N'Chưa xử lý', N'', 'NV016'),
('KN017', 'BN017', N'Không có bác sĩ chuyên khoa trong khung giờ hẹn', '2025-04-29', N'Chưa xử lý', N'', 'NV017'),
('KN018', 'BN018', N'Bệnh nhân bị nhầm lẫn giường điều trị', '2025-04-29', N'Đã xử lý', N'Nhân viên đã chuyển bệnh nhân về đúng vị trí', 'NV018'),
('KN019', 'BN019', N'Phòng bệnh quá đông, không đủ chỗ nghỉ', '2025-04-30', N'Chưa xử lý', N'', 'NV019'),
('KN020', 'BN020', N'Không có nhân viên hỗ trợ chuyển khoa', '2025-04-30', N'Chưa xử lý', N'', 'NV020'),

('KN021', 'BN021', N'Không được phát đồ ăn đúng giờ', '2025-05-01', N'Chưa xử lý', N'', 'NV021'),
('KN022', 'BN022', N'Điều dưỡng không trả lời câu hỏi của bệnh nhân', '2025-05-01', N'Chưa xử lý', N'', 'NV022'),
('KN023', 'BN023', N'Thiếu khăn và đồ dùng y tế cơ bản trong phòng', '2025-05-02', N'Đang xử lý', N'Phòng vật tư đã nhận phản ánh và đang bổ sung', 'NV023'),
('KN024', 'BN024', N'Nhân viên phòng khám không giải thích rõ quy trình khám', '2025-05-02', N'Chưa xử lý', N'', 'NV024'),
('KN025', 'BN025', N'Quá tải dẫn đến thiếu giường nằm', '2025-05-03', N'Chưa xử lý', N'', 'NV025');




create fulltext catalog [search_employee]with accent_sensitivity = on

CREATE FUNCTION dbo.RemoveDiacritics(@input NVARCHAR(MAX))

RETURNS NVARCHAR(MAX)
AS
BEGIN
    -- Thay thế các ký tự có dấu bằng không dấu
    SET @input = LOWER(@input);
    SET @input = REPLACE(@input, 'á', 'a');
    SET @input = REPLACE(@input, 'à', 'a');
    SET @input = REPLACE(@input, 'ả', 'a');
    SET @input = REPLACE(@input, 'ã', 'a');
    SET @input = REPLACE(@input, 'ạ', 'a');
    SET @input = REPLACE(@input, 'ă', 'a');
    SET @input = REPLACE(@input, 'ắ', 'a');
    SET @input = REPLACE(@input, 'ằ', 'a');
    SET @input = REPLACE(@input, 'ẳ', 'a');
    SET @input = REPLACE(@input, 'ẵ', 'a');
    SET @input = REPLACE(@input, 'ặ', 'a');
    SET @input = REPLACE(@input, 'â', 'a');
    SET @input = REPLACE(@input, 'ấ', 'a');
    SET @input = REPLACE(@input, 'ầ', 'a');
    SET @input = REPLACE(@input, 'ẩ', 'a');
    SET @input = REPLACE(@input, 'ẫ', 'a');
    SET @input = REPLACE(@input, 'ậ', 'a');
    SET @input = REPLACE(@input, 'đ', 'd');
    SET @input = REPLACE(@input, 'é', 'e');
    SET @input = REPLACE(@input, 'è', 'e');
    SET @input = REPLACE(@input, 'ẻ', 'e');
    SET @input = REPLACE(@input, 'ẽ', 'e');
    SET @input = REPLACE(@input, 'ẹ', 'e');
    SET @input = REPLACE(@input, 'ê', 'e');
    SET @input = REPLACE(@input, 'ế', 'e');
    SET @input = REPLACE(@input, 'ề', 'e');
    SET @input = REPLACE(@input, 'ể', 'e');
    SET @input = REPLACE(@input, 'ễ', 'e');
    SET @input = REPLACE(@input, 'ệ', 'e');
    SET @input = REPLACE(@input, 'í', 'i');
    SET @input = REPLACE(@input, 'ì', 'i');
    SET @input = REPLACE(@input, 'ỉ', 'i');
    SET @input = REPLACE(@input, 'ĩ', 'i');
    SET @input = REPLACE(@input, 'ị', 'i');
    SET @input = REPLACE(@input, 'ó', 'o');
    SET @input = REPLACE(@input, 'ò', 'o');
    SET @input = REPLACE(@input, 'ỏ', 'o');
    SET @input = REPLACE(@input, 'õ', 'o');
    SET @input = REPLACE(@input, 'ọ', 'o');
    SET @input = REPLACE(@input, 'ô', 'o');
    SET @input = REPLACE(@input, 'ố', 'o');
    SET @input = REPLACE(@input, 'ồ', 'o');
    SET @input = REPLACE(@input, 'ổ', 'o');
    SET @input = REPLACE(@input, 'ỗ', 'o');
    SET @input = REPLACE(@input, 'ộ', 'o');
    SET @input = REPLACE(@input, 'ơ', 'o');
    SET @input = REPLACE(@input, 'ớ', 'o');
    SET @input = REPLACE(@input, 'ờ', 'o');
    SET @input = REPLACE(@input, 'ở', 'o');
    SET @input = REPLACE(@input, 'ỡ', 'o');
    SET @input = REPLACE(@input, 'ợ', 'o');
    SET @input = REPLACE(@input, 'ú', 'u');
    SET @input = REPLACE(@input, 'ù', 'u');
    SET @input = REPLACE(@input, 'ủ', 'u');
    SET @input = REPLACE(@input, 'ũ', 'u');
    SET @input = REPLACE(@input, 'ụ', 'u');
    SET @input = REPLACE(@input, 'ư', 'u');
    SET @input = REPLACE(@input, 'ứ', 'u');
    SET @input = REPLACE(@input, 'ừ', 'u');
    SET @input = REPLACE(@input, 'ử', 'u');
    SET @input = REPLACE(@input, 'ữ', 'u');
    SET @input = REPLACE(@input, 'ự', 'u');
    SET @input = REPLACE(@input, 'ý', 'y');
    SET @input = REPLACE(@input, 'ỳ', 'y');
    SET @input = REPLACE(@input, 'ỷ', 'y');
    SET @input = REPLACE(@input, 'ỹ', 'y');
    SET @input = REPLACE(@input, 'ỵ', 'y');

    RETURN @input;
END;

--test
SELECT *
FROM BenhNhan
WHERE dbo.RemoveDiacritics(HoTen) LIKE '%phuc%';


go
CREATE PROCEDURE dbo.sp_ThemBenhNhan
    @CCCD VARCHAR(12),
    @TrieuChung NVARCHAR(200),
    @Khoa NVARCHAR(50),
    @TinhTrang INT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRAN;

    DECLARE @ngayTao DATETIME = GETDATE();
    DECLARE @STT INT = 0;
    DECLARE @STTText VARCHAR(10);
    DECLARE @Prefix CHAR(1);

    SET @Prefix = CASE WHEN @TinhTrang = 1 THEN '1' ELSE '2' END;

    -- Lấy số thứ tự cuối cùng theo tình trạng và ngày

		SELECT @STT = MAX(CAST(SUBSTRING(CAST(STT AS VARCHAR), 2, 3) AS INT))
FROM BenhNhan
WHERE CONVERT(DATE, ngayTao) = CONVERT(DATE, @ngayTao)
  AND STT LIKE @Prefix + '%'
  AND (
        (@TinhTrang = 1 AND CAST(SUBSTRING(CAST(STT AS VARCHAR), 2, 3) AS INT) % 2 = 1)
     OR (@TinhTrang = 2 AND CAST(SUBSTRING(CAST(STT AS VARCHAR), 2, 3) AS INT) % 2 = 0)
      );

   IF @STT IS NULL
BEGIN
    -- Khởi tạo số thứ tự đầu tiên tùy tình trạng
    IF @TinhTrang = 1
        SET @STT = 1;
    ELSE IF @TinhTrang = 2
        SET @STT = 2;
END
ELSE
BEGIN
    -- Nếu đã có số thứ tự rồi thì cộng thêm 2 để duy trì lẻ/chẵn xen kẽ
    SET @STT = @STT + 2;
END

    SET @STTText = @Prefix + RIGHT('000' + CAST(@STT AS VARCHAR), 3);

    -- Cập nhật thông tin bệnh nhân
    UPDATE BenhNhan
    SET 
        Khoa = @Khoa,
        TrieuChung = @TrieuChung,
        STT = @STTText,
        ngayTao = @ngayTao
    WHERE CCCD = @CCCD;

    COMMIT;
END;

