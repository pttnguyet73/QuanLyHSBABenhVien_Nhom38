using HOSOBENHAN.Data;
using HOSOBENHAN.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using System.Linq;
using System.Text;

namespace HOSOBENHAN.Controllers
{
    public class Timkiem_CongHieuController : Controller
    {
        private readonly ApplicationDbContext _context;

        public Timkiem_CongHieuController(ApplicationDbContext context)
        {
            _context = context;
        }


        public static string RemoveDiacritics(string input)
        {
            if (string.IsNullOrWhiteSpace(input)) return input;
            string normalized = input.Normalize(NormalizationForm.FormD);
            var chars = normalized
                .Where(c => CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                .ToArray();
            return new string(chars).Normalize(NormalizationForm.FormC).ToLower();
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

            var danhSachHSBA = query.ToList(); // Chuyển sang bộ nhớ để xử lý không dấu bằng C#

            // Áp dụng tìm kiếm không dấu
            if (!string.IsNullOrWhiteSpace(search))
            {
                string keyword = RemoveDiacritics(search);
                danhSachHSBA = danhSachHSBA.Where(x =>
                    RemoveDiacritics(x.MaHSBA).Contains(keyword) ||
                    RemoveDiacritics(x.TenBenhNhan).Contains(keyword) ||
                    RemoveDiacritics(x.NguoiTao).Contains(keyword)
                ).ToList();
            }

            // Áp dụng lọc theo khoa
            if (!string.IsNullOrWhiteSpace(selectedKhoa))
            {
                danhSachHSBA = danhSachHSBA.Where(x => x.Khoa == selectedKhoa).ToList();
            }

            // Áp dụng lọc theo trạng thái
            if (!string.IsNullOrWhiteSpace(selectedTrangThai))
            {
                danhSachHSBA = danhSachHSBA.Where(x => x.TrangThai == selectedTrangThai).ToList();
            }

            // Trả về ViewModel
            var viewModel = new HSBAFilterViewModel
            {
                Search = search,
                SelectedKhoa = selectedKhoa,
                SelectedTrangThai = selectedTrangThai,
                DanhSachKhoa = danhSachKhoa,
                DanhSachHSBA = danhSachHSBA
            };

            return View(viewModel);
        }



        // Các action còn lại nếu chưa dùng thì giữ nguyên để phát triển sau
        public IActionResult Details(string id)
        {
            var hsba = (from h in _context.HSBAs
                        join bn in _context.BenhNhans on h.MaBN equals bn.MaBN
                        join tt in _context.TTNhapViens on h.MaHSBA equals tt.MaHSBA
                        join cd in _context.ChanDoans on h.MaHSBA equals cd.MaHSBA
                        join nv in _context.NhanViens on h.NguoiTao equals nv.MaNV
                        where h.MaHSBA == id
                        select new HSBA_DetailViewModel
                        {
                            MaHSBA = h.MaHSBA,
                            MaNhapVien = tt.MaNhapVien,

                            HoTenBenhNhan = bn.HoTen,
                            GioiTinh = bn.GTinh,
                            CCCD = bn.CCCD,
                            SDT = bn.SDTNTNhan,

                            ChanDoan = cd.BenhChinh,

                            TgianVaoVien = (DateTime)tt.TgianVnVien,
                            LyDoVaoVien = tt.LyDoVao,
                            TgianRaVien = tt.TGRaVien,
                            LyDoRaVien = tt.LyDoRaVien,

                            NoiGT = tt.NoiGTieu,
                            Buong = tt.Buong,
                            Giuong = tt.Giuong,

                            BacSiPhuTrach = nv.HoTen,

                            TrangThai = h.TrangThai
                        }).FirstOrDefault();

            if (hsba == null)
            {
                return NotFound();
            }

            return View(hsba);
        }

        public IActionResult ketquaxetnghiem()
        {
            return View();
        }

        public IActionResult thongtindonthuoc(string maDonThuoc)
        {
            if (string.IsNullOrEmpty(maDonThuoc)) return NotFound();

            var donThuoc = _context.DonThuocs.FirstOrDefault(dt => dt.MaDonThuoc == maDonThuoc);
            if (donThuoc == null) return NotFound();

            var nguoiTao = _context.NhanViens.FirstOrDefault(nv => nv.MaNV == donThuoc.NguoiTao);

            var chiTiet = _context.DonThuocDetals
                .Where(ct => ct.MaDonThuoc == maDonThuoc)
                .Join(_context.Thuocs,
                      ct => ct.IDThuoc,
                      t => t.IDThuoc,
                      (ct, t) => new ChiTietThuocViewModel
                      {
                          TenThuoc = t.TenThuoc,
                          SoLuong = ct.SoLg,
                          DonViTinh = ct.DvTinh,
                          LieuDung = ct.LieuDung,
                          GhiChu = ct.GhiChu
                      })
                .ToList();

            var viewModel = new DonThuocViewModel2
            {
                NgayTao = donThuoc.NgayTao,
                NguoiTaoHoTen = nguoiTao?.HoTen ?? donThuoc.NguoiTao,
                ChiTietThuocs = chiTiet
            };

            return View(viewModel);
        }


        public IActionResult danhsachdonthuoc(string maHSBA)
        {
            var danhSach = (from dt_hsba in _context.DonThuoc_HSBAs
                            join dt in _context.DonThuocs on dt_hsba.MaDonThuoc equals dt.MaDonThuoc
                            join nv in _context.NhanViens on dt.NguoiTao equals nv.MaNV
                            join hsba in _context.HSBAs on dt_hsba.MaHSBA equals hsba.MaHSBA
                            join bs in _context.NhanViens on hsba.NguoiTao equals bs.MaNV
                            where dt_hsba.MaHSBA == maHSBA
                            select new DonThuocViewModel
                            {
                                MaDonThuoc = dt.MaDonThuoc,
                                NguoiTao = nv.MaNV,
                                TenNguoiTao = nv.HoTen,
                                BacSiChinh = bs.HoTen,
                                TGianBatDauSD = dt_hsba.TGianBDauSD,
                                TGianKetThucSD = dt_hsba.TGianKThucSD
                            }).ToList();

            return View(danhSach);
        }


        public IActionResult DanhSachXetNghiem(string maHSBA)
        {
            var dsXetNghiem = _context.HSBA_XetNghiems
                .Where(x => x.MaHSBA == maHSBA)
                .Join(_context.XetNghiems,
                      hsba => hsba.MaXN,
                      xn => xn.MaXN,
                      (hsba, xn) => new XetNghiemViewModel
                      {
                          MaXN = hsba.MaXN,
                          TenXetNghiem = xn.LoaiXN,
                          KetquaXetNghiem = hsba.KQXetNghiem,
                          TgianTao = (DateTime)hsba.TgianTao,
                          BacSyXN = hsba.BacSyXN,
                          AnhXetNghiem = hsba.AnhXetNghiem
                      })
                .ToList();

            return View(dsXetNghiem);
        }

    }
}
