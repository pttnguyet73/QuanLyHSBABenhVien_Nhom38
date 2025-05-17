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
        [HttpGet("Year")]
        public async Task<IActionResult> GetYear()
        {
            // Truy vấn dữ liệu từ bảng BenhNhan theo từng tháng
            var thongKe = await _context.BenhNhans
     .GroupBy(b => b.NgayTao.Value.Year)  // Nhóm theo tháng
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
                Yearseries1 = series1,
                Yearseries2 = series2
            };

            return Ok(result);
        }
    }


    }