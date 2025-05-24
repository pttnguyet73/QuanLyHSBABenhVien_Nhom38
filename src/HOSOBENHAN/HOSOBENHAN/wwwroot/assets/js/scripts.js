const rowsPerPage = 6;

window.onload = function () {
    const table = document.getElementById("recordTable").getElementsByTagName("tbody")[0];
    const rows = Array.from(table.rows);
    const totalPages = Math.ceil(rows.length / rowsPerPage);
    const pagination = document.getElementById("pagination");

    function showPage(page) {
        // Ẩn tất cả dòng
        rows.forEach((row, index) => {
            row.style.display = "none";
        });

        // Hiện dòng cho trang hiện tại
        const start = (page - 1) * rowsPerPage;
        const end = start + rowsPerPage;
        for (let i = start; i < end && i < rows.length; i++) {
            rows[i].style.display = "";
        }

        // Tô đậm nút đang chọn
        const spans = pagination.querySelectorAll("span");
        spans.forEach((s, i) => {
            s.classList.toggle("active", i + 1 === page);
        });
    }

    // Tạo các nút trang
    for (let i = 1; i <= totalPages; i++) {
        const span = document.createElement("span");
        span.textContent = i;
        span.addEventListener("click", () => showPage(i));
        pagination.appendChild(span);
    }

    // Trang đầu tiên mặc định
    showPage(1);
};
