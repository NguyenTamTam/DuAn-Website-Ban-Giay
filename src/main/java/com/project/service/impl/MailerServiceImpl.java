package com.project.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.project.entity.MailInfo;
import com.project.service.MailerService;

@Service
public class MailerServiceImpl implements MailerService{
	@Autowired
	JavaMailSender sender;
	
@Override
public void send(MailInfo mail) throws MessagingException {
MimeMessage message = sender.createMimeMessage();
MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
helper.setFrom(mail.getFrom());
helper.setTo(mail.getTo());
helper.setSubject(mail.getSubject());
helper.setText(mail.getBody(), true);
helper.setReplyTo(mail.getFrom());
//sua string[]
String cc = mail.getCc();
// sua ()
if(cc != null && cc.length() > 0) {
	helper.setCc(cc);
}
String[] bcc = mail.getBcc();
if(bcc != null && bcc.length > 0) {
	helper.setBcc(bcc);
}
String[] attachments = mail.getAttachments();
if(attachments != null && attachments.length > 0) {
	for(String path: attachments) {
		File file = new File(path);
		helper.addAttachment(file.getName(), file);
	}
}
sender.send(message);
}

	

List<MailInfo> queue = new ArrayList<>();

@Override
public void queue(MailInfo mail) {
	queue.add(mail);
}


@Scheduled(fixedDelay = 500)
public void run() {
	while(!queue.isEmpty()) {
		MailInfo mail = queue.remove(0);
		try {
			send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


@Override
public void send(String to, String subject, String body) throws MessagingException {
	// TODO Auto-generated method stub
	
}


@Override
public void queue(String to, String subject, String body) {
	// TODO Auto-generated method stub
	
}
}