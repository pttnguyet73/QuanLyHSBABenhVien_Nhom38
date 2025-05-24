using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class TaiKham
    {
        public string MaHsba { get; set; } = null!;
        public DateTime? TgtaiKham { get; set; }
        public string? TrangThai { get; set; }

        public virtual Hsba MaHsbaNavigation { get; set; } = null!;
    }
}
