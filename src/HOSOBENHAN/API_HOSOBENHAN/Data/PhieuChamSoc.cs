using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Data
{
    [Table("PhieuChamSoc")]
    public class PhieuChamSoc
    {
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        [ForeignKey("MaHSBA")]
        public HSBA HSBA { get; set; }

        public DateTime Ngay { get; set; }

        [MaxLength(200)]
        public string DienBienBenh { get; set; }

        [MaxLength(200)]
        public string YLenh { get; set; }

        [MaxLength(100)]
        public string TenDieuDuong { get; set; }
    }
}
