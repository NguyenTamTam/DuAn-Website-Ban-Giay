package com.project.controller;

import java.util.Arrays;
import java.util.HashSet;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.anlavn.file.Properties;
import com.anlavn.net.Email;
import com.project.entity.MailInfo;
import com.project.service.MailerService;
import com.project.service.OrderService;

@Controller
public class MailerController {
	@Autowired
	MailerService mailer;
	// lab7.3
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/pay/momo/mail")
	public String demo3(Model model) {
	// 1. mail người nhận
		//mailer.queue("caophucthinhmailinfo24@gmail.com", "Subject..hi NGOC TRINH", "Body...hi NGOC TRINH");
	MailInfo mailinfo = new MailInfo();	
		model.addAttribute("mailinfo", mailinfo);
		return "pay/momo"; //view lên trang mail giao diện
	}
	
	//@ResponseBody
	@RequestMapping("/mailer/send")
	public String send(Model model, MailInfo mailinfo, HttpServletRequest request) throws MessagingException {
		Properties app = new Properties("src/main/resources/application.properties");
		String hostEmail = app.getString("spring.mail.username"),
				hostPass = app.getString("spring.mail.password");
		Email mail = new Email(hostEmail, hostPass);  //setup your SMTP service 
		mail.setEmail("Shop Giày MY SHOES", "<h2>MY SHOES Kính Chào khách hàng</h2>\r\n"
				+ "\r\n"
				+ "<div>Chúng tôi xin gửi lời cảm ơn chân thành đến bạn vì đã đặt hàng từ cửa hàng chúng tôi. Chúng tôi rất trân trọng sự tin tưởng và ủng hộ của bạn.</div>\r\n"
				+ "\r\n"
				+ "<div>Chúng tôi xác nhận rằng đơn hàng của bạn đã được nhận và đang được xử lý. Chúng tôi sẽ kiểm tra và chuẩn bị đơn hàng của bạn một cách cẩn thận để đảm bảo chất lượng và hài lòng cho bạn.</div>\r\n"
				+ "\r\n"
				+ "<div>Hiện tại, chúng tôi đang xử lý đơn hàng của bạn và sẽ chủ động thông báo với bạn về quá trình xử lý và vận chuyển. Bạn ghé thăm trang web của chúng tôi hoặc kiểm tra email thường xuyên để cập nhật thông tin liên quan đến đơn hàng của bạn.</div>\r\n"
				+ "\r\n"
				+ "<div>Nếu bạn có bất kỳ câu hỏi hoặc yêu cầu đặc biệt nào liên quan đến đơn hàng, hãy đừng ngần ngại liên hệ với chúng tôi. Đội ngũ chăm sóc khách hàng của chúng tôi sẵn sàng hỗ trợ bạn một cách tận tâm và nhanh chóng.</div>\r\n"
				+ "\r\n"
				+ "<div>Một lần nữa, chúng tôi xin chân thành cảm ơn bạn đã tin tưởng và lựa chọn sản phẩm của chúng tôi. Chúng tôi hy vọng đơn hàng của bạn sẽ đáp ứng mọi mong đợi và mang lại sự hài lòng tuyệt đối.</div>\r\n"
				+ "\r\n"
				+ "<div>Trân trọng cảm ơn\r\n"
				+ "\r\n"
				+ "<h1>[Shop Giày MY SHOES]</h1>");
		mail.addSetTO("tamntps22213@fpt.edu.vn");// chổ này hay cái duoi cái này là gửi dưới dạng TO
		mail.addSetCC("phongtptps20926@fpt.edu.vn");// chổ này là gui duoi dang cc
		mail.sendEmail();
		model.addAttribute("mail", mailinfo);
		
		String username =request.getRemoteUser();
		model.addAttribute("orders",orderService.findByUsername(username));
		return "order/list"; // hiện thị lên trang send
	}
	
}
