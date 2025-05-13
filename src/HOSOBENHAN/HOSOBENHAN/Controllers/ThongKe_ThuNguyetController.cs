using Microsoft.AspNetCore.Mvc;

namespace HOSOBENHAN.Controllers
{
    public class ThongKe_ThuNguyetController : Controller
    {
        public IActionResult Dashboard()
        {
            // Chỉ gọi view Dashboard mà không cần tương tác với API
            return View("Dashboard"); // Đảm bảo rằng view "Dashboard" tồn tại trong thư mục Views
        }
    }
}
