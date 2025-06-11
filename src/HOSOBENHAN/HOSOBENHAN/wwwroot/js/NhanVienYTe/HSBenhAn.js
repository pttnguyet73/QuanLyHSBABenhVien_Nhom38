 $(document).ready(function () {

        $("#btn_search").on("click", function () {
            const tddb = $("#text_search").val();

            if (!tddb) {
                alert("Vui lòng nhập  thông tin.");
                return;
            }

            $.get("https://localhost:7015/api/NhanVienYTe/TimKiemHoSo", { tddb: tddb }, function (kq) {
                var dulieu = kq.data;
                if (dulieu && dulieu.length > 0) {
                    var html = "";
                    var i = 1;
                    dulieu.forEach(function (item) {
                        html += `
                    <tr>
                        <td>${i}</td>
                        <td>${item.mahsba}</td>
                        <td>${item.cccd}</td>
                        <td>${item.hoten}</td>
                        <td>${new Date(item.ngaysinh).getFullYear()}</td>
                        <td><a href="BenhNhan?ma=${item.mabn}&mahsba=${item.mahsba}">Cập nhật</a></td>
                    </tr>`;
                        i++;
                    });

                    // Xóa các dòng cũ (trừ dòng header và dòng nhập)
                    $("#tb tr").not(":first").not("#tr_addtext").remove();

                    // Chèn dữ liệu mới
                    $("#tr_addtext").before(html);
                } else {
                    alert("Không tìm thấy hồ sơ phù hợp.");
                }
            }).fail(function (xhr, status, error) {
                console.error("Lỗi gọi API List:", error);
                alert("Không tìm thấy hồ sơ!");
            });
        });

     const baseUrl = "BenhNhan";

     $.get("https://localhost:7015/api/NhanVienYTe/ListHoSoBenhAn", { }, function (kq) {
        var dulieu = kq.data;
        if (dulieu && dulieu.length > 0) {
            var html = "";
    var i = 1;
            dulieu.forEach(function (item) {
                const url = `${baseUrl}?ma=${item.mabn}&mahsba=${item.mahsba}`;
        html += `
                    <tr>
                        <td>${i}</td>
                        <td>${item.mahsba}</td>
                        <td>${item.cccd}</td>
                        <td>${item.hoten}</td>
                        <td>${new Date(item.ngaysinh).getFullYear()}</td>
                        <td><a href="${url}">Cập nhật</a></td>
                    </tr>`;
            i++;
            });

    // Xóa các dòng cũ (trừ dòng header và dòng nhập)
    $("#tb tr").not(":first").not("#tr_addtext").remove();

    // Chèn dữ liệu
    $("#tr_addtext").before(html);
        }
    }).fail(function (xhr, status, error) {
        console.error("Lỗi gọi API:", error);
    });

    });
