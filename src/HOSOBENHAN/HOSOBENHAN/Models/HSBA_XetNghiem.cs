using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("HSBA_XetNghiem")]
    public class HSBA_XetNghiem
    {
        [Key, Column(Order = 0)]
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        [Key, Column(Order = 1)]
        [MaxLength(10)]
        public string MaXN { get; set; }

        [MaxLength(200)]
        public string KQXetNghiem { get; set; }

        public DateTime? TgianTao { get; set; }

        [MaxLength(100)]
        public string BacSyXN { get; set; }

        public string AnhXetNghiem { get; set; }


        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }

        [ForeignKey("MaXN")]
        public XetNghiem XetNghiem { get; set; }
    }
}
