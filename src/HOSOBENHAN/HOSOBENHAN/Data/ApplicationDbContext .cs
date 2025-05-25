using Microsoft.EntityFrameworkCore;
using HOSOBENHAN.Models;

namespace HOSOBENHAN.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<HSBA> HSBAs { get; set; }
        public DbSet<BenhNhan> BenhNhans { get; set; }
        public DbSet<NhanVien> NhanViens { get; set; }
        public DbSet<Khoa> Khoas { get; set; }
        public DbSet<XetNghiem> XetNghiems { get; set; }
        public DbSet<HSBA_XetNghiem> HSBA_XetNghiems { get; set; }
        public DbSet<DonThuoc> DonThuocs { get; set; }
        public DbSet<DonThuoc_HSBA> DonThuoc_HSBAs { get; set; }
        public DbSet<KhieuNai> KhieuNais { get; set; }
        public DbSet<PhieuChamSoc> PhieuChamSocs { get; set; }
        public DbSet<TTNV_KHOA> TTNV_KHOAs { get; set; }
        public DbSet<TaiKham> TaiKhams { get; set; } // ✅ Thêm DbSet TaiKham

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Composite key cho HSBA_XetNghiem
            modelBuilder.Entity<HSBA_XetNghiem>()
                .HasKey(x => new { x.MaHSBA, x.MaXN });

            modelBuilder.Entity<HSBA_XetNghiem>()
                .HasOne(x => x.HSBA)
                .WithMany(h => h.HSBA_XetNghiems)
                .HasForeignKey(x => x.MaHSBA)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<HSBA_XetNghiem>()
                .HasOne(x => x.XetNghiem)
                .WithMany(xn => xn.HSBA_XetNghiems)
                .HasForeignKey(x => x.MaXN)
                .OnDelete(DeleteBehavior.Cascade);

            // Composite key cho DonThuoc_HSBA
            modelBuilder.Entity<DonThuoc_HSBA>()
                .HasKey(dt => new { dt.MaHSBA, dt.MaDonThuoc });

            modelBuilder.Entity<DonThuoc_HSBA>()
                .HasOne(dt => dt.HSBA)
                .WithMany(h => h.DonThuoc_HSBAs)
                .HasForeignKey(dt => dt.MaHSBA)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<DonThuoc_HSBA>()
                .HasOne(dt => dt.DonThuoc)
                .WithMany(d => d.DonThuoc_HSBAs)
                .HasForeignKey(dt => dt.MaDonThuoc)
                .OnDelete(DeleteBehavior.Cascade);

            // Composite key cho KhieuNai
            modelBuilder.Entity<KhieuNai>()
                .HasKey(kn => new { kn.IDKNai, kn.IDBenhNhan });

            // Composite key cho PhieuChamSoc
            modelBuilder.Entity<PhieuChamSoc>()
                .HasKey(p => new { p.MaHSBA, p.Ngay });

            modelBuilder.Entity<PhieuChamSoc>()
                .HasOne(p => p.HSBA)
                .WithMany(h => h.PhieuChamSocs)
                .HasForeignKey(p => p.MaHSBA)
                .OnDelete(DeleteBehavior.Cascade);

            // Composite key cho TTNV_KHOA
            modelBuilder.Entity<TTNV_KHOA>()
                .HasKey(t => new { t.MaNhapVien, t.MaKhoa });

            modelBuilder.Entity<TTNV_KHOA>()
                .HasOne(t => t.Khoa)
                .WithMany(k => k.TTNV_KHOAs)
                .HasForeignKey(t => t.MaKhoa)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<TTNV_KHOA>()
                .HasOne(t => t.TTNhapVien)
                .WithMany(nv => nv.TTNV_KHOAs)
                .HasForeignKey(t => t.MaNhapVien)
                .OnDelete(DeleteBehavior.Cascade);

            // ✅ Composite key cho TaiKham
            modelBuilder.Entity<TaiKham>()
                .HasKey(tk => new { tk.MaBN, tk.MaHSBA });

            modelBuilder.Entity<TaiKham>()
                .HasOne(tk => tk.BenhNhan)
                .WithMany(bn => bn.TaiKhams)
                .HasForeignKey(tk => tk.MaBN)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<TaiKham>()
                .HasOne(tk => tk.HSBA)
                .WithMany(hs => hs.TaiKhams)
                .HasForeignKey(tk => tk.MaHSBA)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
