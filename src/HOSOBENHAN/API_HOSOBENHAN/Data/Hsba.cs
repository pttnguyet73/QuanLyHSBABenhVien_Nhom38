using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace HOSOBENHAN.Data
{
    [Table("HSBA")]
    public class HSBA
    {
        [Key]
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        public DateTime? NgayTao { get; set; }

        [MaxLength(50)]
        public string TrangThai { get; set; }

        [MaxLength(50)]
        public string Khoa { get; set; }

        [MaxLength(100)]
        public string NguoiTao { get; set; }

        [Required]
        [MaxLength(10)]
        public string MaBN { get; set; }

        [ForeignKey("MaBN")]
        public BenhNhan BenhNhan { get; set; }

        // Navigation properties
        public ICollection<TaiKham> TaiKhams { get; set; }
        public ICollection<HSBA_XetNghiem> HSBA_XetNghiems { get; set; }
        public ICollection<PhieuChamSoc> PhieuChamSocs { get; set; }
        public ChanDoan ChanDoan { get; set; }
        public ICollection<DonThuoc_HSBA> DonThuoc_HSBAs { get; set; }
        public TTNhapVien TTNhapVien { get; set; }
    }
}
