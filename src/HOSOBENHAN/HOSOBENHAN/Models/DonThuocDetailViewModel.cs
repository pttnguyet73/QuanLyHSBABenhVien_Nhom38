namespace HOSOBENHAN.Models
{
    public class DonThuocDetailViewModel
    {
        public string MaHSBA { get; set; }
        public string MaDonThuoc { get; set; }
        public DateTime NgayTao { get; set; }
        public DateTime TGianBDauSD { get; set; }
        public DateTime TGianKThucSD { get; set; }
        public string BacSiPhuTrach { get; set; }

        public List<ThuocItem> ChiTietThuoc { get; set; }

        public class ThuocItem
        {
            public int STT { get; set; }
            public string TenThuoc { get; set; }
            public int SoLuong { get; set; }
            public string DonViTinh { get; set; }
            public string LieuDung { get; set; }
            public string GhiChu { get; set; }
        }
    }
}
