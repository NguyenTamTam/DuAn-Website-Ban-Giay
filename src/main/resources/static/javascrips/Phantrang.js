
  var itemsPerPage = 15; // Số lượng mục hiển thị trên mỗi trang
var currentPage = 1; // Trang hiện tại

function showPage(page) {
   var itemList = document.getElementsByClassName('image');

   // Ẩn tất cả các mục
   for (var i = 0; i < itemList.length; i++) {
      itemList[i].style.display = 'none';
   }

   // Hiển thị các mục tương ứng với trang hiện tại
   var startIndex = (page - 1) * itemsPerPage;
   var endIndex = startIndex + itemsPerPage;
   for (var j = startIndex; j < endIndex; j++) {
      if (itemList[j]) {
         itemList[j].style.display = 'block';
      }
   }
}

function generatePageNumbers() {
   var itemList = document.getElementsByClassName('item');
   var totalPages = Math.ceil(itemList.length / itemsPerPage);
   var pageNumbers = document.getElementById('page-numbers');
   pageNumbers.innerHTML = ''; // Xóa số trang hiện tại

   for (var i = 1; i <= totalPages; i++) {
      var pageNumber = document.createElement('li');
      var link = document.createElement('a');
      link.href = '#';
      link.textContent = i;
      link.addEventListener('click', function(e) {
         e.preventDefault();
         currentPage = parseInt(e.target.textContent);
         showPage(currentPage);
         generatePageNumbers();
      });

      pageNumber.appendChild(link);
      pageNumbers.appendChild(pageNumber);
   }
}

// Khởi tạo phân trang ban đầu
showPage(currentPage);
generatePageNumbers();