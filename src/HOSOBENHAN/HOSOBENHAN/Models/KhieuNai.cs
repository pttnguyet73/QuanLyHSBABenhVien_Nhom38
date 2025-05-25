using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Models
{
    [Table("KhieuNai")]
    public class KhieuNai
    {
        [MaxLength(10)]
        public string IDKNai { get; set; }

        [MaxLength(10)]
        public string IDBenhNhan { get; set; }

        [MaxLength(200)]
        public string LyDo { get; set; }

        public DateTime? NgayKN { get; set; }

        [MaxLength(50)]
        public string TrangThai { get; set; }

        [MaxLength(200)]
        public string XuLyKN { get; set; }

        [MaxLength(10)]
        public string MaNV { get; set; }

        [ForeignKey("IDBenhNhan")]
        public BenhNhan BenhNhan { get; set; }

        [ForeignKey("MaNV")]
        public NhanVien NhanVien { get; set; }
    }
}
