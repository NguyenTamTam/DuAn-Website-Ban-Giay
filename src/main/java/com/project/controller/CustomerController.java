package com.project.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.AccountDAO;
import com.project.entity.Account;

import okhttp3.Request;

public class CustomerController {
	@RequestMapping("/security/customer")
	public String customer( Model model) {
		
		
		/*model.addAttribute("message","Bạn đã đăng nhập thành công");*/
		return "security/customer2";
	}
}
