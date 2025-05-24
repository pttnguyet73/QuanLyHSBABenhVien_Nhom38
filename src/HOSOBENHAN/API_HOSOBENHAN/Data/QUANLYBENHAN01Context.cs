using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace HOSOBENHAN.Data
{
    public partial class QUANLYBENHAN01Context : DbContext
    {
        public QUANLYBENHAN01Context()
        {
        }

        public QUANLYBENHAN01Context(DbContextOptions<QUANLYBENHAN01Context> options)
            : base(options)
        {
        }

        public virtual DbSet<BenhNhan> BenhNhans { get; set; } = null!;
        public virtual DbSet<ChanDoan> ChanDoans { get; set; } = null!;
        public virtual DbSet<DonThuoc> DonThuocs { get; set; } = null!;
        public virtual DbSet<DonThuocDetal> DonThuocDetals { get; set; } = null!;
        public virtual DbSet<DonThuocHsba> DonThuocHsbas { get; set; } = null!;
        public virtual DbSet<Hsba> Hsbas { get; set; } = null!;
        public virtual DbSet<HsbaXetNghiem> HsbaXetNghiems { get; set; } = null!;
        public virtual DbSet<KhieuNai> KhieuNais { get; set; } = null!;
        public virtual DbSet<Khoa> Khoas { get; set; } = null!;
        public virtual DbSet<NhanVien> NhanViens { get; set; } = null!;
        public virtual DbSet<PhieuChamSoc> PhieuChamSocs { get; set; } = null!;
        public virtual DbSet<TaiKham> TaiKhams { get; set; } = null!;
        public virtual DbSet<Thuoc> Thuocs { get; set; } = null!;
        public virtual DbSet<TtnhapVien> TtnhapViens { get; set; } = null!;
        public virtual DbSet<TtnvKhoa> TtnvKhoas { get; set; } = null!;
        public virtual DbSet<XetNghiem> XetNghiems { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=DESKTOP-46KFG52\\SQLEXPRESS;Initial Catalog=QUANLYBENHAN01;Integrated Security=True ; Trust Server Certificate=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BenhNhan>(entity =>
            {
                entity.HasKey(e => e.MaBn)
                    .HasName("PK__BenhNhan__272475AD4E4A89F1");

                entity.ToTable("BenhNhan");

                entity.Property(e => e.MaBn)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaBN");

                entity.Property(e => e.Cccd)
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("CCCD");

                entity.Property(e => e.DanToc).HasMaxLength(50);

                entity.Property(e => e.DiaChi).HasMaxLength(200);

                entity.Property(e => e.DiaChiNt)
                    .HasMaxLength(200)
                    .HasColumnName("DiaChiNT");

                entity.Property(e => e.DoiTuong).HasMaxLength(50);

                entity.Property(e => e.GitriBhyt)
                    .HasColumnType("date")
                    .HasColumnName("GitriBHYT");

                entity.Property(e => e.Gtinh)
                    .HasMaxLength(10)
                    .HasColumnName("GTinh");

                entity.Property(e => e.HoTen).HasMaxLength(100);

                entity.Property(e => e.HoTenNtnhan)
                    .HasMaxLength(100)
                    .HasColumnName("HoTenNTNhan");

                entity.Property(e => e.Khoa).HasMaxLength(50);

                entity.Property(e => e.MatKhau)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.NgaySinh).HasColumnType("date");

                entity.Property(e => e.NgayTao)
                    .HasColumnType("datetime")
                    .HasColumnName("ngayTao");

                entity.Property(e => e.NgheNghiep).HasMaxLength(50);

                entity.Property(e => e.NgoaiKieu).HasMaxLength(50);

                entity.Property(e => e.NoiLamViec).HasMaxLength(200);

                entity.Property(e => e.Sdtntnhan)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("SDTNTNhan");

                entity.Property(e => e.SoBhyt)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("SoBHYT");

                entity.Property(e => e.Stt).HasColumnName("STT");

                entity.Property(e => e.TaiKham).HasMaxLength(50);

                entity.Property(e => e.TgKham).HasColumnType("date");

                entity.Property(e => e.TrieuChung).HasMaxLength(200);
            });

            modelBuilder.Entity<ChanDoan>(entity =>
            {
                entity.HasKey(e => e.MaHsba)
                    .HasName("PK__ChanDoan__1D20D7A7F6722E39");

                entity.ToTable("ChanDoan");

                entity.Property(e => e.MaHsba)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaHSBA");

                entity.Property(e => e.BenhChinh).HasMaxLength(100);

                entity.Property(e => e.BenhKemTheo).HasMaxLength(100);

                entity.Property(e => e.BienChung).HasMaxLength(100);

                entity.Property(e => e.KkbCapCuu)
                    .HasMaxLength(100)
                    .HasColumnName("KKB_CapCuu");

                entity.Property(e => e.NgayTaiKham).HasColumnType("date");

                entity.Property(e => e.NgoaiTru).HasMaxLength(100);

                entity.Property(e => e.NoiChuyenDen).HasMaxLength(100);

                entity.Property(e => e.NoiTru).HasMaxLength(100);

                entity.Property(e => e.PhauThuat).HasMaxLength(100);

                entity.Property(e => e.TaiBien).HasMaxLength(100);

                entity.Property(e => e.TaiKham).HasMaxLength(100);

                entity.Property(e => e.TtbanDau)
                    .HasMaxLength(100)
                    .HasColumnName("TTBanDau");

                entity.HasOne(d => d.MaHsbaNavigation)
                    .WithOne(p => p.ChanDoan)
                    .HasForeignKey<ChanDoan>(d => d.MaHsba)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__ChanDoan__MaHSBA__36B12243");
            });

            modelBuilder.Entity<DonThuoc>(entity =>
            {
                entity.HasKey(e => e.MaDonThuoc)
                    .HasName("PK__DonThuoc__3EF99EE17F5847CA");

                entity.ToTable("DonThuoc");

                entity.Property(e => e.MaDonThuoc)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.NgayTao)
                    .HasColumnType("date")
                    .HasColumnName("ngayTao");

                entity.Property(e => e.NguoiTao)
                    .HasMaxLength(10)
                    .HasColumnName("nguoiTao");
            });

            modelBuilder.Entity<DonThuocDetal>(entity =>
            {
                entity.HasKey(e => new { e.MaDonThuoc, e.Idthuoc })
                    .HasName("PK__DonThuoc__BDDEA15981A8B1D2");

                entity.ToTable("DonThuocDetal");

                entity.Property(e => e.MaDonThuoc)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Idthuoc)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("IDThuoc");

                entity.Property(e => e.DvTinh).HasMaxLength(50);

                entity.Property(e => e.GhiChu)
                    .HasMaxLength(200)
                    .HasDefaultValueSql("(N'Không có ghi chú')");

                entity.Property(e => e.LieuDung).HasMaxLength(100);

                entity.HasOne(d => d.IdthuocNavigation)
                    .WithMany(p => p.DonThuocDetals)
                    .HasForeignKey(d => d.Idthuoc)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DonThuocD__IDThu__3E52440B");

                entity.HasOne(d => d.MaDonThuocNavigation)
                    .WithMany(p => p.DonThuocDetals)
                    .HasForeignKey(d => d.MaDonThuoc)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DonThuocD__MaDon__3D5E1FD2");
            });

            modelBuilder.Entity<DonThuocHsba>(entity =>
            {
                entity.HasKey(e => new { e.MaHsba, e.MaDonThuoc })
                    .HasName("PK__DonThuoc__1ECF4E496AA2CF70");

                entity.ToTable("DonThuoc_HSBA");

                entity.Property(e => e.MaHsba)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaHSBA");

                entity.Property(e => e.MaDonThuoc)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.TgianBdauSd)
                    .HasColumnType("date")
                    .HasColumnName("TGianBDauSD");

                entity.Property(e => e.TgianKthucSd)
                    .HasColumnType("date")
                    .HasColumnName("TGianKThucSD");

                entity.HasOne(d => d.MaDonThuocNavigation)
                    .WithMany(p => p.DonThuocHsbas)
                    .HasForeignKey(d => d.MaDonThuoc)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DonThuoc___MaDon__4222D4EF");

                entity.HasOne(d => d.MaHsbaNavigation)
                    .WithMany(p => p.DonThuocHsbas)
                    .HasForeignKey(d => d.MaHsba)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__DonThuoc___MaHSB__412EB0B6");
            });

            modelBuilder.Entity<Hsba>(entity =>
            {
                entity.HasKey(e => e.MaHsba)
                    .HasName("PK__HSBA__1D20D7A71ED87C50");

                entity.ToTable("HSBA");

                entity.Property(e => e.MaHsba)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaHSBA");

                entity.Property(e => e.Khoa).HasMaxLength(50);

                entity.Property(e => e.MaBn)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaBN");

                entity.Property(e => e.NgayTao).HasColumnType("date");

                entity.Property(e => e.NguoiTao).HasMaxLength(100);

                entity.Property(e => e.TrangThai)
                    .HasMaxLength(50)
                    .HasDefaultValueSql("(N'Chưa duyệt')");

                entity.HasOne(d => d.MaBnNavigation)
                    .WithMany(p => p.Hsbas)
                    .HasForeignKey(d => d.MaBn)
                    .HasConstraintName("FK__HSBA__MaBN__286302EC");
            });

            modelBuilder.Entity<HsbaXetNghiem>(entity =>
            {
                entity.HasKey(e => new { e.MaHsba, e.MaXn })
                    .HasName("PK__HSBA_Xet__6F5285A8C609153B");

                entity.ToTable("HSBA_XetNghiem");

                entity.Property(e => e.MaHsba)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaHSBA");

                entity.Property(e => e.MaXn)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaXN");

                entity.Property(e => e.BacSyXn)
                    .HasMaxLength(100)
                    .HasColumnName("BacSyXN");

                entity.Property(e => e.KqxetNghiem)
                    .HasMaxLength(200)
                    .HasColumnName("KQXetNghiem");

                entity.Property(e => e.TgianTao).HasColumnType("date");

                entity.HasOne(d => d.MaHsbaNavigation)
                    .WithMany(p => p.HsbaXetNghiems)
                    .HasForeignKey(d => d.MaHsba)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HSBA_XetN__MaHSB__300424B4");

                entity.HasOne(d => d.MaXnNavigation)
                    .WithMany(p => p.HsbaXetNghiems)
                    .HasForeignKey(d => d.MaXn)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HSBA_XetNg__MaXN__30F848ED");
            });

            modelBuilder.Entity<KhieuNai>(entity =>
            {
                entity.HasKey(e => new { e.Idknai, e.IdbenhNhan })
                    .HasName("PK__KhieuNai__A1880E0DC84A4C5A");

                entity.ToTable("KhieuNai");

                entity.Property(e => e.Idknai)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("IDKNai");

                entity.Property(e => e.IdbenhNhan)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("IDBenhNhan");

                entity.Property(e => e.LyDo).HasMaxLength(200);

                entity.Property(e => e.MaNv)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaNV");

                entity.Property(e => e.NgayKn)
                    .HasColumnType("date")
                    .HasColumnName("NgayKN");

                entity.Property(e => e.TrangThai).HasMaxLength(50);

                entity.Property(e => e.XuLyKn)
                    .HasMaxLength(200)
                    .HasColumnName("XuLyKN");

                entity.HasOne(d => d.IdbenhNhanNavigation)
                    .WithMany(p => p.KhieuNais)
                    .HasForeignKey(d => d.IdbenhNhan)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__KhieuNai__IDBenh__4E88ABD4");

                entity.HasOne(d => d.MaNvNavigation)
                    .WithMany(p => p.KhieuNais)
                    .HasForeignKey(d => d.MaNv)
                    .HasConstraintName("FK__KhieuNai__MaNV__4D94879B");
            });

            modelBuilder.Entity<Khoa>(entity =>
            {
                entity.HasKey(e => e.MaKhoa)
                    .HasName("PK__Khoa__6539040583FA51B9");

                entity.ToTable("Khoa");

                entity.Property(e => e.MaKhoa)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.TenKhoa).HasMaxLength(100);
            });

            modelBuilder.Entity<NhanVien>(entity =>
            {
                entity.HasKey(e => e.MaNv)
                    .HasName("PK__NhanVien__2725D70AFFD6FF3C");

                entity.ToTable("NhanVien");

                entity.Property(e => e.MaNv)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaNV");

                entity.Property(e => e.Cccd)
                    .HasMaxLength(12)
                    .IsUnicode(false)
                    .HasColumnName("CCCD");

                entity.Property(e => e.ChucVu).HasMaxLength(50);

                entity.Property(e => e.DiaChi).HasMaxLength(200);

                entity.Property(e => e.GioiTinh).HasMaxLength(10);

                entity.Property(e => e.HoTen).HasMaxLength(100);

                entity.Property(e => e.Khoa)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MatKhau)
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.NgaySinh).HasColumnType("date");

                entity.Property(e => e.Sdt)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("SDT");

                entity.Property(e => e.TaiKhoan)
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PhieuChamSoc>(entity =>
            {
                entity.HasKey(e => new { e.MaHsba, e.Ngay })
                    .HasName("PK__PhieuCha__2B9C19DC7DE01119");

                entity.ToTable("PhieuChamSoc");

                entity.Property(e => e.MaHsba)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaHSBA");

                entity.Property(e => e.Ngay).HasColumnType("date");

                entity.Property(e => e.DienBienBenh).HasMaxLength(200);

                entity.Property(e => e.TenDieuDuong).HasMaxLength(100);

                entity.Property(e => e.Ylenh)
                    .HasMaxLength(200)
                    .HasColumnName("YLenh");

                entity.HasOne(d => d.MaHsbaNavigation)
                    .WithMany(p => p.PhieuChamSocs)
                    .HasForeignKey(d => d.MaHsba)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__PhieuCham__MaHSB__33D4B598");
            });

            modelBuilder.Entity<TaiKham>(entity =>
            {
                entity.HasKey(e => e.MaHsba)
                    .HasName("PK__TaiKham__1D20D7A78B02475C");

                entity.ToTable("TaiKham");

                entity.Property(e => e.MaHsba)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaHSBA");

                entity.Property(e => e.TgtaiKham)
                    .HasColumnType("date")
                    .HasColumnName("TGTaiKham");

                entity.Property(e => e.TrangThai).HasMaxLength(50);

                entity.HasOne(d => d.MaHsbaNavigation)
                    .WithOne(p => p.TaiKham)
                    .HasForeignKey<TaiKham>(d => d.MaHsba)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__TaiKham__MaHSBA__2B3F6F97");
            });

            modelBuilder.Entity<Thuoc>(entity =>
            {
                entity.HasKey(e => e.Idthuoc)
                    .HasName("PK__Thuoc__3273FB89B98FD39C");

                entity.ToTable("Thuoc");

                entity.Property(e => e.Idthuoc)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("IDThuoc");

                entity.Property(e => e.Bh)
                    .HasColumnName("BH")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Hsd)
                    .HasColumnType("date")
                    .HasColumnName("HSD");

                entity.Property(e => e.Nsx)
                    .HasColumnType("date")
                    .HasColumnName("NSX");

                entity.Property(e => e.TenThuoc).HasMaxLength(100);
            });

            modelBuilder.Entity<TtnhapVien>(entity =>
            {
                entity.HasKey(e => e.MaNhapVien)
                    .HasName("PK__TTNhapVi__D3641966A2C44D79");

                entity.ToTable("TTNhapVien");

                entity.Property(e => e.MaNhapVien)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.Buong).HasMaxLength(50);

                entity.Property(e => e.BvchuyenDen)
                    .HasMaxLength(100)
                    .HasColumnName("BVChuyenDen");

                entity.Property(e => e.ChuyenVien).HasMaxLength(100);

                entity.Property(e => e.Giuong).HasMaxLength(50);

                entity.Property(e => e.LyDoRaVien).HasMaxLength(100);

                entity.Property(e => e.LyDoVao).HasMaxLength(100);

                entity.Property(e => e.MaHsba)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaHSBA");

                entity.Property(e => e.NoiGtieu)
                    .HasMaxLength(100)
                    .HasColumnName("NoiGTieu");

                entity.Property(e => e.NvienLanThu).HasColumnName("NVienLanThu");

                entity.Property(e => e.TgianVnVien).HasColumnType("date");

                entity.Property(e => e.TgraVien)
                    .HasColumnType("date")
                    .HasColumnName("TGRaVien");

                entity.HasOne(d => d.MaHsbaNavigation)
                    .WithMany(p => p.TtnhapViens)
                    .HasForeignKey(d => d.MaHsba)
                    .HasConstraintName("FK__TTNhapVie__MaHSB__46E78A0C");
            });

            modelBuilder.Entity<TtnvKhoa>(entity =>
            {
                entity.HasKey(e => new { e.MaNhapVien, e.MaKhoa })
                    .HasName("PK__TTNV_KHO__953789263CE76D97");

                entity.ToTable("TTNV_KHOA");

                entity.Property(e => e.MaNhapVien)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.MaKhoa)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.TgChuyenDen).HasColumnType("date");

                entity.HasOne(d => d.MaKhoaNavigation)
                    .WithMany(p => p.TtnvKhoas)
                    .HasForeignKey(d => d.MaKhoa)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__TTNV_KHOA__MaKho__49C3F6B7");

                entity.HasOne(d => d.MaNhapVienNavigation)
                    .WithMany(p => p.TtnvKhoas)
                    .HasForeignKey(d => d.MaNhapVien)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__TTNV_KHOA__MaNha__4AB81AF0");
            });

            modelBuilder.Entity<XetNghiem>(entity =>
            {
                entity.HasKey(e => e.MaXn)
                    .HasName("PK__XetNghie__272520F63125514E");

                entity.ToTable("XetNghiem");

                entity.Property(e => e.MaXn)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("MaXN");

                entity.Property(e => e.LoaiXn)
                    .HasMaxLength(100)
                    .HasColumnName("LoaiXN");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
