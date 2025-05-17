using HOSOBENHAN.Models;
using Microsoft.AspNetCore.Mvc;

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

            LineChart chartData = null;

            try
            {
                chartData = await _httpClient.GetFromJsonAsync<LineChart>(apiUrl);
            }
            catch (Exception ex)
            {
                // Log lỗi nếu cần
                Console.WriteLine("Lỗi gọi API: " + ex.Message);
            }

            return View(chartData);
        }
    }
}
   
