using HOSOBENHAN.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HOSOBENHAN.Controllers
{
        [Route("api/[controller]")]
        [ApiController]
        public class ThongKe_ThuNguyetController : ControllerBase
        {
            private readonly HSBADBContext _context;

            public ThongKe_ThuNguyetController(HSBADBContext context)
            {
                _context = context;
            }

        [HttpGet("Year")]
        public async Task<IActionResult> GetThongKe()
        {
            var years = Enumerable.Range(2022, 2025 - 2022 + 1).ToList(); // [2022, 2023, 2024, 2025]

            var thongKe = await _context.BenhNhans
                .GroupBy(b => b.NgayTao.Value.Year)
                .Select(g => new
                {
                    Nam = g.Key,
                    Series1 = g.Count(b => b.STT / 1000 == 1),
                    Series2 = g.Count(b => b.STT / 1000 == 2)
                })
                .ToListAsync();

            var resultList = years.GroupJoin(
                thongKe,
                month => month,
                data => data.Nam,
                (month, dataGroup) => new
                {
                    Nam = "Năm " + month,  // chuyển sang dạng string "Tháng 1"
                    Series1 = dataGroup.Select(d => d.Series1).FirstOrDefault(),
                    Series2 = dataGroup.Select(d => d.Series2).FirstOrDefault()
                })
                .ToList();

            var series1 = resultList.Select(r => r.Series1).ToList();
            var series2 = resultList.Select(r => r.Series2).ToList();

            var result = new
            {
                labels = resultList.Select(r => r.Nam).ToList(),
                series1 = series1,
                series2 = series2
            };

            return Ok(result);
        }


        [HttpGet("Month")]
        public async Task<IActionResult> GetThongKe(int year)
        {
            var allMonths = Enumerable.Range(1, 12).ToList();

            var thongKe = await _context.BenhNhans
                .Where(b => b.NgayTao.HasValue && b.NgayTao.Value.Year == year)
                .GroupBy(b => b.NgayTao.Value.Month)
                .Select(g => new
                {
                    Thang = g.Key,
                    Series1 = g.Count(b => b.STT / 1000 == 1),
                    Series2 = g.Count(b => b.STT / 1000 == 2)
                })
                .ToListAsync();

            var resultList = allMonths.GroupJoin(
                thongKe,
                month => month,
                data => data.Thang,
                (month, dataGroup) => new
                {
                    Thang = "Tháng " + month,  // chuyển sang dạng string "Tháng 1"
                    Series1 = dataGroup.Select(d => d.Series1).FirstOrDefault(),
                    Series2 = dataGroup.Select(d => d.Series2).FirstOrDefault()
                })
                .ToList();

            var series1 = resultList.Select(r => r.Series1).ToList();
            var series2 = resultList.Select(r => r.Series2).ToList();

            var result = new
            {
                labels = resultList.Select(r => r.Thang).ToList(),
                series1 = series1,
                series2 = series2
            };

            return Ok(result);
        }



        [HttpGet("Date")]
        public async Task<IActionResult> GetWeek(int month, int year)
        {
            // Số ngày trong tháng

            int daysInMonth = DateTime.DaysInMonth(year, month);
            List<int> days = Enumerable.Range(1, daysInMonth).ToList();

            // Tạo danh sách tất cả các ngày trong tháng
            var allDates = Enumerable.Range(1, daysInMonth)
                                     .Select(day => new DateTime(year, month, day))
                                     .ToList();

            // Truy vấn dữ liệu từ bảng BenhNhan theo tháng và năm
            var thongKe = await _context.BenhNhans
                .Where(b => b.NgayTao.HasValue && b.NgayTao.Value.Month == month && b.NgayTao.Value.Year == year)
                .GroupBy(b => b.NgayTao.Value.Date)
                .Select(g => new
                {
                    Ngay = g.Key,
                    Series1 = g.Count(b => b.STT / 1000 == 1),
                    Series2 = g.Count(b => b.STT / 1000 == 2)
                })
                .ToListAsync();

            // Join danh sách tất cả các ngày với dữ liệu thực tế
            var resultList = allDates.GroupJoin(
                thongKe,
                date => date,
                data => data.Ngay,
                (date, dataGroup) => new
                {
                    Ngay = date,
                    Series1 = dataGroup.Select(d => d.Series1).FirstOrDefault(), // Nếu không có thì mặc định 0
                    Series2 = dataGroup.Select(d => d.Series2).FirstOrDefault()
                })
                .ToList();

            // Lấy dữ liệu cho từng series theo ngày đầy đủ
            var series1 = resultList.Select(r => r.Series1).ToList();
            var series2 = resultList.Select(r => r.Series2).ToList();

            var result = new
            {
                labels = resultList.Select(r => r.Ngay.Day.ToString()).ToList(),
                series1 = series1,
                series2 = series2
            };

            return Ok(result);
        }



        [HttpGet("Top3Khoa")]
        public async Task<IActionResult> GetTop3Khoa()
        {
            // Lấy thống kê số bệnh nhân theo khoa trong tháng 5
            var thongKe = await (from hsba in _context.HSBAs
                                 join khoa in _context.Khoas on hsba.Khoa equals khoa.MaKhoa  // hoặc hsba.MaKhoa equals khoa.MaKhoa
                                 group hsba by new { khoa.MaKhoa, khoa.TenKhoa } into g
                                 select new
                                 {
                                     TenKhoa = g.Key.TenKhoa,
                                     SoBenhNhan = g.Count()
                                 })
                    .OrderByDescending(x => x.SoBenhNhan)
                    .Take(3)
                    .ToListAsync();

            return Ok(thongKe);

        }

        [HttpGet("ColumnMonth")]
        public async Task<IActionResult> GetColumnChart()
        {
            var currentYear = DateTime.Now.Year;

            var data = await (from hsba in _context.HSBAs
                              where hsba.NgayTao.HasValue && hsba.NgayTao.Value.Year == 2025
                              join ttnv in _context.TTNhapViens
                              on hsba.MaHSBA equals ttnv.MaHSBA into gj
                              from subttnv in gj.DefaultIfEmpty() // left join
                              select new
                              {
                                  Thang = hsba.NgayTao.Value.Month,
                                  CoNhapVien = subttnv != null
                              })
                              .ToListAsync();

            var thongKe = data
                .GroupBy(x => x.Thang)
                .Select(g => new
                {
                    Thang = g.Key,
                    Series1 = g.Count(x => x.CoNhapVien),       // Có nhập viện
                    Series2 = g.Count(x => !x.CoNhapVien)       // Không nhập viện
                })
                .OrderBy(t => t.Thang)
                .ToList();

            var result = new
            {
                labels = thongKe.Select(t => $"Tháng {t.Thang}").ToList(),
                series1 = thongKe.Select(t => t.Series1).ToList(),
                series2 = thongKe.Select(t => t.Series2).ToList()
            };

            return Ok(result);
        }

        [HttpGet("ColumnMonth_List")]
        public async Task<IActionResult> GetColumnChartList()
        {
            var currentYear = DateTime.Now.Year;

            var data = await (from hsba in _context.HSBAs
                              where hsba.NgayTao.HasValue && hsba.NgayTao.Value.Year == currentYear
                              join ttnv in _context.TTNhapViens
                                  on hsba.MaHSBA equals ttnv.MaHSBA into gj
                              from subttnv in gj.DefaultIfEmpty() // left join với TTNhapViens
                              join bn in _context.BenhNhans
                                  on hsba.MaBN equals bn.MaBN // join với bảng bệnh nhân
                              select new
                              {
                                  Thang = hsba.NgayTao.Value.Month,
                                  CoNhapVien = subttnv != null,
                                  MaHSBA = hsba.MaHSBA,
                                  MaBN = bn.MaBN,
                                  HoTen = bn.HoTen,
                                  NgaySinh = bn.NgaySinh
                              })
                              .ToListAsync();

            var thongKe = data
                .GroupBy(x => x.Thang)
                .Select(g => new
                {
                    Thang = g.Key,
                    NoiTru = g.Where(x => x.CoNhapVien)
                              .Select(x => new {
                                  x.MaHSBA,
                                  x.MaBN,
                                  x.HoTen,
                                  NgaySinh = x.NgaySinh?.ToString("dd/MM/yyyy")
                              }).ToList(),
                    NgoaiTru = g.Where(x => !x.CoNhapVien)
                               .Select(x => new {
                                   x.MaHSBA,
                                   x.MaBN,
                                   x.HoTen,
                                   NgaySinh = x.NgaySinh?.ToString("dd/MM/yyyy")
                               }).ToList()
                })
                .OrderBy(t => t.Thang)
                .ToList();

            return Ok(thongKe);
        }






        [HttpGet("HSBA_Month")]
        public async Task<IActionResult> GetHSBA()
        {

            var thangHienTai = DateTime.Now.Month;
            var namHienTai = DateTime.Now.Year;

            var data = await _context.HSBAs
                .Where(hsba => hsba.NgayTao.Value.Month == 5 && hsba.NgayTao.Value.Year == namHienTai)
                .GroupBy(hsba => new { hsba.NgayTao.Value.Year, hsba.NgayTao.Value.Month })
                .Select(g => new
                {
                    Nam = g.Key.Year,
                    Thang = g.Key.Month,
                    DaDieuTriXong = g.Count(x => x.TrangThai == "Đã điều trị xong"),
                    ChuaDieuTriXong = g.Count(x => x.TrangThai != "Đã điều trị xong")
                })
                .ToListAsync();

            return Ok(data);
        }

        [HttpGet("HSBA_Day")]

        public async Task<IActionResult> GetHSBA_Date()
        {

           

            var data = await _context.HSBAs
                .Where(hsba => hsba.NgayTao.Value.Day == DateTime.Now.Day)
                .GroupBy(hsba => new { hsba.NgayTao.Value.Day })
                .Select(g => new
                {
                    Ngay = g.Key.Day,
                    DaDieuTriXong = g.Count(x => x.TrangThai == "Đã điều trị xong"),
                    ChuaDieuTriXong = g.Count(x => x.TrangThai != "Đã điều trị xong"),

                })
                .ToListAsync();

            return Ok(data);
        }
      


        [HttpGet("HSBA_Year")]
        public async Task<IActionResult> GetHSBA_Year()
        {

            var namHienTai = DateTime.Now.Year;

            var data = await _context.HSBAs
                .Where(hsba => hsba.NgayTao.Value.Year == namHienTai)
                .GroupBy(hsba => new { hsba.NgayTao.Value.Year })
                .Select(g => new
                {
                    Nam = g.Key.Year,
                    DaDieuTriXong = g.Count(x => x.TrangThai == "Đã điều trị xong"),
                    ChuaDieuTriXong = g.Count(x => x.TrangThai != "Đã điều trị xong")
                })
                .ToListAsync();

            return Ok(data);
        }

        [HttpGet("XetNghiem")]
        public async Task<IActionResult> GetXetNghiem()
        {

            var thangHienTai = DateTime.Now.Month;
            var namHienTai = DateTime.Now.Year;

            var data = await (from xn in _context.XetNghiems
                              join HSBA_XetNghiem in _context.HSBA_XetNghiems on xn.MaXN equals HSBA_XetNghiem.MaXN  
                              group HSBA_XetNghiem by new { xn.MaXN, xn.LoaiXN } into g
                              select new
                              {
                                  LoaiXN = g.Key.LoaiXN,
                                  SoBN = g.Count()
                              })
                    .OrderByDescending(x => x.SoBN)
                    .Take(4)
                    .ToListAsync();

            return Ok(data);
        }

        [HttpGet("TaiKham")]
        public async Task<IActionResult> GetTaiKham()
        {
            var data = await (from t in _context.TaiKhams
                              join hsba in _context.HSBAs on t.MaHSBA equals hsba.MaHSBA
                              join b in _context.BenhNhans on hsba.MaBN equals b.MaBN
                              select new
                              {
                                  MaHSBA = hsba.MaHSBA,
                                  TenBenhNhan = b.HoTen,
                                  tgTaiKham = t.TGTaiKham,
                                  TrangThai = t.TrangThai
                              })
                      .OrderByDescending(x => x.tgTaiKham)
                    .ToListAsync();

            return Ok(data);
        }

        [HttpGet("ThongKeNhanSu")]
        public async Task<IActionResult> GetThongKeNhanSu()
        {
            var data = await (from nv in _context.NhanViens
                              join k in _context.Khoas on nv.Khoa equals k.MaKhoa
                              group nv by new { nv.Khoa, k.TenKhoa } into g
                              select new
                              {
                                  TenKhoa = g.Key.TenKhoa,
                                  SoLuongNhanVien = g.Count(nv => nv.MaNV.StartsWith("NV")),
                                  SoLuongBacSi = g.Count(nv => nv.MaNV.StartsWith("BS"))
                              })
                      .ToListAsync();

            return Ok(data);
        }
        [HttpGet("ThongKeChanDoan")]
        public async Task<IActionResult> GetThongKeChanDoan()
        {
            var chanDoans = await _context.ChanDoans.ToListAsync();

            var result = new
            {
                SoLuongChuyenVien = chanDoans.Count(cd => !string.IsNullOrEmpty(cd.NoiChuyenDen)),
                SoLuongCapCuu = chanDoans.Count(cd => cd.KKB_CapCuu != null && cd.KKB_CapCuu.Trim() == "Có"),
                SoLuongPhauThuat = chanDoans.Count(cd => cd.PhauThuat != null && cd.PhauThuat.Trim() == "Có"),
                SoLuongTaiKham = chanDoans.Count(cd => cd.TaiKham != null && cd.TaiKham.Trim() == "Đã kết quả")
            };

            return Ok(result);
        }
        [HttpGet("SoLuong")]
        public async Task<IActionResult> GetChiTietBacSiVaNhanVien()
        {
            var now = DateTime.Now;
            var totalBS = await _context.NhanViens
                .CountAsync(nv => nv.MaNV.StartsWith("BS"));

            var bacSiChinhThuc = await _context.NhanViens
                .CountAsync(nv => nv.MaNV.StartsWith("BS") && nv.ChucVu == "Bác sĩ");

            var totalNV = await _context.NhanViens
                .CountAsync(nv => nv.MaNV.StartsWith("NV"));

            var yTa = await _context.NhanViens
                .CountAsync(nv => nv.MaNV.StartsWith("NV") && nv.ChucVu == "Y tá");

            var totalBN = await _context.BenhNhans
               .CountAsync(bn =>
            bn.STT >= 1000 && bn.STT < 2000);

            var BNweek = await _context.BenhNhans
                .CountAsync(bn =>
            bn.STT >= 1000 && bn.STT < 2000 &&
            bn.NgayTao.HasValue &&
            bn.NgayTao.Value.Month == now.Month &&
            bn.NgayTao.Value.Year == now.Year
        );


            var totalBN2 = await _context.BenhNhans
                  .CountAsync(bn =>
             bn.STT > 2000);

            var BN2week = await _context.BenhNhans
               .CountAsync(bn =>
            bn.STT > 2000 &&
            bn.NgayTao.HasValue &&
            bn.NgayTao.Value.Month == now.Month &&
            bn.NgayTao.Value.Year == now.Year
        );


            var result = new
            {
                BacSiTheoMa = totalBS,
                BacSiChinhThuc = bacSiChinhThuc,
                NhanVienTheoMa = totalNV,
                YTaChinhThuc = yTa,
                benhnhan = totalBN,
                benhnhanmonth = BNweek,
                benhnhan2 = totalBN2,
                benhnhan2month = BN2week,
            };

            return Ok(result);
        }
        [HttpGet("ThongKeBenhNhanTheoKhoa")]
        public async Task<IActionResult> GetThongKeBenhNhan()
        {
            var data = await (from bn in _context.HSBAs
                              join k in _context.Khoas on bn.Khoa equals k.MaKhoa
                              group bn by new { bn.Khoa, k.TenKhoa } into g
                              select new
                              {
                                  TenKhoa = g.Key.TenKhoa,
                                  SoLuongBenhNhan = g.Count()
                              })
                              .Take(4)
                        .ToListAsync();

            return Ok(data);
        }


        [HttpGet("BenhNhanChuaCoHSBA")]
        public async Task<IActionResult> GetBenhNhanChuaCoHSBA()
        {
            var data = await (from bn in _context.BenhNhans
                              join hsba in _context.HSBAs on bn.MaBN equals hsba.MaBN into gj
                              from hsba in gj.DefaultIfEmpty()
                              where hsba == null
                              select new
                              {
                                  bn.MaBN,
                                  bn.HoTen,
                                  bn.CCCD,
                                  bn.NgayTao,
                              }).ToListAsync();

            return Ok(data);
        }
    }

}



