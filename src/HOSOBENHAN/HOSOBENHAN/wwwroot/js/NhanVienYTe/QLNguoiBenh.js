  function formatDate(dateStr) {
        const date = new Date(dateStr);
    const day = String(date.getDate()).padStart(2, '0');       // "02"
    const month = String(date.getMonth() + 1).padStart(2, '0'); // "11"
    const year = date.getFullYear();                           // 2025
    return `${day}/${month}/${year}`;
     }
    $(document).ready(function () {

        const params = new URLSearchParams(window.location.search);
    let mahsba = params.get("mahsba");
    let ma = params.get("ma");
    if(mahsba=="" || mahsba == null)
    {
        mahsba = localStorage.getItem("mahsba");
    ma  = localStorage.getItem("ma");
        }
    else if(mahsba != localStorage.getItem("mahsba"))
    {
        localStorage.setItem("mahsba", mahsba);
    localStorage.setItem("ma", ma);
        }

    // Gắn link động vào div_a
    const link = document.getElementById("div_a");
    if (link && mahsba) {
        link.innerHTML = `<a href="/NhanVienYTe/QLChung?mahsba=${mahsba}">Hồ sơ bệnh án</a>`;
        }

    // Gắn link động vào div_a1
    const link1 = document.getElementById("div_a1");
    if (link1 && ma && mahsba) {
        link1.innerHTML = `<a href="/NhanVienYTe/BenhNhan?ma=${ma}&mahsba=${mahsba}">Thông tin bệnh nhân</a>`;
        }

    $.get("https://localhost:7015/api/NhanVienYTe/QLNB", {ma: ma ,mahsba: mahsba}, function (kq) {
            var dulieu = kq.data;
    var sl = kq.data2;
            if (dulieu && dulieu.length > 0) {
                var html = "";
    var html1 = "";

    dulieu.forEach(function (item) {
                  var formattedDate = formatDate(item.ngayTao);
    html += `
    <div class="record-title">HỒ SƠ BỆNH ÁN LẦN ${sl}</div>
    <div class="div_rieng">
        <span class="record-status">Trạng thái: <span style="color:blue;">${item.trangThai}</span></span>

        <a class="details-link" href="/NhanVienYTe/QLChung?mahsba=${mahsba}">Chi tiết</a>
    </div>
    `
    html1 =`
    <div>Ngày: ${formattedDate}</div>
    <div class="div_rieng div_bsc">Bác sĩ chính: ${item.nguoiTao}</div>
    `
                });
    $("#div_tt").html(html);
    $("#div_tt1").html(html1);
                
            }
    else
    {
        alert("Không có thông tin.");
            }
        }).fail(function (xhr, status, error) {
        console.error("Lỗi gọi API:", error);
        });

      

    });