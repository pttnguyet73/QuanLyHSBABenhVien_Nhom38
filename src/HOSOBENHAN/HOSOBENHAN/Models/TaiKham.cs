using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("TaiKham")]
    public class TaiKham
    {
        [Key, Column(Order = 0)]
        [MaxLength(10)]
        public string MaBN { get; set; }

        [Key, Column(Order = 1)]
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        public DateTime? TGTaiKham { get; set; }

        [MaxLength(50)]
        public string TrangThai { get; set; }

        [ForeignKey("MaBN")]
        public BenhNhan BenhNhan { get; set; }

        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }
    }
}