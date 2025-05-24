using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class DonThuocDetal
    {
        public string MaDonThuoc { get; set; } = null!;
        public string Idthuoc { get; set; } = null!;
        public int? SoLg { get; set; }
        public string? DvTinh { get; set; }
        public string? LieuDung { get; set; }
        public string? GhiChu { get; set; }

        public virtual Thuoc IdthuocNavigation { get; set; } = null!;
        public virtual DonThuoc MaDonThuocNavigation { get; set; } = null!;
    }
}
