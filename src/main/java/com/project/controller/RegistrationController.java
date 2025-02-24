package com.project.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dao.AccountDAO;
import com.project.dao.AuthorityDAO;
import com.project.dao.RoleDAO;
import com.project.entity.Account;
import com.project.entity.Authority;
import com.project.entity.Role;

@Controller
public class RegistrationController {

  @Autowired
  private AccountDAO accountDAO; 
  @Autowired
  private RoleDAO roleDAO;
  @Autowired
  private AuthorityDAO authorityDAO;
  @Autowired
	BCryptPasswordEncoder pe;


  @RequestMapping("/register")
  public String showRegistrationForm() {
    return "register";
  }

  @PostMapping("/register")
  public String processRegistration(Account account, Model model) {
      try {
    	  Optional<Account> existingAccount = accountDAO.findByUsername(account.getUsername());
	        if (existingAccount.isPresent()) {
	            model.addAttribute("message", "Tên tài khoản đã tồn tại! ");
	            return "security/login"; // Trả về trang đăng ký với thông báo lỗi
	        }else {
    	  account.setPassword(pe.encode(account.getPassword()));


          Account savedAccount = accountDAO.save(account);

          if (savedAccount != null) {
              Role role = new Role();
              role.setId("CUST");
              role.setName("Khách hàng");
              roleDAO.save(role);

              Authority authority = new Authority();
              authority.setAccount(savedAccount);
              authority.setRole(role);
              authorityDAO.save(authority);

              model.addAttribute("message", "Đăng ký thành công!");
              return "security/login";
          } else {
              model.addAttribute("message", "Đăng ký thất bại!");
              return "security/login";
          }}
      } catch (Exception e) {
          e.printStackTrace();
          model.addAttribute("message", "Đã xảy ra lỗi trong quá trình đăng ký!");
          return "security/login";
      }
  

  


   
  }



}