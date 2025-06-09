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
        var soNhant = $("#soNhaNT").val();
        var thonPhont = $("#thonPhoNT").val();
        var xaPhuongnt = $("#xaPhuongNT").val();
        var huyennt = $("#huyenNT").val();
        var tinhnt = $("#tinhNT").val();
        var doiTuong = $("input[name='fav_language1']:checked").val();
        if ($("#dtBHYT").is(":checked")) {
            var gitriBhyt = $("#gitriBhyt").val();
            var soBhyt = $("#soBhyt").val();
        }
        else {
            var gitriBhyt = null;
            var soBhyt = null;
        }
        var hoTenNt = $("#hoTenNt").val();
        var sdtNt = $("#sdtNt").val();
        // Kiểm tra dữ liệu hợp lệ

        const data = {
            Mabn: ma,
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
    $.get("https://localhost:7015/api/NhanVienYTe/BenhNhan", { ma: ma, mahsba: mahsba }, function (kq) {
        var dulieu = kq.data;

        if (dulieu && dulieu.length > 0) {
            var benhNhan = dulieu[0];

            $("#hoTen").text(benhNhan.hoTen);
            $("#ngaySinh").text(benhNhan.ngaySinh?.split('T')[0]);
            $("#tuoi").text(new Date().getFullYear() - new Date(benhNhan.ngaySinh).getFullYear());
            $("#gioiTinh").text(benhNhan.gtinh);


            $("#ngheNghiep").text(benhNhan.ngheNghiep);
            $("#danToc").text(benhNhan.danToc);
            $("#ngoaiKieu").text(benhNhan.ngoaiKieu || "Không");

            if (benhNhan.diaChi) {
                var diachiParts = benhNhan.diaChi.split(",");
                $("#soNha").text(diachiParts[0] || "");
                $("#thonPho").text(diachiParts[1] || "");
                $("#xaPhuong").text(diachiParts[2] || "");
                $("#huyen").text(diachiParts[3] || "");
                $("#tinh").text(diachiParts[4] || "");
            }

            if (benhNhan.diaChiNT) {
                var diachiParts = benhNhan.diaChiNT.split(",");
                $("#soNhaNT").val(diachiParts[0] || "");
                $("#thonPhoNT").val(diachiParts[1] || "");
                $("#xaPhuongNT").val(diachiParts[2] || "");
                $("#huyenNT").val(diachiParts[3] || "");
                $("#tinhNT").val(diachiParts[4] || "");
            }

            $("#noiLamViec").text(benhNhan.noiLamViec);

            switch (benhNhan.doiTuong) {
                case "BHYT":
                    $("#dtBHYT").prop("checked", true);
                    $("#soBhyt").val(benhNhan.soBHYT);
                    $("#gitriBhyt").val(benhNhan.gitriBHYT?.split('T')[0]);
                    break;
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
            $("#diaChiNT").val(benhNhan.diaChiNT);
            $("#sdtNt").val(benhNhan.sdtntNhan);

        }
    }).fail(function (xhr, status, error) {
        console.error("Lỗi gọi API:", error);
        alert("Không thể lấy dữ liệu bệnh nhân");
    });

});


