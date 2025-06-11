using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("KhieuNai")]
    public class KhieuNai
    {
        [Key, MaxLength(10)]
        public string IDKNai { get; set; }

        [ForeignKey("BenhNhan"), MaxLength(10)]
        public string IDBenhNhan { get; set; }
        public BenhNhan BenhNhan { get; set; }

        [MaxLength(200)]
        public string LyDo { get; set; }

        public DateTime? NgayKN { get; set; }

        [MaxLength(50)]
        public string TrangThai { get; set; }

        [MaxLength(200)]
        public string XuLyKN { get; set; }

        [MaxLength(10)]
        public string MaNV { get; set; }

       
    }
}