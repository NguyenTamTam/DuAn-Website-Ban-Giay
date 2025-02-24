const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const body = document.getElementById('body');


signUpButton.addEventListener('click', () => {
    container.classList.add('right-panel-active');
    body.style.background = " linear-gradient(to right,rgb(151, 29, 29), rgb(233, 233, 228))";
});

signInButton.addEventListener('click', () => {
    container.classList.remove('right-panel-active');
    body.style.background = " linear-gradient(to right, rgb(233, 233, 228),  #4087f1)";
});


    document.addEventListener('DOMContentLoaded', function () {
    var messdiv = document.querySelector('.messge');
    var messageElement = document.getElementById('message1');

    if (messageElement && messdiv) {
        setTimeout(function () {
            messdiv.style.maxWidth = '400px';
            messageElement.style.opacity = '1';
            setTimeout(function () {
				messdiv.style.maxWidth = '0px';
            	messageElement.style.opacity = '0';
                messageElement.style.display = 'none';
            }, 3500);
        }, 1000);
    }
});

function validateForm() {
  var username = document.forms["signupForm"]["username"].value;
    var fullname = document.forms["signupForm"]["fullname"].value;
      var phone = document.forms["signupForm"]["phone"].value;
  var email = document.forms["signupForm"]["email"].value;
  var password = document.forms["signupForm"]["password"].value;
  
  if (username == "") {
    showMessage("Tài khoản không được để trống");
    return false;
  }
    if (fullname == "") {
    showMessage("Họ và tên không được để trống");
    return false;
  }
  if (phone == "") {
    showMessage("Số điện thoại không được để trống");
    return false;
  }
  if (email == "") {
    showMessage("Email không được để trống");
    return false;
  }
    if (password == "") {
    showMessage("Mật khẩu không được để trống");
    return false;
  }
  return true;
}
function showMessage(message) {
  alert(message);
}