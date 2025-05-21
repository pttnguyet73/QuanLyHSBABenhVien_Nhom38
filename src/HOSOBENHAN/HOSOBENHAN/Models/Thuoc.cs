using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("Thuoc")]
    public class Thuoc
    {
        [Key, MaxLength(10)]
        public string IDThuoc { get; set; }

        [MaxLength(100)]
        public string TenThuoc { get; set; }

        public DateTime? NSX { get; set; }

        public DateTime? HSD { get; set; }

        public bool? BH { get; set; }

        public ICollection<DonThuoc> DonThuocs { get; set; }
    }

}