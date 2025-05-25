using HOSOBENHAN.Data;
using Microsoft.AspNetCore.Mvc;
using HOSOBENHAN.Models;
using System.Linq;

namespace HOSOBENHAN.Controllers
{
    public class Timkiem_CongHieuController : Controller
    {
        private readonly ApplicationDbContext _context;

        public Timkiem_CongHieuController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Index(string search, string selectedKhoa, string selectedTrangThai)
        {
            // Lấy danh sách tất cả các khoa để hiển thị trong dropdown
            var danhSachKhoa = _context.Khoas
                                       .Select(k => k.TenKhoa)
                                       .Distinct()
                                       .ToList();

            // Truy vấn dữ liệu HSBA kết hợp các bảng liên quan
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

            // Áp dụng tìm kiếm
            if (!string.IsNullOrWhiteSpace(search))
            {
                query = query.Where(x =>
                    x.MaHSBA.Contains(search) ||
                    x.TenBenhNhan.Contains(search));
            }

            // Áp dụng lọc theo khoa
            if (!string.IsNullOrWhiteSpace(selectedKhoa))
            {
                query = query.Where(x => x.Khoa == selectedKhoa);
            }

            // Áp dụng lọc theo trạng thái
            if (!string.IsNullOrWhiteSpace(selectedTrangThai))
            {
                query = query.Where(x => x.TrangThai == selectedTrangThai);
            }

            // Đổ kết quả ra view model
            var viewModel = new HSBAFilterViewModel
            {
                Search = search,
                SelectedKhoa = selectedKhoa,
                SelectedTrangThai = selectedTrangThai,
                DanhSachKhoa = danhSachKhoa,
                DanhSachHSBA = query.ToList()
            };

            return View(viewModel);
        }

        // Các action còn lại nếu chưa dùng thì giữ nguyên để phát triển sau
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
