namespace HOSOBENHAN.Models
{
    public class DashboardViewModel
    {
        public LineChart MonthChart { get; set; }
        public LineChart DateChart { get; set; }
        public List<TopKhoa> CircleChart { get; set; }
        public ColumnChart ColumnChart { get; set; }
        public List<PieChart> PieChart { get; set; }
        public List<XetNghiemChart> xetNghiemChart { get; set; }
        public List<TaiKhamChart> taiKhamChart { get;set; }
        public List<ThongKeNhanSu> nhansu {  get; set; }
        public ChanDoanChart chanDoanChart { get; set;}
        public SoLuongChart soLuongChart { get; set ; }
        public List<ThangBenhAn> listbaView { get; set; }
        public List<BenhNhanTheoKhoa> bntheokhoa { get; set; }
        public List<BNChuaCoHSBA> bNChuaCoHSBAs { get; set; }
    }
}
