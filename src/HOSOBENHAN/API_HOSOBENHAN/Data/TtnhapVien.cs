using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("TTNhapVien")]
    public class TTNhapVien
    {
        [Key, MaxLength(10)]
        public string MaNhapVien { get; set; }

        [ForeignKey("HSBA"), MaxLength(10)]
        public string MaHSBA { get; set; }
        public HSBA HSBA { get; set; }
        public DateTime? TgianVnVien { get; set; }

        [MaxLength(50)]
        public string Buong { get; set; }

        [MaxLength(50)]
        public string Giuong { get; set; }

        [MaxLength(100)]
        public string LyDoVao { get; set; }

        [MaxLength(100)]
        public string NoiGTieu { get; set; }

        public int? NVienLanThu { get; set; }

        [MaxLength(100)]
        public string ChuyenVien { get; set; }

        [MaxLength(100)]
        public string BVChuyenDen { get; set; }

        public DateTime? TGRaVien { get; set; }

        [MaxLength(100)]
        public string LyDoRaVien { get; set; }

    }
}