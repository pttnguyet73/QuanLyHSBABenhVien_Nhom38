 $(document).ready(function () {
        $.get("https://localhost:7015/api/NhanVienYTe/ListHSBenhNhan", {}, function (kq) {
            var dulieu = kq.data;
            var sl1 = kq.r1;
            var sl2 = kq.r2;
          
            if(dulieu && dulieu.length > 0) {
                var html = "";
                dulieu.forEach(function (item) {
                    html += `
            <tr>
              <td>${item.stt}</td>
              <td>${item.khoa}</td>
              <td>${item.cccd}</td>
              <td>${item.hoten}</td>
              <td>${item.gioiTinh}</td>
              <td>${item.dantoc}</td>
              <td>${item.ngoaiKieu}</td>
             </tr>`;
                });
                $("#tr_addtext").html(html);
            }

         
                var html1 = "";
 
                    html1 += ` <div>
                    <img src="/images/internet.png" alt="Online Icon" />
                    <h3>${sl1}</h3>
                </div>
                 <p>Hồ sơ bệnh nhân đăng ký online</p>
                `;

                $("#dkionline").html(html1);
            
           
                var html2 = "";

                    html2 += `<div>
                    <img src="/images/usertowpeople.png" alt="Offline Icon" />
                    <h3>${sl2}</h3>
                </div>
                <p>Hồ sơ bệnh nhân offline</p>
                `;

            $("#dkoffline").html(html2);

            var html3 = "";

            html3 += ` <div>
                    <img src="/images/userthreepeople.png" alt="Total Icon" />
                    <h3>${Number(sl1) + Number(sl2)}</h3>
                </div>
                <p>Tổng hồ sơ bệnh nhân đã đăng ký</p>
            </div>
                `;

            $("#dktong").html(html3);
            
        }).fail(function (xhr, status, error) {
            console.error("Lỗi gọi API:", error);
        });


    $("#btn_search").on("click", function () {
            const tddb = $("#textimkiem").val();

    if (!tddb ) {
        alert("Vui lòng nhập  thông tin.");
    return;
            }

    $.get("https://localhost:7015/api/NhanVienYTe/TimKiemHoSoBN", {tddb: tddb }, function (kq) {
        var dulieu = kq.data;
        if (dulieu && dulieu.length > 0) {
            var html = "";
    dulieu.forEach(function (item) {
        html += `
                  <tr>
                      <td>${item.stt}</td>
                      <td>${item.khoa}</td>
                      <td>${item.cccd}</td>
                      <td>${item.hoten}</td>
                      <td>${item.gioiTinh}</td>
                      <td>${item.dantoc}</td>
                      <td>${item.ngoaiKieu}</td>
                </tr>`;
                });

    $("#tr_addtext").html(html);

        } else {
        alert("Không tìm thấy hồ sơ phù hợp.");
        }
    }).fail(function (xhr, status, error) {
        console.error("Lỗi gọi API List:", error);
    alert("Không tìm thấy hồ sơ!");
    });
    });

   
     setTimeout(function () {
         location.reload();
     }, 10000);

    });
