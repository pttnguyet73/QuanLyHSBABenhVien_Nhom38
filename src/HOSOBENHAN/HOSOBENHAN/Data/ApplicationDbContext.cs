using Microsoft.EntityFrameworkCore;
using HOSOBENHAN.Models; // thay bằng namespace chứa các model như HSBA, BenhNhan, v.v.

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<HSBA> HSBA { get; set; }
    public DbSet<BenhNhan> BenhNhan { get; set; }
    public DbSet<NhanVien> NhanVien { get; set; }
    public DbSet<Khoa> Khoa { get; set; }
}