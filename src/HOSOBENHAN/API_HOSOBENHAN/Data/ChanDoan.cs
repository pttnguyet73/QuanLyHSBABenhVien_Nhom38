using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class ChanDoan
    {
        public string MaHsba { get; set; } = null!;
        public string? NoiChuyenDen { get; set; }
        public string? KkbCapCuu { get; set; }
        public string? TtbanDau { get; set; }
        public string? PhauThuat { get; set; }
        public string? BenhChinh { get; set; }
        public string? BenhKemTheo { get; set; }
        public string? TaiBien { get; set; }
        public string? BienChung { get; set; }
        public string? NoiTru { get; set; }
        public string? NgoaiTru { get; set; }
        public string? TaiKham { get; set; }
        public DateTime? NgayTaiKham { get; set; }

        public virtual Hsba MaHsbaNavigation { get; set; } = null!;
    }
}
