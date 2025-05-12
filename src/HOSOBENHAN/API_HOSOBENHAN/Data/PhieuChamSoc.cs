using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Data
{
    [Keyless]
    [Table("PhieuChamSoc")]
    public class PhieuChamSoc
    {
        [ForeignKey("HSBA")]
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        public DateTime Ngay { get; set; }

        [MaxLength(200)]
        public string DienBienBenh { get; set; }

        [MaxLength(200)]
        public string YLenh { get; set; }

        [MaxLength(100)]
        public string TenDieuDuong { get; set; }

        public HSBA HSBA { get; set; }
    }
}
