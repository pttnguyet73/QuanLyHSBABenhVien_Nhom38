using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Data
{
    [Table("DonThuoc_HSBA")]
    public class DonThuoc_HSBA
    {
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }

        [MaxLength(10)]
        public string MaDonThuoc { get; set; }

        [ForeignKey("MaDonThuoc")]
        public DonThuoc donThuoc { get; set; }

        public DateTime? TGianBDauSD { get; set; }

        public DateTime? TGianKThucSD { get; set; }
    }
}
