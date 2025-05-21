namespace HOSOBENHAN.Models
{
    public class ColumnChart
    {
        public List<string> Labels { get; set; }
        public List<int> Series1 { get; set; } // Nội trú
        public List<int> Series2 { get; set; } // Ngoại trú
    }

}
