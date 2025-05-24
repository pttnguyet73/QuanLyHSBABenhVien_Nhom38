using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class DonThuocHsba
    {
        public string MaHsba { get; set; } = null!;
        public string MaDonThuoc { get; set; } = null!;
        public DateTime? TgianBdauSd { get; set; }
        public DateTime? TgianKthucSd { get; set; }

        public virtual DonThuoc MaDonThuocNavigation { get; set; } = null!;
        public virtual Hsba MaHsbaNavigation { get; set; } = null!;
    }
}
