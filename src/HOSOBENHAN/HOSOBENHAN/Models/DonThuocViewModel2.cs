namespace HOSOBENHAN.Models
{
    public class DonThuocViewModel2
    {
        public DateTime? NgayTao { get; set; }
        public string NguoiTaoHoTen { get; set; }
        public List<ChiTietThuocViewModel> ChiTietThuocs { get; set; }
    }

    public class ChiTietThuocViewModel
    {
        public string TenThuoc { get; set; }
        public int SoLuong { get; set; }
        public string DonViTinh { get; set; }
        public string LieuDung { get; set; }
        public string GhiChu { get; set; }
    }

}
