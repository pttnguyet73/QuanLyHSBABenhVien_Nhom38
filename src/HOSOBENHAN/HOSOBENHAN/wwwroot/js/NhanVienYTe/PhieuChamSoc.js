    let urlParams = new URLSearchParams(window.location.search);
    let mahsba = urlParams.get("mahsba");
    if(mahsba=="" || mahsba == null)
    {
        mahsba = localStorage.getItem("mahsba");
        }
    else if(mahsba != localStorage.getItem("mahsba") )
    {
        localStorage.setItem("mahsba", mahsba);
}

function formatDate(date) {
    const yyyy = date.getFullYear();

    const mm = String(date.getMonth() + 1).padStart(2, '0');
    const dd = String(date.getDate()).padStart(2, '0');
    return `${yyyy}-${mm}-${dd}`;
}

    function parseCustomDate(str) {
        // str: "17/02,7h30p"
    const regex = /(\d{1,2})\/(\d{1,2}),(\d{1,2})h(\d{1,2})p/;
    const match = str.match(regex);

    if (!match) return null;
    const day = parseInt(match[1]);
    const month = parseInt(match[2]) - 1; 
    const hour = parseInt(match[3]);
    const minute = parseInt(match[4]);

    // Dùng ngày hiện tại để lấy năm (hoặc có thể gán cứng năm nếu cần)
    const year = new Date().getFullYear();

    return new Date(year, month, day, hour, minute);
    }
    $(document).ready(function () {
        // Gắn sự kiện cho nút "Thêm"
        $("#btn_addcontent").on("click", function () {
            const tr = document.getElementById("tr_text");
            if (!tr) {
                console.error("Không tìm thấy phần tử có ID 'tr_text'");
                return;
            }

            tr.style.display = (tr.style.display === "none" || tr.style.display === "") ? "table-row" : "none";

            const now = new Date();
            const formatted = `${now.getDate()}/${now.getMonth() + 1},${now.getHours()}h${now.getMinutes()}p`;


            const datetimeEl = document.getElementById("td_getdatetime");
            if (datetimeEl) {
                datetimeEl.innerText = formatted;
            }
            });

    // Gắn sự kiện cho nút "Lưu"
    $("#btn_savecontent").on("click", function () {
    const tddb = $("#texttddb").val();
    const ylenh = $("#textylenh").val();
    const dd = $("#textdieuduong").val();
    const datetime = $("#td_getdatetime").text();
    const da = parseCustomDate(datetime);


    if (!tddb || !ylenh || !dd) {
        alert("Vui lòng nhập đầy đủ thông tin.");
    return;
            }

        const data = {
            MaHSBA: mahsba,
            Ngay: formatDate(da),
            DienBienBenh: tddb,
            YLenh: ylenh,
            TenDieuDuong: dd
        };




    $.ajax({
        url: "https://localhost:7015/api/NhanVienYTe/Adddatapcs",
    type: "POST",
    contentType: "application/json",
    data: JSON.stringify(data),
    success: function () {
        alert("Lưu thành công!");
        location.reload();
                },
    error: function (xhr, status, error) {
        console.error("Lỗi khi lưu:", error);
    alert("Lưu thất bại!");
                }
            });
        });

    $.get("https://localhost:7015/api/NhanVienYTe/List", {mahsba: mahsba}, function (kq) {
        var dulieu = kq.data;
        var dulieu2 = kq.data2;
        if (dulieu2 && dulieu2.length > 0) {
            document.getElementById("btn_addcontent").style.display = "none";
            document.getElementById("div_savedata").style.display = "none";
        } 
        if (dulieu && dulieu.length > 0) {
                var html = "";
    dulieu.forEach(function (item) {
                    var date = new Date(item.ngay);
    var formattedDate = `${pad(date.getDate())}/${pad(date.getMonth() + 1)},${pad(date.getHours())}h${pad(date.getMinutes())}p`;
    html += `
    <tr>
        <td>${formattedDate}</td>
        <td>${item.dienBienBenh}</td>
        <td>${item.ylenh}</td>
        <td>${item.tenDieuDuong}</td>
    </tr>`;
                });
               $("#tb tr").not(":first").not("#tr_addtext").not("#tr_text").not("#td_getdatetime")
               .not("#texttddb")
               .not("#textylenh")
               .not("#textdieuduong")
               .remove();
                $("#tr_addtext").before(html);
            }
        }).fail(function (xhr, status, error) {
            console.error("Lỗi gọi API:", error);
        });

        function pad(n) {
            return n < 10 ? '0' + n : n;
        }
    });
    


