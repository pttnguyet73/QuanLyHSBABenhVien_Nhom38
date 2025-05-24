using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class HsbaXetNghiem
    {
        public string MaHsba { get; set; } = null!;
        public string MaXn { get; set; } = null!;
        public string? KqxetNghiem { get; set; }
        public DateTime? TgianTao { get; set; }
        public string? BacSyXn { get; set; }

        public virtual Hsba MaHsbaNavigation { get; set; } = null!;
        public virtual XetNghiem MaXnNavigation { get; set; } = null!;
    }
}
