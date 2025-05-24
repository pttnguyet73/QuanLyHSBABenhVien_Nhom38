 $(document).ready(function () {
        const urlParams = new URLSearchParams(window.location.search);
    const ma = urlParams.get("ma");
    const mahsba = urlParams.get("mahsba");

    if (!ma || !mahsba) {
        alert("Thiếu mã đơn thuốc hoặc mã hồ sơ bệnh án");
    return;
        }

    $.get("https://localhost:7015/api/NhanVienYTe/Thuoc", {ma: ma, mahsba: mahsba }, function (res) {
           
            const hoso = res.datahoso[0]; //lấy thông tin bệnh nhân
    const thuocList = res.datathuoc; //danh sách thuốc

    if (hoso) {
        $(".info-grid").html(`
                    <div class="info-item"><strong>Mã CCCD:</strong> ${hoso.macccd}</div>
                    <div class="info-item"><strong>BHYT:</strong> ${hoso.bhyt}</div>
                    <div class="info-item"><strong>Bệnh nhân:</strong> ${hoso.hoten}</div>
                    <div class="info-item"><strong>Giới tính:</strong> ${hoso.gioitinh}</div>
                    <div class="info-item"><strong>Dân tộc:</strong> ${hoso.dantoc}</div>
                    <div class="info-item"><strong>Tuổi:</strong> ${formatAge(hoso.tuoi)}</div>
                    <div class="info-item full-width"><strong>Chuẩn đoán:</strong> ${hoso.chuanDoan}</div>
                `);
            }

    var html = "";
            thuocList.forEach((item, index) => {
        html += `
                    <tr>
                        <td>${index + 1}</td>
                        <td>${item.tenthuoc}</td>
                        <td>${item.soLuong}</td>
                        <td>${item.donvi}</td>
                        <td>${item.cachdung}</td>
                        <td>${item.ghichu}</td>
                    </tr>
                `;
            });

    $(".medicine-table tbody").html(html);
        });
    });

    function formatAge(dateStr) {
        if (!dateStr) return "";
    const birth = new Date(dateStr);
    const today = new Date();
    let age = today.getFullYear() - birth.getFullYear();
    const m = today.getMonth() - birth.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birth.getDate())) {
        age--;
        }
    return age;
    }
