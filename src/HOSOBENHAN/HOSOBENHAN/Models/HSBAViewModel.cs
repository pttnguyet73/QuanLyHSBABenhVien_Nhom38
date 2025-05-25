namespace HOSOBENHAN.Models
{
    public class HSBAViewModel
    {
        public string MaHSBA { get; set; }
        public string TrangThai { get; set; }
        public string NguoiTao { get; set; }
        public string Khoa { get; set; }
        public string TenBenhNhan { get; set; }

        // Các thuộc tính hỗ trợ lọc
        public string Search { get; set; }
        public string SelectedKhoa { get; set; }
        public string SelectedTrangThai { get; set; }
        public List<string> DanhSachKhoa { get; set; }
    }
}
