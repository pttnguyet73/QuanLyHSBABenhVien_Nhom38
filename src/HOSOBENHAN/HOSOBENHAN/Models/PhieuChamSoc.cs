using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("PhieuChamSoc")]
    public class PhieuChamSoc
    {
        [Key, Column(Order = 0)]
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        [Key, Column(Order = 1)]
        public DateTime Ngay { get; set; }

        [MaxLength(200)]
        public string DienBienBenh { get; set; }

        [MaxLength(200)]
        public string YLenh { get; set; }

        [MaxLength(100)]
        public string TenDieuDuong { get; set; }

        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }
    }
}