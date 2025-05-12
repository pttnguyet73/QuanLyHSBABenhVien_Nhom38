using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("ChanDoan")]
    public class ChanDoan
    {
        [Key, MaxLength(10)]
        public string MaHSBA { get; set; }

        [MaxLength(100)]
        public string NoiChuyenDen { get; set; }

        [MaxLength(100)]
        public string KKB_CapCuu { get; set; }

        [MaxLength(100)]
        public string TTBanDau { get; set; }

        [MaxLength(100)]
        public string PhauThuat { get; set; }

        [MaxLength(100)]
        public string BenhChinh { get; set; }

        [MaxLength(100)]
        public string BenhKemTheo { get; set; }

        [MaxLength(100)]
        public string TaiBien { get; set; }

        [MaxLength(100)]
        public string BienChung { get; set; }

        [MaxLength(100)]
        public string NoiTru { get; set; }

        [MaxLength(100)]
        public string NgoaiTru { get; set; }

        [MaxLength(100)]
        public string TaiKham { get; set; }

        public DateTime? NgayTaiKham { get; set; }

        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }
    }

}


