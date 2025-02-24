



//hiển thị bảng thông tin 
function toggleTable() {
    location.href="/order/list";
}

function hideTable() {
    var hiddenTable = document.getElementById('hidddenTable');
    hiddenTable.classList.add('hiddden');
}

// phân trang
var rowsPerPage = 10;
var rows = document.querySelectorAll('.order-information-list');
var pageCount = Math.ceil(rows.length / rowsPerPage);
var paginationContainer = document.getElementById('pagination');

showPage(1);

function showPage(page) {
    for (var i = 0; i < rows.length; i++) {
        rows[i].style.display = 'none';
    }

    var startIndex = (page - 1) * rowsPerPage;
    var endIndex = startIndex + rowsPerPage;
    for (var j = startIndex; j < endIndex && j < rows.length; j++) {
        rows[j].style.display = 'table-row';
    }

    updatePaginationButtons();
}

function createPaginationButtons(pageCount) {
    for (var i = 1; i <= pageCount; i++) {
        var button = document.createElement('button');
        button.innerText = i;
        button.addEventListener('click', function () {
            showPage(parseInt(this.innerText));
        });

        paginationContainer.appendChild(button);
    }

    updatePaginationButtons();
}

function updatePaginationButtons() {
    if (rows.length <= rowsPerPage) {
        paginationContainer.style.display = 'none';
    } else {
        paginationContainer.style.display = 'block';
    }
}

createPaginationButtons(pageCount);

