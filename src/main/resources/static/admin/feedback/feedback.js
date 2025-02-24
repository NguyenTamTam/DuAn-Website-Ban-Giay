function sendMail() {
    (function() {
        emailjs.init("UH0neh4IPkzyWXBYr");
    })();

    var sendername = document.querySelector("#sendername").value;
    var to = document.querySelector("#to").value;
    var subject = document.querySelector("#subject").value;
    var replyto = document.querySelector("#replyto").value;
    var message = document.querySelector("#message").value;

    if (subject.trim() === "") {
        alert("Tiêu đề không được để trống.");
        return;
    }
        if (sendername.trim() === "") {
        alert("Tên người gửi không được để trống.");
        return;
    }
        if (to.trim() === "") {
        alert("Người nhận không được để trống.");
        return; 
    }
        if (replyto.trim() === "") {
        alert("Trả lời không được để trống.");
        return;
    }
            if (message.trim() === "") {
        alert("Nội dung không được để trống.");
        return;
    }

    var params = {
        sendername: sendername,
        to: to,
        subject: subject,
        replyto: replyto,
        message: message,
    };

    var serviceID = "service_9wkw28e";
    var templateID = "template_takmxqo";

    emailjs.send(serviceID, templateID, params)
        .then(res => {
            alert("Email đã gửi thành công");
            location.reload(); // Tải lại trang sau khi gửi email
        })
        .catch(err => console.error("Lỗi khi gửi email: ", err));
}