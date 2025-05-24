using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class TtnhapVien
    {
        public TtnhapVien()
        {
            TtnvKhoas = new HashSet<TtnvKhoa>();
        }

        public string? MaHsba { get; set; }
        public string MaNhapVien { get; set; } = null!;
        public DateTime? TgianVnVien { get; set; }
        public string? Buong { get; set; }
        public string? Giuong { get; set; }
        public string? LyDoVao { get; set; }
        public string? NoiGtieu { get; set; }
        public int? NvienLanThu { get; set; }
        public string? ChuyenVien { get; set; }
        public string? BvchuyenDen { get; set; }
        public DateTime? TgraVien { get; set; }
        public string? LyDoRaVien { get; set; }

        public virtual Hsba? MaHsbaNavigation { get; set; }
        public virtual ICollection<TtnvKhoa> TtnvKhoas { get; set; }
    }
}
