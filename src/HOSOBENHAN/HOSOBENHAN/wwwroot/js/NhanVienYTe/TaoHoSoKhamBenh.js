    $(document).ready(function () {

        $("#btn_checkcccd").on("click", function () {
            const tr = $("#textktra").val();
            if (!tr) {
                alert("Vui lòng nhập mã cccd");
                return;
            }
            data = {
                "cccd": tr
            }


            $.ajax({
                url: "https://localhost:7015/api/NhanVienYTe/Timkiemcccd",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (kq) {
                    const tt = kq.data;

                    if (tt) {
                        $(".info-box").empty();

                        // Chuyển ngày sinh sang năm
                        const namSinh = tt.ngaySinh ? new Date(tt.ngaySinh).getFullYear() : "";

                        // Hiển thị thông tin bệnh nhân
                        $(".info-box").html(`
                            <div>Mã cccd : ${tt.cccd || ''}</div>
                            <div>Giới tính : ${tt.gtinh || ''}</div>
                            <div>Họ tên : ${tt.hoTen || ''}</div>
                            <div>Năm sinh : ${namSinh}</div>
                            <div>Số điện thoại : ${tt.sdtntnhan || ''}</div>
                            <label id="textidcccd" style="display:none">${tt.cccd}</label>
                        `);
                    } else {
                        $(".info-box").html('<div>Không tìm thấy thông tin bệnh nhân</div>');

                    }
                },
                error: function (xhr, status, error) {
                    $(".info-box").empty();
                    $(".info-box").html(`
                            <div>Mã cccd : </div>
                            <div>Giới tính : </div>
                            <div>Họ tên : </div>
                            <div>Năm sinh : </div>
                            <div>Số điện thoại : </div>
                        `);
                    alert("Không có thông tin!");
                }
            });

        });

    $("#khoa").on("change", function () {
            const mkhoa = $("#khoa").val();
    if (!mkhoa) {
        alert("Lỗi null");
    return;
            }
    data =   {
        "makhoa": mkhoa
            }


    $.ajax({
        url: "https://localhost:7015/api/NhanVienYTe/LocBacSy",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(data),
    success: function (kq) {
                    const bs = kq.data;
                    if (bs && bs.length > 0) {
                       var html = '<option value="">-- Chọn bác sĩ --</option>';
    bs.forEach(function (item) {
        html += `<option value="${item.maNv}">${item.hoTen}</option>`;
                        });
    $("#doctor").not("#div_kt").html(html); // Gán option mới
                     }
    else
    {
                          var html = '<option value="">-- Chọn bác sĩ --</option>';
    $("#doctor").not("#div_kt").html(html);
                     }
                   
                },
    error: function (xhr, status, error) {
        console.error("Lỗi khi lưu:", error);
    alert("Không có thông tin!");
                }
            });

        });


    $.get("https://localhost:7015/api/NhanVienYTe/ListTaoHoSo", { }, function (kq) {
            var dulieu = kq.data;
    var bs = kq.data2;

            // Load khoa
            if (dulieu && dulieu.length > 0) {
                var html = '<option value="">-- Chọn khoa --</option>';
    dulieu.forEach(function (item) {
        html += `<option value="${item.maKhoa}">${item.tenKhoa}</option>`;
                });
    $("#khoa").not("#div_kt").html(html); // Gán option mới
            }

            // Load bác sĩ
            if (bs && bs.length > 0) {
                var html = '<option value="">-- Chọn bác sĩ --</option>';
    bs.forEach(function (item) {
        html += `<option value="${item.maBs}">${item.tenBs}</option>`;
                });
    $("#doctor").not("#div_kt").html(html); // Gán option mới
            }
        }).fail(function (xhr, status, error) {
        console.error("Lỗi gọi API:", error);
        });

        $("#addhoso").on("click", function () {
            const cccd = $("#textidcccd").text();
            const trieuchung = $("#symptoms").val();
            const khoa = $("#khoa").val();

            if (!cccd) {
                alert("Vui lòng tìm kiếm trước");
            }

            if (!trieuchung || !khoa) {
                alert("Vui lòng nhập đầy đủ thông tin.");
                return;
            }

            const data = {
                Cccd: cccd,
                TrieuChung: trieuchung,
                Khoa: khoa
            };


            $.ajax({
                url: "https://localhost:7015/api/NhanVienYTe/Addhosobenhnhan",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function () {
                    alert("Thêm phiếu thành công!");
                    // location.reload();
                },
                error: function (xhr, status, error) {
                    console.error("Lỗi khi lưu:", error);
                    alert("Lưu thất bại!");
                }
            });
        });

    });
