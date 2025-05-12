using HOSOBENHAN.Models;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Models
{

    [Table("NhanVien")]
    public class NhanVien
    {
        [Key]
        [MaxLength(10)]
        public string MaNV { get; set; }

        [Required]
        [MaxLength(100)]
        public string HoTen { get; set; }

        public DateTime? NgaySinh { get; set; }

        [MaxLength(200)]
        public string DiaChi { get; set; }

        [MaxLength(12)]
        public string CCCD { get; set; }

        [Required]
        [MaxLength(15)]
        public string SDT { get; set; }

        [MaxLength(50)]
        public string ChucVu { get; set; }

        [MaxLength(10)]
        public string GioiTinh { get; set; }

        [Required]
        [MaxLength(50)]
        public string TaiKhoan { get; set; }

        [Required]
        [MaxLength(100)]
        public string MatKhau { get; set; }

        [MaxLength(50)]
        public string Khoa { get; set; }

        // Navigation property
        public ICollection<KhieuNai> KhieuNais { get; set; }
    }
}