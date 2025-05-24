using API_HOSOBENHAN.ClassModels;
using HOSOBENHAN.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.Net.WebSockets;
using System.Threading.Tasks;


namespace API_HOSOBENHAN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NhanVienYTeController : ControllerBase
    {

        private readonly QUANLYBENHAN01Context _context;

        public NhanVienYTeController(QUANLYBENHAN01Context context)
        {
            _context = context;
        }

        [HttpGet("List")]
        public async Task<IActionResult> GetallList(String mahsba)
        {
            //var mahsba = Request.Query["mahsba"].ToString();
            //var data = _context.PhieuChamSocs.OrderBy(p => p.Ngay).ToList();
            var data = await _context.PhieuChamSocs
            .Where(p => p.MaHsba == mahsba) // Lọc theo mã hồ sơ bệnh án
            .OrderBy(p => p.Ngay)
            .Select(p => new
            {
                ngay = p.Ngay,
                dienBienBenh = p.DienBienBenh,
                ylenh = p.Ylenh,
                tenDieuDuong = p.TenDieuDuong
            })
            .ToListAsync();

            var data2 = await _context.Hsbas
                        .Where(h => h.MaHsba == mahsba && h.TrangThai == "Đã điều trị xong")
                        .ToListAsync();


            return Ok(new { data = data , data2 = data2});
        }


        [HttpGet("ListQLDonThuoc")]
        public IActionResult ListQLDonThuoc(String mahsba)
        {
            var data = _context.DonThuocHsbas.Where(p=>p.MaHsba == mahsba).OrderBy(d => d.TgianBdauSd).ToList();
            var data2 = (from dt in _context.DonThuocHsbas
                         join hs in _context.Hsbas on dt.MaHsba equals hs.MaHsba
                         join dk in _context.Khoas on hs.Khoa equals dk.MaKhoa
                         where dt.MaHsba == mahsba
                         select new
                         {
                             tgianBdauSd = dt.TgianBdauSd,
                             tgianKthucSd = dt.TgianKthucSd,
                             maDonThuoc = dt.MaDonThuoc,
                             maHsba = dt.MaHsba,
                             tenKhoa = dk.TenKhoa
                         }).ToList();

            return Ok(new { data = data2 });
        } 


        [HttpGet("Thuoc")]
        public IActionResult Thuoc( [FromQuery] string ma, [FromQuery] string mahsba)
        {

            var data = (from hsba in _context.Hsbas
                        join bn in _context.BenhNhans on hsba.MaBn equals bn.MaBn
                        join cd in _context.ChanDoans on hsba.MaHsba equals cd.MaHsba
                        where hsba.MaHsba == mahsba
                        select new
                        {
                            Macccd = bn.Cccd,
                            bhyt = bn.SoBhyt,
                            Gioitinh = bn.Gtinh,
                            Hoten = bn.HoTen,
                            Dantoc = bn.DanToc,
                            Tuoi = bn.NgaySinh,
                            ChuanDoan = cd.BenhChinh,
                        }).ToList();

            var data2 = (from dt in _context.DonThuocHsbas
                         join thuoc in _context.DonThuocs on dt.MaDonThuoc equals thuoc.MaDonThuoc
                         join detail in _context.DonThuocDetals on thuoc.MaDonThuoc equals detail.MaDonThuoc
                         join dthuoc in _context.Thuocs on detail.Idthuoc equals dthuoc.Idthuoc
                         where dt.MaDonThuoc == ma
                         select new
                         {
                             Tenthuoc = dthuoc.TenThuoc,
                             SoLuong = detail.SoLg,
                             Donvi = detail.DvTinh,
                             Cachdung = detail.LieuDung,
                             Ghichu = detail.GhiChu
                         }).ToList();
             Console.WriteLine(data2.Count + data.Count);
            return Ok(new { datahoso = data  , datathuoc = data2});
        }

        [HttpGet("ListHoSoBenhAn")]
        public IActionResult LiHoSoBenhAn()
        {
   
            var data = (from dt in _context.BenhNhans
                        join hs in _context.Hsbas on dt.MaBn equals hs.MaBn
                        orderby hs.MaHsba
                        select new
                        {
                            Mabn = hs.MaBn,
                            Mahsba = hs.MaHsba,
                            hoten = dt.HoTen,
                            cccd = dt.Cccd,
                            ngaysinh = dt.NgaySinh,
                        }).ToList();

            return Ok(new
            {
                success = true,
                message = "Lấy dữ liệu thành công",
                data = data
            });

        }

        [HttpGet("BenhNhan")]
        public IActionResult BenhNhan([FromQuery] string ma , [FromQuery] string mahsba)
        {
            var data = _context.BenhNhans.Where(p => p.MaBn == ma).ToList();
            return Ok(new
            {
                data = data
            });
        }


        [HttpGet("HSBenhNhan")]
        public IActionResult HSBenhNhan()
        {
            var data = (from dt in _context.BenhNhans
                        join hs in _context.Hsbas on dt.MaBn equals hs.MaBn
                        select new
                        {
                            Mabn = hs.MaBn,
                            Mahsba = hs.MaHsba,
                            hoten = dt.HoTen,
                            cccd = dt.Cccd,
                            ngaysinh = dt.NgaySinh,
                        }).ToList();
            return Ok(new
            {
                data = data
            });
        }

        // Thêm vào phiếu chăm sóc
        [HttpPost("Adddatapcs")]
        public IActionResult Adddatapcs([FromBody] PhieuChamSoc model)
        {
            try
            {
                //model.Ngay = DateTime.SpecifyKind(model.Ngay, DateTimeKind.Utc)
                //     .ToLocalTime(); 
                _context.PhieuChamSocs.Add(model);
                _context.SaveChanges();
                var data =  _context.PhieuChamSocs
           .OrderBy(p => p.Ngay)
           .Select(p => new
           {
               ngay = p.Ngay,
               dienBienBenh = p.DienBienBenh,
               ylenh = p.Ylenh,
               tenDieuDuong = p.TenDieuDuong
           })
           .ToListAsync();
                return Ok(new { success = true, message = "Đã thêm thành công" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }


        // Lây danh sách khoa và bác sĩ
        [HttpGet("ListTaoHoSo")]
        public IActionResult ListTaoHoSo()
        {
            var data = (from dt in _context.Khoas
                        select new
                        {
                            MaKhoa = dt.MaKhoa,
                            TenKhoa = dt.TenKhoa 
                        }).ToList();
            var data2 = (from dt in _context.NhanViens
                        select new
                        {
                            Mabs = dt.MaNv ,
                            TenBs = dt.HoTen 
                        }).ToList();

            return Ok(new
            {
                data = data ,
                data2 = data2
            });
        }

        // Tìm kiếm bệnh nhân theo mã hồ sơ bệnh án
        public class TimkiemcccdRequest
        {
            public required string Cccd { get; set; }
        }

        [HttpPost("Timkiemcccd")]
        public IActionResult Timkiemcccd([FromBody] TimkiemcccdRequest request)
        {
            if (string.IsNullOrEmpty(request.Cccd))
            {
                return BadRequest("CCCD không được để trống");
            }

            var benhNhan = _context.BenhNhans.FirstOrDefault(b => b.Cccd== request.Cccd);

            if (benhNhan == null)
            {
                return NotFound("Không tìm thấy bệnh nhân");
            }
            return Ok(new { data = benhNhan });
        }

        // Lọc bác sĩ theo mã khoa
        public class LocBacSyRequest
        {
            public string makhoa { get; set; }
        }

        [HttpPost("LocBacSy")]
        public IActionResult LocBacSy([FromBody] LocBacSyRequest request)
        {
            if (string.IsNullOrEmpty(request.makhoa))
            {
                return BadRequest();
            }

            var bacsy = _context.NhanViens
               .Where(p => p.Khoa == request.makhoa && p.ChucVu == "Bác sĩ")
               .ToList();


            if (bacsy == null)
            {
                return NotFound("Không tìm thấy bác sỹ.");
            }
            return Ok(new { data = bacsy });
        }

        // Cập nhật thông tin bệnh nhân
        [HttpPost("CapNhatThongTinBN")]
        public IActionResult CapNhatThongTinBN([FromBody] BenhNhan2 model)
        {
            try
            {
                var benhNhanCu = _context.BenhNhans.FirstOrDefault(p => p.MaBn == model.Mabn);
                if (benhNhanCu == null)
                {
                    return NotFound(new { success = false, message = "Không tìm thấy bệnh nhân để cập nhật" });
                }
                benhNhanCu.HoTen = model.HoTen;
                benhNhanCu.NgaySinh = model.NgaySinh;
                benhNhanCu.Gtinh = model.GTinh;
                benhNhanCu.DanToc = model.DanToc;
                benhNhanCu.NgheNghiep = model.NgheNghiep;
                benhNhanCu.NoiLamViec = model.NoiLamViec;
                benhNhanCu.DiaChi = model.DiaChi;
                benhNhanCu.DoiTuong = model.DoiTuong;
                benhNhanCu.SoBhyt = model.SoBHYT;
                benhNhanCu.GitriBhyt = model.GitriBHYT;
                benhNhanCu.HoTenNtnhan = model.HoTenNTNhan;
                benhNhanCu.DiaChiNt = model.DiaChiNT;
                benhNhanCu.Sdtntnhan = model.SDTNTNhan;

                _context.SaveChanges();
                return Ok(new { success = true, message = "Đã cập nhật thành công" });
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("QLNB")]
        public IActionResult QLNB()
        {
            var mahsba = Request.Query["mahsba"].ToString();
            var ma = Request.Query["ma"].ToString();

            var data =_context.Hsbas
                .Where(h => h.MaHsba == mahsba)
                .ToList();

            var data2 =  (from dt in _context.Hsbas
                          .Where(dt => dt.MaBn == ma)
                          .OrderBy(dt => dt.MaHsba)
                          select new
                          {
                            Mahsba = dt.MaHsba,
                          }).ToList();
            var sl = 1;
            foreach (var h in data2)
            {
                if(h.Mahsba ==  mahsba)
                {
                    break;
                }
                sl++;
            }

            return Ok(new {data = data , data2 = sl});
        }

        [HttpGet("TimKiemHoSo")]
        public IActionResult TimKiemHoSo(String tddb)
        {
            var data = (from dt in _context.BenhNhans
                        join hs in _context.Hsbas on dt.MaBn equals hs.MaBn
                        where hs.MaHsba == tddb || dt.Cccd == tddb
                        select new
                        {
                            Mabn = hs.MaBn,
                            Mahsba = hs.MaHsba,
                            hoten = dt.HoTen,
                            cccd = dt.Cccd,
                            ngaysinh = dt.NgaySinh,
                        }).ToList();
            return Ok(new
            {
                data = data
            });
        }


        [HttpPost("Addhosobenhnhan")]
        public IActionResult Addhosobenhnhan([FromBody] BenhNhan1 model)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_context.Database.GetDbConnection().ConnectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("dbo.sp_ThemBenhNhan", connection);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Truyền tất cả các tham số
                    cmd.Parameters.AddWithValue("@CCCD", model.Cccd);
                    cmd.Parameters.AddWithValue("@TrieuChung", model.TrieuChung);
                    cmd.Parameters.AddWithValue("@Khoa", model.Khoa);
                    cmd.Parameters.AddWithValue("@TinhTrang", 1);
                    cmd.ExecuteNonQuery();

                    connection.Close();
                }

                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(new { success = false, message = ex.Message });
            }
        }

        [HttpGet("ListHSBenhNhan")]
        public async Task<IActionResult> ListHSBenhNhan()
        {
            DateTime today = DateTime.Today;
            DateTime tomorrow = today.AddDays(1);

            var benhnhan = await (
                from dt in _context.BenhNhans
                join kh in _context.Khoas on dt.Khoa equals kh.MaKhoa
                where dt.NgayTao >= today && dt.NgayTao < tomorrow
                orderby dt.Stt
                select new
                {
                    STT = dt.Stt,
                    Hoten = dt.HoTen,
                    Cccd = dt.Cccd,
                    Dantoc = dt.DanToc,
                    Khoa = kh.TenKhoa,
                    NgoaiKieu = dt.NgoaiKieu,
                    GioiTinh = dt.Gtinh
                }
            ).ToListAsync();

            var r1 = await _context.BenhNhans
                .Where(b => EF.Functions.DateDiffDay(b.NgayTao, today) == 0 && b.Stt > 2000)
                .CountAsync();

            var r2 = await _context.BenhNhans
                .Where(b => EF.Functions.DateDiffDay(b.NgayTao, today) == 0 && b.Stt < 2000)
            .CountAsync();

            return Ok(new { data = benhnhan, r1 = r1, r2 = r2 });
        }


        [HttpGet("TimKiemHoSoBN")]
        public IActionResult TimKiemHoSoBN(String tddb)
        {
            DateTime today = DateTime.Today;
            DateTime tomorrow = today.AddDays(1);
            var benhnhan = (
                             from dt in _context.BenhNhans
                             join kh in _context.Khoas on dt.Khoa equals kh.MaKhoa
                             where dt.NgayTao >= today && dt.NgayTao < tomorrow
                             && (dt.Cccd == tddb || dt.MaBn == tddb)
                             select new
                             {
                                 STT = dt.Stt,
                                 Hoten = dt.HoTen,
                                 Cccd = dt.Cccd,
                                 Dantoc = dt.DanToc,
                                 Khoa = kh.TenKhoa,
                                 NgoaiKieu = dt.NgoaiKieu,
                                 GioiTinh = dt.Gtinh
                             }
                            );
            return Ok(new
            {
                data = benhnhan
            });
        }



    }
}
