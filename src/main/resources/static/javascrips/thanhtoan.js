const mb = document.querySelector('.mb')
const vcb = document.querySelector('.vcb')
const scb = document.querySelector('.scb')
const arb = document.querySelector('.arb')
const shb = document.querySelector('.shb')
const button1 = document.querySelector('.bank');
const p = document.querySelector('.l1');

const Btn = document.querySelectorAll('.dropbtn')
for (let i = 0; i < Btn.length; i++) {
    Btn[i].addEventListener('click', function() {
        this.parentElement.querySelector('.dropdown-content').classList.toggle('show')
    })
}
  

vcb.addEventListener('click', () => {button1.classList.add('butt');
  button1.innerText = "Vietcombank";
  p.innerText = "";
});

mb.addEventListener('click', () => {button1.classList.add('butt');
  button1.innerText = "MB-Bank";
  p.innerText = "";
});

scb.addEventListener('click', () => {button1.classList.add('butt');
  button1.innerText = "Sacombank";
  p.innerText = "";
});

arb.addEventListener('click', () => {button1.classList.add('butt');
  button1.innerText = "Agribank";
  p.innerText = "";
});

shb.addEventListener('click', () => {button1.classList.add('butt');
  button1.innerText = "VN-Pay";
  p.innerText = "";
});

button1.addEventListener('click', () => {button1.classList.remove('butt');
button1.innerText = "";
p.innerText = "Thông Tin Ngân Hàng";
});