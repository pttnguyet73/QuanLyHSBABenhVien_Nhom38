document.addEventListener("DOMContentLoaded", function () {
    const filterKhoa = document.getElementById("filter-khoa");
    const filterBacSi = document.getElementById("filter-bacsi");
    const filterChanDoan = document.getElementById("filter-chandoan");
    const rows = document.querySelectorAll(".medical-record-table tbody tr");

    function applyFilters() {
        const khoaValue = filterKhoa.value.toLowerCase();
        const bacsiValue = filterBacSi.value.toLowerCase();
        const chandoanValue = filterChanDoan.value.toLowerCase();

        rows.forEach(row => {
            const chandoan = row.cells[2].textContent.toLowerCase();
            const bacsi = row.cells[3].textContent.toLowerCase();
            const khoa = row.cells[4].textContent.toLowerCase();

            const match =
                (khoa.includes(khoaValue) || !khoaValue) &&
                (bacsi.includes(bacsiValue) || !bacsiValue) &&
                (chandoan.includes(chandoanValue) || !chandoanValue);

            row.style.display = match ? "" : "none";
        });
    }

    filterKhoa.addEventListener("change", applyFilters);
    filterBacSi.addEventListener("change", applyFilters);
    filterChanDoan.addEventListener("change", applyFilters);
});
