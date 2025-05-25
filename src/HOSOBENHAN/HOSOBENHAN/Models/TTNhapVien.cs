using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("TTNhapVien")]
    public class TTNhapVien
    {
        [Key, MaxLength(10)]
        public string MaNhapVien { get; set; }

        [MaxLength(10)]
        public string MaHSBA { get; set; }

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

        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }

        public TTNV_KHOA TTNV_KHOA { get; set; }
        public ICollection<TTNV_KHOA> TTNV_KHOAs { get; set; }

    }
}