namespace HOSOBENHAN.Models
{
    public class BenhAn
    {
        public string maHSBA { get; set; }
        public string maBN { get; set; }
        public string hoTen { get; set; }
        public string ngaySinh { get; set; }
    }

    public class ThangBenhAn
    {
        public int thang { get; set; }
        public List<BenhAn> noiTru { get; set; }
        public List<BenhAn> ngoaiTru { get; set; }
    }
}
