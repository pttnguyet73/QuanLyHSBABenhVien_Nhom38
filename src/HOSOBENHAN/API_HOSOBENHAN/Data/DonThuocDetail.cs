using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("DonThuocDetal")]
    public class DonThuocDetail
    {
        [ForeignKey("DonThuoc"), MaxLength(10)]
        public string MaDonThuoc { get; set; }
        public DonThuoc DonThuoc { get; set; }

        [ForeignKey("Thuoc"), MaxLength(10)]
        public string IdThuoc { get; set; }
        public Thuoc Thuoc { get; set; }
        public int? SoLg { get; set; }

        public string? DvTinh { get; set; }
        public string? LieuDung { get; set; }
        public string? GhiChu { get; set; }


    }
}
