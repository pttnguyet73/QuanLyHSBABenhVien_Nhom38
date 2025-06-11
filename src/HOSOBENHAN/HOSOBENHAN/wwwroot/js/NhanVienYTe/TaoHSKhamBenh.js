$(document).ready(function () {
      

      $("#addhoso").on("click", function (event) {
            event.preventDefault();
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
                },
                error: function (xhr, status, error) {
                    console.error("Lỗi khi lưu:", error);
                    alert("Thêm phiếu thất bại!");
                }
            });
        });
  });
