  const mahsba  = localStorage.getItem("mahsba");
    localStorage.setItem("mahsba", mahsba);
    $(document).ready(function () {
        $.get("https://localhost:7015/api/NhanVienYTe/ListQLDonThuoc", { mahsba: mahsba }, function (kq) {
            var dulieu = kq.data;

            if (dulieu && dulieu.length > 0) {
                var html = "";
                var i = 1;
                dulieu.forEach(function (item) {
                    var tuNgay = formatDate(item.tgianBdauSd);
                    var denNgay = formatDate(item.tgianKthucSd);

                    html += `
                        <div class="prescription-box">
                            <div class="prescription-info">
                                <b>ĐƠN THUỐC LẦN ${i} - ${item.tenKhoa}</b>
                                Từ ngày: ${tuNgay} &nbsp;&nbsp; Đến ngày: ${denNgay}
                            </div>
                            <a href="/NhanVienYTe/QLChung?tab=donthuoc&ma=${item.maDonThuoc}&mahsba=${item.maHsba}">Chi tiết</a>
                        </div>`;
                    i++;
                });

                $(".main-content").append(html);
            }
        });
    });

    function formatDate(dateStr) {
        if (!dateStr) return "";
    const date = new Date(dateStr);
    const d = pad(date.getDate());
    const m = pad(date.getMonth() + 1);
    const y = date.getFullYear();
    return `${d}/${m}/${y}`;
    }

    function pad(n) {
        return n < 10 ? '0' + n : n;
    }