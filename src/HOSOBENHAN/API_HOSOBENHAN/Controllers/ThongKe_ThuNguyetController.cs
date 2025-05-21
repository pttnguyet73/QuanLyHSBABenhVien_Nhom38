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

    }




}