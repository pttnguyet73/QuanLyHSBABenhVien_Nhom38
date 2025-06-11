namespace HOSOBENHAN.Models
{

    public class DonThuocViewModel
    {
        public string MaHSBA { get; set; }
        public DateTime NgayTao { get; set; }
        public DateTime ThoiGianBatDau { get; set; }
        public DateTime ThoiGianKetThuc { get; set; }
        public string BacSiPhuTrach { get; set; }
        public List<ThuocChiTietViewModel> ThuocChiTiets { get; set; }
    }
}
