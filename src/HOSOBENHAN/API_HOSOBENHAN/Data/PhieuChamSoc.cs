using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class PhieuChamSoc
    {
        public string MaHsba { get; set; } = null!;
        public DateTime Ngay { get; set; }
        public string? DienBienBenh { get; set; }
        public string? Ylenh { get; set; }
        public string? TenDieuDuong { get; set; }

        public virtual Hsba? MaHsbaNavigation { get; set; } = null!;
    }
}
