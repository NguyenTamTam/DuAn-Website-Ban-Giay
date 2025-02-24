package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.entity.Order;
import com.project.service.AccountService;
import com.project.service.OrderService;



@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	AccountService accountService;
	
	@RequestMapping("/order/checkout")
	public String checkout(Model model , HttpServletRequest request) {
		String username = request.getRemoteUser();
		model.addAttribute("accounts",accountService.findAccountByUsername(username));
		return "order/checkout";
	}
	
	@RequestMapping("/order/list")
	public String list(Model model, HttpServletRequest request) {
		String username =request.getRemoteUser();
		model.addAttribute("orders",orderService.findByUsername(username));
		return "order/list";
	}
	@RequestMapping("/order/detail/{id}")
	public String detail(@PathVariable("id")Long id ,Model model) {
		model.addAttribute("order",orderService.findById(id));
		return "order/detail";
	}
	
	@RequestMapping("/order/index")
	public String OrderManagement() {
		
		return "order/index";
	}
	@RequestMapping("/pay/momo/{id}")
	public String momo(@PathVariable("id")Long id ,Model model) {
		model.addAttribute("order",orderService.findById(id));
		return "pay/momo";
	}
	
	@RequestMapping("/pay/momo")
	public String momo2() {
		return "pay/momo";
	}
	
//	@GetMapping("/cart")
//    public String showCart(Model model) {
//        double totalPrice = orderService.getTotalPrice();
//        model.addAttribute("total_price", totalPrice);
//        return "cart/view";
//    }
	@RequestMapping("/pay/thanhtoan")
	public String thanhtoan1() {
		return "pay/thanhtoan";
	}
	
}
