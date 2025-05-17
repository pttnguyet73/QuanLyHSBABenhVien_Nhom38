using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("HSBA_XetNghiem")]
    public class HSBA_XetNghiem
    {
        [ForeignKey("HSBA")]
        [MaxLength(10)]
        public string MaHSBA { get; set; }
        public HSBA HSBA { get; set; }

        [ForeignKey("XetNghiem")]
        [MaxLength(10)]
        public string MaXN { get; set; }
        public XetNghiem XetNghiem { get; set; }

        [MaxLength(200)]
        public string KQXetNghiem { get; set; }

        public DateTime? TgianTao { get; set; }

        [ForeignKey("NhanVien"), MaxLength(100)]
        public string BacSyXN { get; set; }
        public NhanVien NhanVien { get; set; }

    }
}
