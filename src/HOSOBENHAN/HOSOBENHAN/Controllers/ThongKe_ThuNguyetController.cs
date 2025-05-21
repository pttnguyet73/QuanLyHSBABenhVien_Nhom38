using HOSOBENHAN.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace HOSOBENHAN.Controllers
{
    public class ThongKe_ThuNguyetController : Controller
    {
     private readonly HttpClient _httpClient;

    public ThongKe_ThuNguyetController(IHttpClientFactory httpClientFactory)
    {
        _httpClient = httpClientFactory.CreateClient();
    }

    public async Task<IActionResult> Dashboard()
    {
            var apiUrl = "https://localhost:7015/api/ThongKe_ThuNguyet/Month"; // hoặc URL nội bộ
            var apiweek = "https://localhost:7015/api/ThongKe_ThuNguyet/Date";
            var topKhoa = "https://localhost:7015/api/ThongKe_ThuNguyet/Top3Khoa";
            var columnmonth = "https://localhost:7015/api/ThongKe_ThuNguyet/ColumnMonth";
            var piechart = "https://localhost:7015/api/ThongKe_ThuNguyet/HSBA";

            LineChart chartData = null;
            LineChart chartData1 = null;
            List<TopKhoa> topKhoa1 = null;
            ColumnChart columnChart = null;
            List<PieChart> pieChart1 = null;

            try
            {
                chartData = await _httpClient.GetFromJsonAsync<LineChart>(apiUrl);
                chartData1 = await _httpClient.GetFromJsonAsync<LineChart>(apiweek);
                columnChart = await _httpClient.GetFromJsonAsync<ColumnChart>(columnmonth);
                pieChart1 = await _httpClient.GetFromJsonAsync<List<PieChart>>(piechart);

                // Gọi API lấy JSON chuỗi
                var response = await _httpClient.GetAsync(topKhoa);
                if (response.IsSuccessStatusCode)
                {
                    var jsonString = await response.Content.ReadAsStringAsync();
                    topKhoa1 = JsonConvert.DeserializeObject<List<TopKhoa>>(jsonString);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi gọi API: " + ex.Message);
            }
            var viewModel = new DashboardViewModel
            {
                MonthChart = chartData ?? new LineChart(),
                DateChart = chartData1 ?? new LineChart(),
                CircleChart = topKhoa1 ?? new List<TopKhoa>(),
                ColumnChart = columnChart ?? new ColumnChart(),
                PieChart = pieChart1 ?? new List<PieChart>(),
            };

            return View(viewModel);
        }
    }
}
   
