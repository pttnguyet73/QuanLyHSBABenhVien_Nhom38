using System;
using System.Collections.Generic;

namespace HOSOBENHAN.Data
{
    public partial class Hsba
    {
        public Hsba()
        {
            DonThuocHsbas = new HashSet<DonThuocHsba>();
            HsbaXetNghiems = new HashSet<HsbaXetNghiem>();
            PhieuChamSocs = new HashSet<PhieuChamSoc>();
            TtnhapViens = new HashSet<TtnhapVien>();
        }

        public string MaHsba { get; set; } = null!;
        public DateTime? NgayTao { get; set; }
        public string? TrangThai { get; set; }
        public string? Khoa { get; set; }
        public string? NguoiTao { get; set; }
        public string? MaBn { get; set; }

        public virtual BenhNhan? MaBnNavigation { get; set; }
        public virtual ChanDoan? ChanDoan { get; set; }
        public virtual TaiKham? TaiKham { get; set; }
        public virtual ICollection<DonThuocHsba> DonThuocHsbas { get; set; }
        public virtual ICollection<HsbaXetNghiem> HsbaXetNghiems { get; set; }
        public virtual ICollection<PhieuChamSoc> PhieuChamSocs { get; set; }
        public virtual ICollection<TtnhapVien> TtnhapViens { get; set; }
    }
}
