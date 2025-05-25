using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("DonThuoc_HSBA")]
    public class DonThuoc_HSBA
    {
        [ForeignKey ("HSBA"), MaxLength(10)]
        public string MaHSBA { get; set; }
        public HSBA HSBA { get; set; }

        [ForeignKey ("DONTHUOC"), MaxLength(10)]
        public string MaDonThuoc { get; set; }
        public DonThuoc DonThuoc { get; set; }
        public DateTime? TGianBDauSD { get; set; }

        public DateTime? TGianKThucSD { get; set; }

        
    }

}