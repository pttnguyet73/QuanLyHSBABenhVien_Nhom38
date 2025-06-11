using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("DonThuoc_HSBA")]
    public class DonThuoc_HSBA
    {
        [Key, Column(Order = 0)]
        [StringLength(10)]
        public string MaHSBA { get; set; }

        [Key, Column(Order = 1)]
        [StringLength(10)]
        public string MaDonThuoc { get; set; }

        public DateTime TGianBDauSD { get; set; }
        public DateTime TGianKThucSD { get; set; }

        // Navigation properties
        public HSBA HSBA { get; set; }
        public DonThuoc DonThuoc { get; set; }
    }


}