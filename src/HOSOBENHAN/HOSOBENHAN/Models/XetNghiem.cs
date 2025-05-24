using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class XetNghiem
    {
        public XetNghiem()
        {
            HsbaXetNghiems = new HashSet<HsbaXetNghiem>();
        }

        public string MaXn { get; set; } = null!;
        public string? LoaiXn { get; set; }

        public virtual ICollection<HsbaXetNghiem> HsbaXetNghiems { get; set; }
    }
}
