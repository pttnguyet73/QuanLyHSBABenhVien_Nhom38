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

        public IActionResult thongtindonthuoc(string maHSBA)
        {
            //// Lấy thông tin đơn thuốc và bác sĩ
            //var thongTinDonThuoc = _context.DonThuoc_HSBAs
            //    .Where(d => d.MaHSBA == maHSBA)
            //    .Join(_context.DonThuocs,
            //          hs => hs.MaDonThuoc,
            //          dt => dt.MaDonThuoc,
            //          (hs, dt) => new { hs, dt })
            //    .Join(_context.NhanViens,
            //          x => x.dt.NguoiTao,
            //          nv => nv.MaNV,
            //          (x, nv) => new
            //          {
            //              x.hs.MaHSBA,
            //              x.dt.NgayTao,
            //              x.hs.TGianBDauSD,
            //              x.hs.TGianKThucSD,
            //              BacSiPhuTrach = nv.HoTen,
            //              x.hs.MaDonThuoc
            //          })
            //    .ToList();

            //var danhSachThuoc = new List<ThuocChiTietViewModel>();
            //int stt = 1;

            //foreach (var item in thongTinDonThuoc)
            //{
            //    var thuocChiTiet = _context.DonThuocDetals
            //        .Where(dtct => dtct.MaDonThuoc == item.MaDonThuoc)
            //        .Join(_context.Thuocs,
            //              ct => ct.IDThuoc,
            //              t => t.IDThuoc,
            //              (ct, t) => new
            //              {
            //                  t.TenThuoc,
            //                  ct.SoLg,
            //                  ct.DvTinh,
            //                  ct.LieuDung,
            //                  ct.GhiChu
            //              })
            //        .ToList()
            //        .Select(x => new ThuocChiTietViewModel
            //        {
            //            STT = stt++,
            //            TenThuoc = x.TenThuoc,
            //            SoLuong = x.SoLg,
            //            DonViTinh = x.DvTinh,
            //            LieuDung = x.LieuDung,
            //            GhiChu = x.GhiChu
            //        }).ToList();

            //    danhSachThuoc.AddRange(thuocChiTiet);
            //}

            //var first = thongTinDonThuoc.FirstOrDefault();

            //var donThuocVM = new DonThuocViewModel
            //{
            //    MaHSBA = maHSBA,
            //    NgayTao = first?.NgayTao ?? DateTime.MinValue,
            //    ThoiGianBatDau = first?.TGianBDauSD ?? DateTime.MinValue,
            //    ThoiGianKetThuc = first?.TGianKThucSD ?? DateTime.MinValue,
            //    BacSiPhuTrach = first?.BacSiPhuTrach,
            //    ThuocChiTiets = danhSachThuoc
            //};

            return View();
        }


    }
}
