using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("DonThuocDetal")]
    public class DonThuocDetal
    {
        public string MaDonThuoc { get; set; }
        public string IDThuoc { get; set; }

        public int SoLg { get; set; }
        public string DvTinh { get; set; }
        public string LieuDung { get; set; }
        public string GhiChu { get; set; }

        public DonThuoc DonThuoc { get; set; }
        public Thuoc Thuoc { get; set; }
    }
}