using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class TtnvKhoa
    {
        public string MaNhapVien { get; set; } = null!;
        public string MaKhoa { get; set; } = null!;
        public DateTime? TgChuyenDen { get; set; }

        public virtual Khoa MaKhoaNavigation { get; set; } = null!;
        public virtual TtnhapVien MaNhapVienNavigation { get; set; } = null!;
    }
}
