using HOSOBENHAN.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Net.Http;
using System.Threading.Tasks;

namespace HOSOBENHAN.Controllers
{
    public class ThongKeUIController : Controller
    {
        private readonly HttpClient _httpClient;

        public ThongKeUIController(IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClientFactory.CreateClient();
        }

        public async Task<IActionResult> Index()
        {
            var apiUrl = "https://localhost:7015/api/ThongKe_ThuNguyet"; // Đường dẫn API thực tế

            var response = await _httpClient.GetAsync(apiUrl);

            if (response.IsSuccessStatusCode)
            {
                var jsonString = await response.Content.ReadAsStringAsync();

                // Giả sử dữ liệu trả về là:
                // { "series1": [1, 2, 3], "series2": [4, 5, 6] }

                var data = JsonConvert.DeserializeObject<ThongKeApiResponse>(jsonString);
                return View(data);
            }

            return View(new ThongKeApiResponse()); // Trả về rỗng nếu lỗi
        }
    }
}
