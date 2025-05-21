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

            [HttpGet("Month")]
            public async Task<IActionResult> GetThongKe()
            {
            // Truy vấn dữ liệu từ bảng BenhNhan theo từng tháng
            var thongKe = await _context.BenhNhans
     .Where(b => b.NgayTao.Value.Year == DateTime.Now.Year)  // Lọc theo năm hiện tại
     .GroupBy(b => b.NgayTao.Value.Month)  // Nhóm theo tháng
     .Select(g => new
     {
         Thang = g.Key,  // Tháng
         Series1 = g.Count(b => b.STT / 1000 == 1),  
         Series2 = g.Count(b => b.STT / 1000 == 2)   
     })
     .ToListAsync();


            // Lấy dữ liệu cho từng series
            var series1 = thongKe.Select(t => t.Series1).ToList();
                var series2 = thongKe.Select(t => t.Series2).ToList();

                // Trả về kết quả
                var result = new
                {
                    series1 = series1,
                    series2 = series2
                };

                return Ok(result);
            }



        [HttpGet("Date")]
        public async Task<IActionResult> GetWeek()
        {
            // Truy vấn dữ liệu từ bảng BenhNhan theo từng tháng
            var thongKe = await _context.BenhNhans
    .Where(b => b.NgayTao.Value.Month == 5)  // Lọc theo năm hiện tại
    .GroupBy(b => b.NgayTao.Value.Date)  // Nhóm theo tháng
    .Select(g => new
    {
        Nam = g.Key,  // Tháng
         Series1 = g.Count(b => b.STT / 1000 == 1),
         Series2 = g.Count(b => b.STT / 1000 == 2)
     })
     .ToListAsync();


            // Lấy dữ liệu cho từng series
            var series1 = thongKe.Select(t => t.Series1).ToList();
            var series2 = thongKe.Select(t => t.Series2).ToList();

            // Trả về kết quả
            var result = new
            {
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



        [HttpGet("HSBA")]
        public async Task<IActionResult> GetHSBA()
        {

            var thangHienTai = DateTime.Now.Month;
            var namHienTai = DateTime.Now.Year;

            var data = await _context.HSBAs
                .Where(hsba => hsba.NgayTao.Value.Month == thangHienTai && hsba.NgayTao.Value.Year == namHienTai)
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


    }




}