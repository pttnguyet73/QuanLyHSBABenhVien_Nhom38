function toggleBox() {
    var tr = document.getElementById("tr_addtext");
    document.getElementById("btn_addcontent").style.border = "none";
    tr.style.display = (tr.style.display === "none") ? "" : "none";

    const now = new Date();
    const formatted = `${now.getDate()}/${now.getMonth() + 1}, ${now.getHours()}h${now.getMinutes()}p`;
    document.getElementById("td_getdatetime").innerText = formatted;
}

function Savedata() {
    const tddb = document.getElementById("texttddb").value;
    const ylenh = document.getElementById("textylenh").value;
    const dd = document.getElementById("textdieuduong").value;
    const datetime = document.getElementById("td_getdatetime").innerText;

    if (!tddb || !ylenh || !dd) {
        alert("Vui lòng nhập đầy đủ thông tin.");
        return;
    }

    const newRow = document.createElement("tr");
    newRow.innerHTML = `
    <td>${datetime}</td>
    <td>${tddb}</td>
    <td>${ylenh}</td>
    <td>${dd}</td>
    `;

    const table = document.getElementById("tb");
    table.appendChild(newRow);

    // Reset
    document.getElementById("texttddb").value = '';
    document.getElementById("textylenh").value = '';
    document.getElementById("textdieuduong").value = '';
    document.getElementById("tr_addtext").style.display = 'none';
}

