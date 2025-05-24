using Microsoft.AspNetCore.Mvc;
using static System.Net.Mime.MediaTypeNames;
using System.Linq;

namespace HOSOBENHAN.Controllers
{
    public class NhanVienYTeController : Controller
    {

        [HttpGet]
        public IActionResult QLChung(String Tab)
        {
            var mahsba = Request.Query["mahsba"].ToString();

            if (Tab == null)
            {
                Tab = "phieu";
            }

            ViewBag.SelectedTab = Tab;
            ViewBag.mahs = mahsba;
            return View();
        }

        [HttpGet("Loaddt")]
        public IActionResult getDonThuoc()
        {
            var Tab = Request.Query["tab"].ToString();
            if (Tab == null)
            {
                Tab = "phieu";
            }
            ViewBag.SelectedTab = Tab;
            return View();
        }

        [HttpGet]
        public IActionResult PhieuChamSoc()
        {
            return View();
        }

        public IActionResult QLDonThuoc()
        {
            return View();
        }

        public IActionResult QLNguoiBenh()
        {
            return View();
        }


        public IActionResult DonThuoc()
        {

            return View();
        }

        public IActionResult HoSoBenhAn()
        {
            return View();
        }

        public IActionResult BenhNhan()
        {
            return View();
        }

        public IActionResult TaoHoSoKhamBenh()
        {
            return View();
        }

        public IActionResult HoSoBenhNhan()
        {
            return View();
        }

    }
}
