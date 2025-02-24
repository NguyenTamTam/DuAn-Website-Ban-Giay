package com.project.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dao.AccountDAO;
import com.project.entity.Account;
import com.project.entity.AccountProjection;
import com.project.entity.Product;
import com.project.service.AccountService;


@Controller
public class AccountController {
	@Autowired
	AccountService accountService;
	
	AccountDAO pdao;
	
	
	
	@RequestMapping("/security/customer")
	public String list( Model model , HttpServletRequest request) {
		String username = request.getRemoteUser();
		model.addAttribute("accounts",accountService.findAccountByUsername(username));
		return "security/customer";
	}
	
	
	
	@GetMapping("/account/customer/{username}")
    public String customer(@PathVariable("username") String username, Model model) {
        Account account = accountService.findById(username);
        model.addAttribute("account", account);
        return "security/customer"; // Thay thế bằng tên file template của bạn
    }
}
