using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Models
{
    [Table("DonThuoc")]
    public class DonThuoc

    {
        [Key]
        public string MaDonThuoc { get; set; }
        public DateTime NgayTao { get; set; }
        public string NguoiTao { get; set; }

        public ICollection<DonThuocDetal> DonThuocDetals { get; set; }
        public ICollection<DonThuoc_HSBA> DonThuoc_HSBAs { get; set; }
    }

}
