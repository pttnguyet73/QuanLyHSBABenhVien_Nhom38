using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HOSOBENHAN.Data
{
    [Table("TaiKham")]
    public class TaiKham
    {
     
        // Khóa ngoại liên kết với bảng HSBA
        [Key, ForeignKey("HSBA")]
        [MaxLength(10)]
        public string MaHSBA { get; set; }

        // Mối quan hệ với đối tượng HSBA
        public HSBA HSBA { get; set; }

        // Thông tin thời gian tái khám
        public DateTime? TGTaiKham { get; set; }

        // Trạng thái tái khám
        [MaxLength(50)]
        public string TrangThai { get; set; }
    }
}
