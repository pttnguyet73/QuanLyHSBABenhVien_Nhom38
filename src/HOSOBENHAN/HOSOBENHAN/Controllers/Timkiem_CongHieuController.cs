using HOSOBENHAN.Data;
using Microsoft.AspNetCore.Mvc;
using HOSOBENHAN.Models;
namespace HOSOBENHAN.Controllers
{
    public class Timkiem_CongHieuController : Controller
    {
        private readonly ApplicationDbContext _context;

        public Timkiem_CongHieuController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            var query = from hsba in _context.HSBAs
                        join bn in _context.BenhNhans on hsba.MaBN equals bn.MaBN
                        join nv in _context.NhanViens on hsba.NguoiTao equals nv.MaNV
                        join khoa in _context.Khoas on hsba.Khoa equals khoa.MaKhoa
                        select new HSBAViewModel
                        {
                            MaHSBA = hsba.MaHSBA,
                            TrangThai = hsba.TrangThai,
                            NguoiTao = nv.HoTen,
                            Khoa = khoa.TenKhoa,
                            TenBenhNhan = bn.HoTen
                        };

            var dsHSBA = query.ToList();
            return View(dsHSBA);
        }
        public IActionResult Details()
        {
            return View();
        }

        public IActionResult ketquaxetnghiem()
        {
            return View();
        }


             public IActionResult thongtindonthuoc()
        {
            return View();
        }
    }
    
}
