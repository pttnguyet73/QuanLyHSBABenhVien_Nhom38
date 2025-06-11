using Microsoft.EntityFrameworkCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Models
{
    [Table("BenhNhan")]
    public class BenhNhan
    {
        [Key, MaxLength(10)]
        public string MaBN { get; set; }

        [MaxLength(12)]
        public string CCCD { get; set; }

        [Required, MaxLength(100)]
        public string HoTen { get; set; }

        public DateTime? NgaySinh { get; set; }

        [MaxLength(10)]
        public string GTinh { get; set; }

        [MaxLength(50)]
        public string NgheNghiep { get; set; }

        [MaxLength(50)]
        public string DanToc { get; set; }

        [MaxLength(50)]
        public string NgoaiKieu { get; set; }

        [Required, MaxLength(200)]
        public string DiaChi { get; set; }

        [MaxLength(200)]
        public string NoiLamViec { get; set; }

        [Required, MaxLength(50)]
        public string DoiTuong { get; set; }

        [MaxLength(20)]
        public string SoBHYT { get; set; }

        public DateTime? GitriBHYT { get; set; }

        [Required, MaxLength(100)]
        public string HoTenNTNhan { get; set; }

        [Required, MaxLength(200)]
        public string DiaChiNT { get; set; }

        [Required, MaxLength(15)]
        [Phone]
        public string SDTNTNhan { get; set; }

        [Required, MaxLength(100)]
        public string MatKhau { get; set; }

        public int? STT { get; set; }

        [MaxLength(200)]
        public string TrieuChung { get; set; }

        [MaxLength(50)]
        public string Khoa { get; set; }

        [MaxLength(50)]
        public string TaiKham { get; set; }

        public DateTime? TgKham { get; set; }

        public DateTime? NgayTao { get; set; }
        public ICollection<TaiKham> TaiKhams { get; set; }

    }
}
