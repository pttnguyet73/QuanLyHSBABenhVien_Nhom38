using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class BenhNhan
    {
        public BenhNhan()
        {
            Hsbas = new HashSet<Hsba>();
            KhieuNais = new HashSet<KhieuNai>();
        }

        public string MaBn { get; set; } = null!;
        public string? Cccd { get; set; }
        public string HoTen { get; set; } = null!;
        public DateTime? NgaySinh { get; set; }
        public string? Gtinh { get; set; }
        public string? NgheNghiep { get; set; }
        public string? DanToc { get; set; }
        public string? NgoaiKieu { get; set; }
        public string DiaChi { get; set; } = null!;
        public string? NoiLamViec { get; set; }
        public string DoiTuong { get; set; } = null!;
        public string? SoBhyt { get; set; }
        public DateTime? GitriBhyt { get; set; }
        public string? HoTenNtnhan { get; set; } = null!;
        public string? DiaChiNt { get; set; } = null!;
        public string? Sdtntnhan { get; set; } = null!;
        public string MatKhau { get; set; } = null!;
        public int? Stt { get; set; }
        public string? TrieuChung { get; set; }
        public string? Khoa { get; set; }
        public string? TaiKham { get; set; }
        public DateTime? TgKham { get; set; }
        public DateTime? NgayTao { get; set; }

        public virtual ICollection<Hsba> Hsbas { get; set; }
        public virtual ICollection<KhieuNai> KhieuNais { get; set; }
    }
}
