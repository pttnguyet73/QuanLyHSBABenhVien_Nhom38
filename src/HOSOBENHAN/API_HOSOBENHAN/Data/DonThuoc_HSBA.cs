using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("DonThuoc_HSBA")]
    public class DonThuoc_HSBA
    {
        [Key, Column(Order = 0), MaxLength(10)]
        public string MaHSBA { get; set; }

        [Key, Column(Order = 1), MaxLength(10)]
        public string MaDonThuoc { get; set; }

        public DateTime? TGianBDauSD { get; set; }

        public DateTime? TGianKThucSD { get; set; }

        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }

        [ForeignKey("MaDonThuoc")]
        public DonThuoc DonThuoc { get; set; }
    }

}