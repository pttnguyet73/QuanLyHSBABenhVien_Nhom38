using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Models
{
    [Table("TTNV_KHOA")]
    public class TTNV_KHOA
    {
        [MaxLength(10)]
        public string MaNhapVien { get; set; }

        [MaxLength(10)]
        public string MaKhoa { get; set; }

        public DateTime? TgChuyenDen { get; set; }

        [ForeignKey("MaKhoa")]
        public Khoa Khoa { get; set; }

        [ForeignKey("MaNhapVien")]
        public TTNhapVien TTNhapVien { get; set; }
    }
}
