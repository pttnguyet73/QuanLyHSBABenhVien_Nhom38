using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Data
{
    [Table("TTNV_KHOA")]
    public class TTNV_KHOA
    {
        // Khóa ngoại cho MaNhapVien và MaKhoa
        [ForeignKey("TTNhapVien")]
        [MaxLength(10)]
        public string MaNhapVien { get; set; }

        [ForeignKey("Khoa")]
        [MaxLength(10)]
        public string MaKhoa { get; set; }

        // Thời gian chuyển đến khoa
        public DateTime? TgChuyenDen { get; set; }

        // Mối quan hệ với bảng Khoa thông qua MaKhoa
        public Khoa Khoa { get; set; }

        // Mối quan hệ với bảng TTNhapVien thông qua MaNhapVien
        public TTNhapVien TTNhapVien { get; set; }
    }
}
