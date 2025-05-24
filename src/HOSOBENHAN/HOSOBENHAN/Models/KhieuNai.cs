using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class KhieuNai
    {
        public string Idknai { get; set; } = null!;
        public string IdbenhNhan { get; set; } = null!;
        public string? LyDo { get; set; }
        public DateTime? NgayKn { get; set; }
        public string? TrangThai { get; set; }
        public string? XuLyKn { get; set; }
        public string? MaNv { get; set; }

        public virtual BenhNhan IdbenhNhanNavigation { get; set; } = null!;
        public virtual NhanVien? MaNvNavigation { get; set; }
    }
}
