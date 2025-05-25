using HOSOBENHAN.Models;

namespace HOSOBENHAN.ViewModels
{
    public class HSBAIndexViewModel
    {
        public List<HSBAViewModel> DanhSachHSBA { get; set; }
        public List<string> DanhSachKhoa { get; set; }
        public string SelectedKhoa { get; set; }
        public string SelectedTrangThai { get; set; }
        public string Search { get; set; }
    }
}
