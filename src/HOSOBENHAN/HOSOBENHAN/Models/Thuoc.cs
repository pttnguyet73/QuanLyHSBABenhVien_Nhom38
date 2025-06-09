using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Models
{
    [Table("Thuoc")]
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
