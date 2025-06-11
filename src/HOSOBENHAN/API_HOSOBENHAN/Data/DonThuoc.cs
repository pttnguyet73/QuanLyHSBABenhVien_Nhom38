using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("DonThuoc")]
    public class DonThuoc
    {
        [Key, MaxLength(10)]
        public string MaDonThuoc { get; set; }

        [Required, MaxLength(10)]
            [ForeignKey ("Thuoc")]
        public string IDThuoc { get; set; }
            public Thuoc Thuoc { get; set; }

        public int? SoLg { get; set; }

        [MaxLength(50)]
        public string DvTinh { get; set; }

        [MaxLength(100)]
        public string LieuDung { get; set; }

        [MaxLength(200)]
        public string GhiChu { get; set; }
    }

}