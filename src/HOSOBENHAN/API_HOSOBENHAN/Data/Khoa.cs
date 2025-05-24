using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class Khoa
    {
        public Khoa()
        {
            TtnvKhoas = new HashSet<TtnvKhoa>();
        }

        public string MaKhoa { get; set; } = null!;
        public string? TenKhoa { get; set; }

        public virtual ICollection<TtnvKhoa> TtnvKhoas { get; set; }
    }
}
