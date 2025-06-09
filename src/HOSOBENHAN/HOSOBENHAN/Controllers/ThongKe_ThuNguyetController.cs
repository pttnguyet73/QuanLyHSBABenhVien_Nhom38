using HOSOBENHAN.Models;
using iText.Layout.Properties;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using OfficeOpenXml;
using System.Net.Http;


namespace HOSOBENHAN.Controllers
{
    public class ThongKe_ThuNguyetController : Controller
    {
     private readonly HttpClient _httpClient;

    public ThongKe_ThuNguyetController(IHttpClientFactory httpClientFactory)
    {
        _httpClient = httpClientFactory.CreateClient();
    }

    public async Task<IActionResult> Dashboard(int? year, int? month, string? luachon)
    {

            ViewBag.SelectedYear = year;
            ViewBag.SelectedMonth = month;
            ViewBag.LuaChon = luachon;
            var apiUrl = "";
            if (month.HasValue)
                apiUrl = $"https://localhost:7015/api/ThongKe_ThuNguyet/Date?year={year}&month={month}";
            else if (year.HasValue)
                apiUrl = $"https://localhost:7015/api/ThongKe_ThuNguyet/Month?year={year}";
            else
                apiUrl = "https://localhost:7015/api/ThongKe_ThuNguyet/Year";

            var piechart = "";
            if (luachon == "nam")
                piechart = "https://localhost:7015/api/ThongKe_ThuNguyet/HSBA_Year";
            else if (luachon == "thang")
                piechart = "https://localhost:7015/api/ThongKe_ThuNguyet/HSBA_Month";
            else
                piechart = "https://localhost:7015/api/ThongKe_ThuNguyet/HSBA_Day";

            var apiweek = "https://localhost:7015/api/ThongKe_ThuNguyet/Date";
            var topKhoa = "https://localhost:7015/api/ThongKe_ThuNguyet/Top3Khoa";
            var columnmonth = "https://localhost:7015/api/ThongKe_ThuNguyet/ColumnMonth";
            var xn = "https://localhost:7015/api/ThongKe_ThuNguyet/XetNghiem";
            var tk = "https://localhost:7015/api/ThongKe_ThuNguyet/TaiKham";
            var nhansu = "https://localhost:7015/api/ThongKe_ThuNguyet/ThongKeNhanSu";
            var chandoan = "https://localhost:7015/api/ThongKe_ThuNguyet/ThongKeChanDoan";
            var soluong = "https://localhost:7015/api/ThongKe_ThuNguyet/SoLuong";
            var listba = "https://localhost:7015/api/ThongKe_ThuNguyet/ColumnMonth_List";
            var bntheokhoa = "https://localhost:7015/api/ThongKe_ThuNguyet/ThongKeBenhNhanTheoKhoa";
            var bnchuacohsba = "https://localhost:7015/api/ThongKe_ThuNguyet/BenhNhanChuaCoHSBA";

            LineChart chartData = null;
            List<TopKhoa> topKhoa1 = null;
            ColumnChart columnChart = null;
            List<PieChart> pieChart1 = null;
            List<XetNghiemChart> xnghiem = null;
            List<TaiKhamChart> tkham = null;
            List<ThongKeNhanSu> nhanSus = null;
            ChanDoanChart chanDoans = null;
            SoLuongChart soLuong1 = null;
            List<ThangBenhAn> listba1 = null;
            List<BenhNhanTheoKhoa> bntheokhoa1 = null;
            List<BNChuaCoHSBA> bnchuacohsba1 = null;

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
                listba1 = await _httpClient.GetFromJsonAsync<List<ThangBenhAn>>(listba);
                bntheokhoa1 = await _httpClient.GetFromJsonAsync<List<BenhNhanTheoKhoa>>(bntheokhoa);
                bnchuacohsba1 = await _httpClient.GetFromJsonAsync<List<BNChuaCoHSBA>>(bnchuacohsba);

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
                nhansu = nhanSus ?? new List<ThongKeNhanSu>(),
                chanDoanChart = chanDoans ?? new ChanDoanChart(),
                soLuongChart = soLuong1 ?? new SoLuongChart(),
                listbaView = listba1 ?? new List<ThangBenhAn>(),
                bntheokhoa = bntheokhoa1 ?? new List<BenhNhanTheoKhoa>(),
                bNChuaCoHSBAs = bnchuacohsba1 ?? new List<BNChuaCoHSBA>(),
            };
            return View(viewModel);
        }
        [HttpGet]
        public async Task<IActionResult> ExportBNChuaCoHSBA()
        {
            var apiUrl = "https://localhost:7015/api/ThongKe_ThuNguyet/BenhNhanChuaCoHSBA";
            List<BNChuaCoHSBA> bnchuacohsba = new();

            try
            {
                bnchuacohsba = await _httpClient.GetFromJsonAsync<List<BNChuaCoHSBA>>(apiUrl);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi gọi API: " + ex.Message);
                return BadRequest("Không thể xuất dữ liệu");
            }

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("BNChuaCoHSBA");

                // Tạo tiêu đề cột
                worksheet.Cells[1, 1].Value = "Mã bệnh nhân";
                worksheet.Cells[1, 2].Value = "Họ tên";
                worksheet.Cells[1, 3].Value = "Số CCCD";
                worksheet.Cells[1, 4].Value = "Ngày tạo";

                // Ghi dữ liệu vào từng dòng
                for (int i = 0; i < bnchuacohsba.Count; i++)
                {
                    var bn = bnchuacohsba[i];
                    worksheet.Cells[i + 2, 1].Value = bn.MaBN;
                    worksheet.Cells[i + 2, 2].Value = bn.HoTen;
                    worksheet.Cells[i + 2, 3].Value = bn.CCCD;
                    worksheet.Cells[i + 2, 4].Value = bn.NgayTao.ToString("dd/MM/yyyy");
                }

                var stream = new MemoryStream();
                package.SaveAs(stream);
                stream.Position = 0;

                var fileName = "BN_Chua_Co_HSBA.xlsx";
                return File(stream,
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    fileName);
            }
        }


}
}
   
