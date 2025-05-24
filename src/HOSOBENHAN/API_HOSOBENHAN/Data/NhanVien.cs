using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class NhanVien
    {
        public NhanVien()
        {
            KhieuNais = new HashSet<KhieuNai>();
        }

        public string MaNv { get; set; } = null!;
        public string HoTen { get; set; } = null!;
        public DateTime? NgaySinh { get; set; }
        public string? DiaChi { get; set; }
        public string? Cccd { get; set; }
        public string Sdt { get; set; } = null!;
        public string? ChucVu { get; set; }
        public string? GioiTinh { get; set; }
        public string TaiKhoan { get; set; } = null!;
        public string MatKhau { get; set; } = null!;
        public string? Khoa { get; set; }

        public virtual ICollection<KhieuNai> KhieuNais { get; set; }
    }
}
