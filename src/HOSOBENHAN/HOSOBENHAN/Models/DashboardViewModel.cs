namespace HOSOBENHAN.Models
{
    public class DashboardViewModel
    {
        public LineChart MonthChart { get; set; }
        public LineChart DateChart { get; set; }
        public List<TopKhoa> CircleChart { get; set; }
        public ColumnChart ColumnChart { get; set; } // chỉ 1 object

        public List<PieChart> PieChart { get; set; }
    }
}
