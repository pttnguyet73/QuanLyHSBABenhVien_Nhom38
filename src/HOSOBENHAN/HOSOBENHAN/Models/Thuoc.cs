using System.ComponentModel.DataAnnotations;

namespace HOSOBENHAN.Models
{
    public class Thuoc
    {
        [Key]
        public string IDThuoc { get; set; }
        public string TenThuoc { get; set; }
        public DateTime NSX { get; set; }
        public DateTime HSD { get; set; }
        public bool BH { get; set; }

        public ICollection<DonThuocDetal> DonThuocDetals { get; set; }
    }
}
