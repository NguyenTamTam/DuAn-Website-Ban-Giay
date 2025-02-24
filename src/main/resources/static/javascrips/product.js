const searchInput = document.getElementById('srch');
searchInput.addEventListener('keyup', function(event) {
  if (event.key === 'Enter') {
    event.preventDefault();
    search();
  }
});


const fullname = 'Nguyễn Tâm Tâm';
const phone = 0345303416;

// Lấy phần tử có id "fullname" và "phone" trong HTML
var username = document.getElementById("fullnameId");
var phoneNumber = document.getElementById("phoneId");

// Gán giá trị fullname và phone vào các phần tử tương ứng
username.textContent = fullname;
phoneNumber.textContent = phone;

// Định nghĩa thông tin fullname và phone

//chọn sản phẩm

const fullname2 = 'Dưới 3 Triệu';
var selectprice = document.getElementById("select-price-select");
var price_range = document.querySelector('select[name="price_range"]');
if (price_range) {
  if (price_range.value === "0-3000000.0") {
    selectprice.textContent = fullname2;
  } else if (price_range.value === "3000000.0-5000000.0") {
    selectprice.textContent = 'Từ 3 đến 5 Triệu';
  } else if (price_range.value === "5000000-10000000") {
    selectprice.textContent = 'Từ 5 đến 10 Triệu';
  } else if (price_range.value === "10000000-15000000") {
    selectprice.textContent = 'Từ 10 đến 15 Triệu';
  } else if (price_range.value === "15000000-0") {
    selectprice.textContent = 'Trên 15 Triệu';
  }
}

 function zoom(e) {
            var zoomer = document.getElementById('zoomed-image');
            var offsetX, offsetY;
            e.offsetX ? offsetX = e.offsetX : offsetX = e.touches[0].pageX - zoomer.offsetLeft;
            e.offsetY ? offsetY = e.offsetY : offsetY = e.touches[0].pageY - zoomer.offsetTop;

            var x = (offsetX / zoomer.offsetWidth) * 100 + "%";
            var y = (offsetY / zoomer.offsetHeight) * 100 + "%";

            zoomer.style.transformOrigin = x + " " + y;
        }


      function confirmDelete(id) {
        if (confirm("Bạn có chắc chắn muốn hủy đơn hàng này không?")) {
            fetch(`/delete/${id}`, {
                method: 'DELETE',
            })
            .then(response => {
                if (response.ok) {
                    window.location.href = "/order/list";
                } else {
                    console.error('Error deleting order:', response.statusText);
                }
            })
            .catch(error => {
                console.error('Error deleting order:', error);
            });
            return false;
        } else {
            return false;
        }
    }