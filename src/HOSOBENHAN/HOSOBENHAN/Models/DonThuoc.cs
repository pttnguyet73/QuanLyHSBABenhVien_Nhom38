using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class DonThuoc
    {
        public DonThuoc()
        {
            DonThuocDetals = new HashSet<DonThuocDetal>();
            DonThuocHsbas = new HashSet<DonThuocHsba>();
        }

        public string MaDonThuoc { get; set; } = null!;
        public DateTime? NgayTao { get; set; }
        public string? NguoiTao { get; set; }

        public virtual ICollection<DonThuocDetal> DonThuocDetals { get; set; }
        public virtual ICollection<DonThuocHsba> DonThuocHsbas { get; set; }
    }
}
