using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class Thuoc
    {
        public Thuoc()
        {
            DonThuocDetals = new HashSet<DonThuocDetal>();
        }

        public string Idthuoc { get; set; } = null!;
        public string? TenThuoc { get; set; }
        public DateTime? Nsx { get; set; }
        public DateTime? Hsd { get; set; }
        public bool? Bh { get; set; }

        public virtual ICollection<DonThuocDetal> DonThuocDetals { get; set; }
    }
}
