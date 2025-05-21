using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("Khoa")]
    public class Khoa
    {
        [Key, MaxLength(10)]
        public string MaKhoa { get; set; }

        [MaxLength(100)]
        public string TenKhoa { get; set; }

        [MaxLength(100)]
        public string TTNV_Khoa { get; set; }

        public DateTime? TGChuyenDen { get; set; }

        public ICollection<TTNV_KHOA> TTNV_KHOAs { get; set; }
    }

}