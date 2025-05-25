using Microsoft.AspNetCore.Identity.Data;
using Microsoft.EntityFrameworkCore;

namespace HOSOBENHAN.Data
{
    public class HSBADBContext : DbContext
    {
        public HSBADBContext(DbContextOptions<HSBADBContext> options) : base(options)
        {
        }

        // DbSets cho các bảng
        public DbSet<NhanVien> NhanViens { get; set; }
        public DbSet<BenhNhan> BenhNhans { get; set; }
        public DbSet<HSBA> HSBAs { get; set; }
        public DbSet<TaiKham> TaiKhams { get; set; }
        public DbSet<XetNghiem> XetNghiems { get; set; }
        public DbSet<HSBA_XetNghiem> HSBA_XetNghiems { get; set; }
        public DbSet<PhieuChamSoc> PhieuChamSocs { get; set; }
        public DbSet<ChanDoan> ChanDoans { get; set; }
        public DbSet<Thuoc> Thuocs { get; set; }
        public DbSet<DonThuoc> DonThuocs { get; set; }
        public DbSet<DonThuoc_HSBA> DonThuoc_HSBAs { get; set; }
        public DbSet<Khoa> Khoas { get; set; }
        public DbSet<TTNV_KHOA> TTNV_KHOAs { get; set; }
        public DbSet<TTNhapVien> TTNhapViens { get; set; }
        public DbSet<KhieuNai> KhieuNais { get; set; }
        public DbSet<DonThuocDetail> DonThuocsDetail { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<PhieuChamSoc>()
 .HasKey(p => new { p.MaHSBA, p.Ngay }); // Khóa chính kép

            // Nếu cần ánh xạ thêm quan hệ:
            modelBuilder.Entity<PhieuChamSoc>()
                .HasOne(p => p.HSBA)
                .WithMany(h => h.PhieuChamSocs) // nếu HSBA có List<PhieuChamSoc>
                .HasForeignKey(p => p.MaHSBA);

            // Các ánh xạ khóa ngoại
            modelBuilder.Entity<HSBA_XetNghiem>()
                .HasKey(x => new { x.MaHSBA, x.MaXN });

            modelBuilder.Entity<DonThuoc_HSBA>()
                .HasKey(x => new { x.MaHSBA, x.MaDonThuoc });

            modelBuilder.Entity<TTNV_KHOA>()
                .HasKey(x => new { x.MaNhapVien, x.MaKhoa });

            modelBuilder.Entity<TTNhapVien>()
                .HasKey(x => x.MaNhapVien);

            modelBuilder.Entity<KhieuNai>()
                .HasKey(x => new { x.IDKNai, x.IDBenhNhan });

            modelBuilder.Entity<PhieuChamSoc>()
                .HasKey(x => new { x.MaHSBA });
            modelBuilder.Entity<DonThuocDetail>()
                .HasKey(x => new { x.MaDonThuoc, x.IdThuoc });
        }
    }
}
