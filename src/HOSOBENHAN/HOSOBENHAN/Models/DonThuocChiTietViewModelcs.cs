namespace HOSOBENHAN.Models
{
    public class DonThuocChiTietViewModel
    {
        public string MaHSBA { get; set; }
        public string MaDonThuoc { get; set; }
        public DateTime NgayTao { get; set; }
        public string BacSiPhuTrach { get; set; }
        public DateTime TGianBDauSD { get; set; }
        public DateTime TGianKThucSD { get; set; }

        public List<ThuocChiTietItem> ChiTietThuoc { get; set; }
    }

    public class ThuocChiTietItem
    {
        public string TenThuoc { get; set; }
        public int SoLuong { get; set; }
        public string DonViTinh { get; set; }
        public string LieuDung { get; set; }
        public string GhiChu { get; set; }
    }

}
