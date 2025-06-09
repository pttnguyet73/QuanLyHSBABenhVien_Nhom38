    $(document).ready(function () {

        $("input[name='fav_language1']").on("change", function () {
            if ($("#dtBHYT").is(":checked")) {
                $("#gitriBhyt").closest(".form-group").show();
                $("#soBhyt").closest(".form-group").show();
            } else {
                $("#gitriBhyt").closest(".form-group").hide();
                $("#soBhyt").closest(".form-group").hide();
            }
        });

    // Lấy query string từ URL
    const params = new URLSearchParams(window.location.search);
    const ma = params.get("ma");
    const mahsba = params.get("mahsba");

    // Kiểm tra có đủ dữ liệu không
    if (!ma || !mahsba) {
        alert("Thiếu mã bệnh nhân hoặc mã hồ sơ!");
        return;
    }

    // Lưu mã hồ sơ vào localStorage
    if (mahsba == "" || mahsba == null) {
        ma = localStorage.getItem("ma");
        mahsba = localStorage.getItem("mahsba");
    } else if (mahsba != localStorage.getItem("mahsba")) {
        localStorage.setItem("ma", mahsba);
    localStorage.setItem("mahsba", mahsba);
        }

    // Gắn vào link a 
    const link = document.getElementById("div_a");
    link.innerHTML = `<a href="/NhanVienYTe/QLNguoiBenh?ma=${ma}&mahsba=${mahsba}">Hồ sơ bệnh án</a>`;

    const link1 = document.getElementById("div_a1");
    link1.innerHTML = `<a href="/NhanVienYTe/BenhNhan?ma=${ma}&mahsba=${mahsba}">Thông tin bệnh nhân</a>`;


    // Lắng nghe sự kiện click vào nút "Lưu"
    $("#btn_savebn").on("click", function (event) {
    event.preventDefault(); // Ngăn chặn hành vi mặc định của form
    // Lấy dữ liệu từ các trường
    var hoTen = $("#hoTen").val();
    var ngaySinh = $("#ngaySinh").val();
    var gtinh = $("input[name='fav_language']:checked").val();
    var ngheNghiep = $("#ngheNghiep").val();
    var danToc = $("#danToc").val();
    var ngoaiKieu = $("#ngoaiKieu").val();
    var soNha = $("#soNha").val();
    var thonPho = $("#thonPho").val();
    var xaPhuong = $("#xaPhuong").val();
    var huyen = $("#huyen").val();
    var tinh = $("#tinh").val();
    var soNhant = $("#soNhaNT").val();
    var thonPhont = $("#thonPhoNT").val();
    var xaPhuongnt = $("#xaPhuongNT").val();
    var huyennt = $("#huyenNT").val();
    var tinhnt = $("#tinhNT").val();
    var noiLamViec = $("#noiLamViec").val();
    var doiTuong = $("input[name='fav_language1']:checked").val();
    if($("#dtBHYT").is(":checked"))
    {
                var gitriBhyt = $("#gitriBhyt").val();
                var soBhyt = $("#soBhyt").val();
    }
    else
    {
                var gitriBhyt = null;
                var soBhyt = null;
    }
    var hoTenNt = $("#hoTenNt").val();
    var sdtNt = $("#sdtNt").val();
    // Kiểm tra dữ liệu hợp lệ
    if (!hoTen || !ngaySinh || !tuoi || !gtinh || !ngheNghiep || !danToc || !soNha || !thonPho || !xaPhuong || !huyen || !tinh || !noiLamViec || !doiTuong) {
        alert("Vui lòng điền đầy đủ thông tin!");
        return;
        }
        const data = {
            Mabn: ma,
            HoTen: hoTen,
            NgaySinh: new Date(ngaySinh).toISOString(),
            GTinh: gtinh,
            NgheNghiep: ngheNghiep,
            DanToc: danToc,
            NgoaiKieu: ngoaiKieu,
            DiaChi: `${soNha},${thonPho},${xaPhuong},${huyen},${tinh}`,
            NoiLamViec: noiLamViec,
            DoiTuong: doiTuong,
            GitriBHYT: new Date(gitriBhyt).toISOString(),
            SoBHYT: soBhyt,
            HoTenNTNhan: hoTenNt,
            DiaChiNT: `${soNhant},${thonPhont},${xaPhuongnt},${huyennt},${tinhnt}`,
            SDTNTNhan: sdtNt
        };

    // Gọi API để lưu thông tin bệnh nhân
    $.ajax({
        url: "https://localhost:7015/api/NhanVienYTe/CapNhatThongTinBN",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(data),
    success: function (response) {
            if (response.success) {
                 alert("Lưu thông tin bệnh nhân thành công!");
                 window.location.href = `/NhanVienYTe/BenhNhan?ma=${ma}&mahsba=${mahsba}`;
            } else {
              alert("Lưu thông tin bệnh nhân thất bại!");
            }
        },
    error: function (xhr, status, error) {
        console.error("Lỗi gọi API:", error);
    alert("Có lỗi xảy ra khi lưu thông tin bệnh nhân");
        }
         });
         });

    // Gọi API với 2 tham số truyền vào
    $.get("https://localhost:7015/api/NhanVienYTe/BenhNhan", {ma: ma, mahsba: mahsba }, function (kq) {
            var dulieu = kq.data;

            if (dulieu && dulieu.length > 0) {
                var benhNhan = dulieu[0];

    $("#hoTen").val(benhNhan.hoTen);
    $("#ngaySinh").val(benhNhan.ngaySinh?.split('T')[0]);
    $("#tuoi").val(new Date().getFullYear() - new Date(benhNhan.ngaySinh).getFullYear());

    if (benhNhan.gTinh === "Nam") {
        $("#gtNam").prop("checked", true);
                } else {
        $("#gtNu").prop("checked", true);
                }

    $("#ngheNghiep").val(benhNhan.ngheNghiep);
    $("#danToc").val(benhNhan.danToc);
    if(benhNhan.ngoaiKieu == null )
    {
        $("#ngoaiKieu").val("Không");
                }
    else
    {
        $("#ngoaiKieu").val(benhNhan.ngoaiKieu);
                }

    if (benhNhan.diaChi) {
    var diachiParts = benhNhan.diaChi.split(",");
    $("#soNha").val(diachiParts[0] || "");
    $("#thonPho").val(diachiParts[1] || "");
    $("#xaPhuong").val(diachiParts[2] || "");
    $("#huyen").val(diachiParts[3] || "");
    $("#tinh").val(diachiParts[4] || "");
     }

     if (benhNhan.diaChiNT) {
           var diachiParts = benhNhan.DiaChiNT.split(",");
           $("#soNhaNT").val(diachiParts[0] || "");
           $("#thonPhoNT").val(diachiParts[1] || "");
           $("#xaPhuongNT").val(diachiParts[2] || "");
           $("#huyenNT").val(diachiParts[3] || "");
           $("#tinhNT").val(diachiParts[4] || "");
     }

    $("#noiLamViec").val(benhNhan.noiLamViec);

    // Đối tượng
    switch (benhNhan.doiTuong) {
                    case "BHYT": {
        $("#dtBHYT").prop("checked", true);
    $("#soBhyt").val(benhNhan.SoBHYT);
    $("#gitriBhyt").val(benhNhan.GitriBHYT?.split('T')[0]);
                        break; }
    case "Thu phí":
    $("#dtThuPhi").prop("checked", true);
    $("#gitriBhyt").closest(".form-group").hide();
    $("#soBhyt").closest(".form-group").hide();
    break;
    case "Miễn":
    $("#dtMien").prop("checked", true);
    $("#gitriBhyt").closest(".form-group").hide();
    $("#soBhyt").closest(".form-group").hide();
    break;
    default:
    $("#dtKhac").prop("checked", true);
    $("#gitriBhyt").closest(".form-group").hide();
    $("#soBhyt").closest(".form-group").hide();
                }

    $("#hoTenNt").val(benhNhan.hoTenNTNhan);
    $("#sdtNt").val(benhNhan.sdtntNhan);
            }
        }).fail(function (xhr, status, error) {
        console.error("Lỗi gọi API:", error);
    alert("Không thể lấy dữ liệu bệnh nhân");
        });
    });

document.getElementById("ngaySinh").addEventListener("change", function () {
    const ngaySinh = new Date(this.value);
    const ngayHienTai = new Date();

    if (!isNaN(ngaySinh)) {
        let tuoi = ngayHienTai.getFullYear() - ngaySinh.getFullYear();

        // Nếu chưa đến sinh nhật trong năm nay thì trừ đi 1
        const chuaSinhNhat =
            ngayHienTai.getMonth() < ngaySinh.getMonth() ||
            (ngayHienTai.getMonth() === ngaySinh.getMonth() && ngayHienTai.getDate() < ngaySinh.getDate());

        if (chuaSinhNhat) {
            tuoi--;
        }

        document.getElementById("tuoi").value = tuoi;
    } else {
        document.getElementById("tuoi").value = "";
    }
});
