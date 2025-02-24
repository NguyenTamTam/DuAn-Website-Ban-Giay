package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.AccountDAO;
import com.project.entity.Account;


@Controller
public class SecurityController {	
	@Autowired
    private AccountDAO accountDAO;
	
	@RequestMapping("/security/sigup/form")
	public String signupSuccess( Model model) {
		model.addAttribute("message","Xin vui lòng đăng nhập");
		return "security/login";
	}
	
	@RequestMapping("/security/login/form")
	public String loginForm( Model model) {
		model.addAttribute("message","Xin vui lòng đăng nhập");
		return "security/login";
	}
	
	@RequestMapping("/security/customer/form")
	public String customerForm( Model model) {
		return "security/customer";
	}
	
	@RequestMapping("/security/login/success")
	public String loginSuccess( Model model) {

		model.addAttribute("message","Bạn đã đăng nhập thành công");
		return "security/login";
	}
	@RequestMapping("/security/login/erorr")
	public String loginErorr( Model model) {
		model.addAttribute("message","Đăng nhập thất bại");
		
		return "security/login";
	}
	@RequestMapping("/security/unauthoried")
	public String unauthoried( Model model) {
		model.addAttribute("message","Tài khoản của bạn không được cấp phép");
		return "security/login";
	}
	@RequestMapping("/security/logoff/success")
	public String logoff( Model model) {
		model.addAttribute("message","Bạn đăng xuất thành công ");
		return "security/login";
	}
	
	
}
