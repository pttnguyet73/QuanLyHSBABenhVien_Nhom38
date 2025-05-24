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

    public async Task<IActionResult> Dashboard(int? year, int? month)
    {

            ViewBag.SelectedYear = year;
            ViewBag.SelectedMonth = month;
            var apiUrl = "";
            if (month.HasValue)
                apiUrl = $"https://localhost:7015/api/ThongKe_ThuNguyet/Date?year={year}&month={month}";
            else if (year.HasValue)
                apiUrl = $"https://localhost:7015/api/ThongKe_ThuNguyet/Month?year={year}";
            else
                apiUrl = "https://localhost:7015/api/ThongKe_ThuNguyet/Year";

            var apiweek = "https://localhost:7015/api/ThongKe_ThuNguyet/Date";
            var topKhoa = "https://localhost:7015/api/ThongKe_ThuNguyet/Top3Khoa";
            var columnmonth = "https://localhost:7015/api/ThongKe_ThuNguyet/ColumnMonth";
            var piechart = "https://localhost:7015/api/ThongKe_ThuNguyet/HSBA";
            var xn = "https://localhost:7015/api/ThongKe_ThuNguyet/XetNghiem";
            var tk = "https://localhost:7015/api/ThongKe_ThuNguyet/TaiKham";
            var nhansu = "https://localhost:7015/api/ThongKe_ThuNguyet/ThongKeNhanSu";
            var chandoan = "https://localhost:7015/api/ThongKe_ThuNguyet/ThongKeChanDoan";
            var soluong = "https://localhost:7015/api/ThongKe_ThuNguyet/SoLuong";


            LineChart chartData = null;
            List<TopKhoa> topKhoa1 = null;
            ColumnChart columnChart = null;
            List<PieChart> pieChart1 = null;
            List<XetNghiemChart> xnghiem = null;
            List<TaiKhamChart> tkham = null;
            List<ThongKeNhanSu> nhanSus = null;
            ChanDoanChart chanDoans = null;
            SoLuongChart soLuong1 = null;
            try
            {
                chartData = await _httpClient.GetFromJsonAsync<LineChart>(apiUrl);
                columnChart = await _httpClient.GetFromJsonAsync<ColumnChart>(columnmonth);
                pieChart1 = await _httpClient.GetFromJsonAsync<List<PieChart>>(piechart);
                xnghiem = await _httpClient.GetFromJsonAsync<List<XetNghiemChart>>(xn);
                tkham = await _httpClient.GetFromJsonAsync<List<TaiKhamChart>>(tk);
                nhanSus = await _httpClient.GetFromJsonAsync<List<ThongKeNhanSu>>(nhansu);
                chanDoans = await _httpClient.GetFromJsonAsync<ChanDoanChart>(chandoan);
                soLuong1 = await _httpClient.GetFromJsonAsync<SoLuongChart>(soluong);

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
                CircleChart = topKhoa1 ?? new List<TopKhoa>(),
                ColumnChart = columnChart ?? new ColumnChart(),
                PieChart = pieChart1 ?? new List<PieChart>(),
                xetNghiemChart = xnghiem ?? new List<XetNghiemChart>(),
                taiKhamChart = tkham ?? new List<TaiKhamChart>(),
                nhansu = nhanSus ??  new List<ThongKeNhanSu>(),
                chanDoanChart = chanDoans ?? new ChanDoanChart(),
                soLuongChart = soLuong1 ?? new SoLuongChart(),
            };

            return View(viewModel);
        }
    }
}
   
