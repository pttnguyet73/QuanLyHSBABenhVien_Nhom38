create database Quanlibenhan
use Quanlibenhan

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
    TgKham DATE
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
    MaBN VARCHAR(10),
    MaHSBA VARCHAR(10),
    TGTaiKham DATE,
    TrangThai NVARCHAR(50),
    PRIMARY KEY (MaBN, MaHSBA),
    FOREIGN KEY (MaBN) REFERENCES BenhNhan(MaBN),
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

CREATE TABLE DonThuoc (
    MaDonThuoc VARCHAR(10) PRIMARY KEY,
    IDThuoc VARCHAR(10),
    SoLg INT,
    DvTinh NVARCHAR(50),
    LieuDung NVARCHAR(100),
    GhiChu NVARCHAR(200),
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
    TenKhoa NVARCHAR(100),
    TTNV_Khoa NVARCHAR(100),
    TGChuyenDen DATE
);

CREATE TABLE TTNV_KHOA (
    MaNhapVien VARCHAR(10) UNIQUE,
    MaKhoa VARCHAR(10),
    TgChuyenDen DATE,
    PRIMARY KEY (MaNhapVien, MaKhoa),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
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
    FOREIGN KEY (MaHSBA) REFERENCES HSBA(MaHSBA),
    FOREIGN KEY (MaNhapVien) REFERENCES TTNV_KHOA(MaNhapVien)
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

ALTER TABLE DonThuoc
ADD CONSTRAINT CHK_SoLg_Positive CHECK (SoLg > 0);


ALTER TABLE HSBA
ADD CONSTRAINT DF_TrangThai DEFAULT N'Chưa duyệt' FOR TrangThai;

ALTER TABLE DonThuoc
ADD CONSTRAINT DF_GhiChu DEFAULT N'Không có ghi chú' FOR GhiChu;

ALTER TABLE Thuoc
ADD CONSTRAINT DF_BH DEFAULT 1 FOR BH; -- 1 = Có bảo hiểm

INSERT INTO NhanVien (
    MaNV, HoTen, NgaySinh, DiaChi, CCCD, SDT, ChucVu, GioiTinh, TaiKhoan, MatKhau, Khoa
)
VALUES
('NV001', N'Nguyễn Văn A', '1980-05-10', N'123 Lê Lợi, Q1', '012345678901', '0901234567', N'Bác sĩ', N'Nam', 'nva', 'matkhau1', 'K001'),
('NV002', N'Trần Thị B', '1985-07-20', N'45 Nguyễn Huệ, Q3', '012345678902', '0902345678', N'Y tá', N'Nữ', 'ttb', 'matkhau2', 'K002'),
('NV003', N'Lê Văn C', '1990-01-15', N'78 Trần Hưng Đạo, Q5', '012345678903', '0903456789', N'Bác sĩ', N'Nam', 'lvc', 'matkhau3', 'K003'),
('NV004', N'Phạm Thị D', '1988-03-30', N'12 Lý Tự Trọng, Q1', '012345678904', '0904567890', N'Y sĩ', N'Nữ', 'ptd', 'matkhau4', 'K004'),
('NV005', N'Hoàng Văn E', '1992-09-25', N'91 Cách Mạng Tháng 8, Q10', '012345678905', '0905678901', N'Hộ lý', N'Nam', 'hve', 'matkhau5', 'K005');


INSERT INTO BenhNhan (
    MaBN, CCCD, HoTen, NgaySinh, GTinh, NgheNghiep, DanToc, NgoaiKieu, DiaChi,
    NoiLamViec, DoiTuong, SoBHYT, GitriBHYT, HoTenNTNhan, DiaChiNT, SDTNTNhan,
    MatKhau, STT, TrieuChung, Khoa, TaiKham, TgKham
)
VALUES
('BN001', '123456789001', N'Nguyễn Văn F', '1990-01-01', N'Nam', N'Kỹ sư', N'Kinh', NULL, N'123 Lê Lợi, Q1',
 N'Công ty ABC', N'BHYT', 'SV123456789', '2025-12-31', N'Trần Thị G', N'456 Nguyễn Trãi', '0909123456',
 'mkbn001', 1, N'Sốt cao', 'K001', 'Có', '2025-04-01'),

('BN002', '123456789002', N'Trần Thị H', '1985-05-20', N'Nữ', N'Giáo viên', N'Kinh', NULL, N'78 Lý Thường Kiệt, Q3',
 N'Trường X', N'BHYT', 'SV123456790', '2025-10-30', N'Ngô Văn I', N'789 Trần Hưng Đạo', '0909876543',
 'mkbn002', 2, N'Đau đầu', 'K002', 'Không', '2025-04-02'),

('BN003', '123456789003', N'Lê Văn J', '2000-09-09', N'Nam', N'Sinh viên', N'Kinh', NULL, N'45 Đinh Tiên Hoàng, Q5',
 N'Đại học Y', N'BHYT', 'SV123456791', '2026-01-01', N'Phạm Thị K', N'12 Lê Văn Sỹ', '0912123456',
 'mkbn003', 3, N'Nôn ói', 'K003', 'Có', '2025-04-03'),

('BN004', '123456789004', N'Hoàng Thị L', '1978-12-12', N'Nữ', N'Nội trợ', N'Kinh', NULL, N'67 CMT8, Q10',
 N'Nhà riêng', N'BHYT', 'SV123456792', '2025-11-15', N'Nguyễn Văn M', N'34 Nguyễn Du', '0912987654',
 'mkbn004', 4, N'Mất ngủ', 'K004', 'Không', '2025-04-04'),

('BN005', '123456789005', N'Phạm Văn N', '1995-03-15', N'Nam', N'Lái xe', N'Kinh', NULL, N'23 Phan Đình Phùng, Q1',
 N'Công ty J', N'BHYT', 'SV123456793', '2025-09-20', N'Vũ Thị O', N'88 Hùng Vương', '0909999888',
 'mkbn005', 5, N'Tiêu chảy', 'K005', 'Có', '2025-04-05');


 INSERT INTO HSBA (MaHSBA, NgayTao, TrangThai, Khoa, NguoiTao, MaBN)
VALUES 
('HSBA001', '2025-04-01', 'Đang điều trị', 'Khoa A', 'Bác sĩ Nguyễn Văn A', 'BN001'),
('HSBA002', '2025-04-02', 'Đã điều trị xong', 'Khoa B', 'Bác sĩ Trần Thị B', 'BN002'),
('HSBA003', '2025-04-03', 'Đang điều trị', 'Khoa C', 'Bác sĩ Phạm Minh C', 'BN003'),
('HSBA004', '2025-04-04', 'Chờ kết quả xét nghiệm', 'Khoa D', 'Bác sĩ Lê Hương D', 'BN004'),
('HSBA005', '2025-04-05', 'Đã điều trị xong', 'Khoa E', 'Bác sĩ Hoàng Thu E', 'BN005');

INSERT INTO TaiKham (MaBN, MaHSBA, TGTaiKham, TrangThai)
VALUES 
('BN001', 'HSBA001', '2025-04-10', 'Chờ tái khám'),
('BN002', 'HSBA002', '2025-04-12', 'Đã tái khám'),
('BN003', 'HSBA003', '2025-04-15', 'Chờ tái khám'),
('BN004', 'HSBA004', '2025-04-20', 'Chưa tái khám'),
('BN005', 'HSBA005', '2025-04-25', 'Đã tái khám');

INSERT INTO XetNghiem (MaXN, LoaiXN)
VALUES 
('XN001', 'Xét nghiệm máu'),
('XN002', 'Xét nghiệm nước tiểu'),
('XN003', 'Xét nghiệm X-ray'),
('XN004', 'Xét nghiệm siêu âm'),
('XN005', 'Xét nghiệm PCR');

INSERT INTO HSBA_XetNghiem (MaHSBA, MaXN, KQXetNghiem, TgianTao, BacSyXN)
VALUES 
('HSBA001', 'XN001', 'Kết quả xét nghiệm máu bình thường', '2025-04-01', 'Bác sĩ Nguyễn Văn A'),
('HSBA002', 'XN002', 'Nước tiểu có dấu hiệu viêm', '2025-04-02', 'Bác sĩ Trần Thị B'),
('HSBA003', 'XN003', 'Kết quả X-ray cho thấy có dấu hiệu vỡ xương', '2025-04-03', 'Bác sĩ Phạm Minh C'),
('HSBA004', 'XN004', 'Siêu âm bình thường, không có vấn đề lớn', '2025-04-04', 'Bác sĩ Lê Hương D'),
('HSBA005', 'XN005', 'Xét nghiệm PCR âm tính với virus', '2025-04-05', 'Bác sĩ Hoàng Thu E');

INSERT INTO PhieuChamSoc (MaHSBA, Ngay, DienBienBenh, YLenh, TenDieuDuong)
VALUES 
('HSBA001', '2025-04-06', 'Bệnh nhân ổn định, đã cải thiện', 'Tiếp tục điều trị', 'Điều dưỡng Nguyễn Thị A'),
('HSBA002', '2025-04-07', 'Bệnh nhân có triệu chứng đau nhẹ', 'Xét nghiệm lại', 'Điều dưỡng Trần Thị B'),
('HSBA003', '2025-04-08', 'Bệnh nhân đau dữ dội, cần can thiệp', 'Tiến hành phẫu thuật', 'Điều dưỡng Phạm Minh C'),
('HSBA004', '2025-04-09', 'Bệnh nhân có dấu hiệu ổn định', 'Được xuất viện', 'Điều dưỡng Lê Hương D'),
('HSBA005', '2025-04-10', 'Bệnh nhân tỉnh táo, có thể ra viện', 'Ra viện sau khi điều trị xong', 'Điều dưỡng Hoàng Thu E');


INSERT INTO ChanDoan (MaHSBA, NoiChuyenDen, KKB_CapCuu, TTBanDau, PhauThuat, BenhChinh, BenhKemTheo, TaiBien, BienChung, NoiTru, NgoaiTru, TaiKham, NgayTaiKham)
VALUES 
('HSBA001', 'Bệnh viện A', 'Không có', 'Tình trạng ổn định', 'Không', 'Viêm phổi', 'Không', 'Không', 'Không', 'Có', 'Không', 'Không', '2025-04-10'),
('HSBA002', 'Bệnh viện B', 'Có', 'Tình trạng nặng', 'Có', 'Viêm đường tiết niệu', 'Viêm gan', 'Không', 'Sốt cao', 'Có', 'Không', 'Không', '2025-04-15'),
('HSBA003', 'Bệnh viện C', 'Có', 'Chấn thương nặng', 'Có', 'Gãy xương', 'Không', 'Không', 'Dị ứng thuốc', 'Có', 'Không', 'Chờ kết quả', '2025-04-20'),
('HSBA004', 'Bệnh viện D', 'Không có', 'Sốt, đau nhẹ', 'Không', 'Cảm cúm', 'Không', 'Không', 'Không', 'Có', 'Không', 'Không', '2025-04-25'),
('HSBA005', 'Bệnh viện E', 'Không có', 'Đau nhẹ', 'Không', 'Cảm lạnh', 'Không', 'Không', 'Không', 'Có', 'Không', 'Không', '2025-04-30');


INSERT INTO Thuoc (IDThuoc, TenThuoc, NSX, HSD, BH)
VALUES 
('T001', 'Paracetamol', '2025-01-01', '2027-01-01', 1),
('T002', 'Amoxicillin', '2024-05-10', '2026-05-10', 0),
('T003', 'Ibuprofen', '2025-03-15', '2027-03-15', 1),
('T004', 'Aspirin', '2023-09-20', '2025-09-20', 1),
('T005', 'Vitamin C', '2024-06-01', '2026-06-01', 0);


INSERT INTO DonThuoc (MaDonThuoc, IDThuoc, SoLg, DvTinh, LieuDung, GhiChu)
VALUES 
('DT001', 'T001', 10, 'Viên', '1 viên mỗi 4 giờ', 'Dùng khi có triệu chứng sốt'),
('DT002', 'T002', 20, 'Viên', '500mg mỗi 8 giờ', 'Chữa viêm họng cấp'),
('DT003', 'T003', 15, 'Viên', '1 viên mỗi 6 giờ', 'Giảm đau, hạ sốt'),
('DT004', 'T004', 5, 'Viên', '1 viên mỗi ngày', 'Giảm đau, chống viêm'),
('DT005', 'T005', 30, 'Viên', '1 viên mỗi ngày', 'Tăng cường sức đề kháng');


INSERT INTO DonThuoc_HSBA (MaHSBA, MaDonThuoc, TGianBDauSD, TGianKThucSD)
VALUES 
('HSBA001', 'DT001', '2025-04-06', '2025-04-10'),
('HSBA002', 'DT002', '2025-04-07', '2025-04-15'),
('HSBA003', 'DT003', '2025-04-08', '2025-04-12'),
('HSBA004', 'DT004', '2025-04-09', '2025-04-14'),
('HSBA005', 'DT005', '2025-04-10', '2025-04-20');

INSERT INTO Khoa (MaKhoa, TenKhoa, TTNV_Khoa, TGChuyenDen)
VALUES 
('K001', 'Khoa Nội', 'Bác sĩ Nguyễn Văn A', '2025-04-01'),
('K002', 'Khoa Ngoại', 'Bác sĩ Trần Thị B', '2025-04-02'),
('K003', 'Khoa Sản', 'Bác sĩ Phạm Minh C', '2025-04-03'),
('K004', 'Khoa Tim Mạch', 'Bác sĩ Lê Hương D', '2025-04-04'),
('K005', 'Khoa Mắt', 'Bác sĩ Hoàng Thu E', '2025-04-05');

INSERT INTO TTNV_KHOA (MaNhapVien, MaKhoa, TgChuyenDen)
VALUES 
('NV001', 'K001', '2025-04-01'),
('NV002', 'K002', '2025-04-02'),
('NV003', 'K003', '2025-04-03'),
('NV004', 'K004', '2025-04-04'),
('NV005', 'K005', '2025-04-05');



INSERT INTO TTNhapVien (MaHSBA, MaNhapVien, TgianVnVien, Buong, Giuong, LyDoVao, NoiGTieu, NVienLanThu, ChuyenVien, BVChuyenDen, TGRaVien, LyDoRaVien)
VALUES 
('HSBA001', 'NV001', '2025-04-01', 'Buồng 1', 'Giuong 1', 'Khám và điều trị viêm phổi', 'Khoa Nội', 1, 'Không', 'Bệnh viện A', '2025-04-10', 'Khỏi bệnh'),
('HSBA002', 'NV002', '2025-04-02', 'Buồng 2', 'Giuong 2', 'Chữa trị viêm đường tiết niệu', 'Khoa Ngoại', 2, 'Chuyển viện', 'Bệnh viện B', '2025-04-15', 'Đã xuất viện'),
('HSBA003', 'NV003', '2025-04-03', 'Buồng 3', 'Giuong 3', 'Chấn thương xương', 'Khoa Sản', 1, 'Không', 'Bệnh viện C', '2025-04-20', 'Chưa ra viện'),
('HSBA004', 'NV004', '2025-04-04', 'Buồng 4', 'Giuong 4', 'Phẫu thuật tim mạch', 'Khoa Tim Mạch', 3, 'Chuyển viện', 'Bệnh viện D', '2025-04-25', 'Đang điều trị'),
('HSBA005', 'NV005', '2025-04-05', 'Buồng 5', 'Giuong 5', 'Khám và điều trị bệnh mắt', 'Khoa Mắt', 2, 'Không', 'Bệnh viện E', '2025-04-30', 'Chữa trị xong');


INSERT INTO KhieuNai (IDKNai, IDBenhNhan, LyDo, NgayKN, TrangThai, XuLyKN, MaNV)
VALUES 
('KN001', 'BN001', 'Bệnh nhân không hài lòng với thái độ bác sĩ', '2025-04-10', 'Đang xử lý', 'Bác sĩ được yêu cầu giải thích lại quy trình', 'NV001'),
('KN002', 'BN002', 'Bệnh nhân phàn nàn về chất lượng dịch vụ điều dưỡng', '2025-04-12', 'Đã xử lý', 'Điều dưỡng đã xin lỗi và cam kết cải thiện', 'NV002'),
('KN003', 'BN003', 'Bệnh nhân không hài lòng về thời gian chờ đợi', '2025-04-15', 'Đang xử lý', 'Lãnh đạo bệnh viện sẽ xem xét', 'NV003'),
('KN004', 'BN004', 'Bệnh nhân phản ánh về chi phí điều trị', '2025-04-18', 'Đã xử lý', 'Giải thích chi phí và điều kiện bảo hiểm', 'NV004'),
('KN005', 'BN005', 'Bệnh nhân không hài lòng về vệ sinh phòng bệnh', '2025-04-20', 'Đang xử lý', 'Đang kiểm tra lại quy trình vệ sinh', 'NV005');

