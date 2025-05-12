using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Models
{
    [Table("XetNghiem")]
    public class XetNghiem
    {
        [Key]
        [MaxLength(10)]
        public string MaXN { get; set; }

        [MaxLength(100)]
        public string LoaiXN { get; set; }

        // Navigation property
        public ICollection<HSBA_XetNghiem> HSBA_XetNghiems { get; set; }
    }
}
