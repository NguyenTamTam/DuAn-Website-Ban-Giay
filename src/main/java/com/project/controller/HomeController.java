package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping({"/","/home/index"})
	public String home() {
		return "redirect:/product/list_main";
	}
	@RequestMapping({"/admin","/admin/home/index"})
	public String admin() {
		return "redirect:/admin/index.html";
	}
	@RequestMapping("/home/gioithieu")
	public String gioithieu() {
		return "cart/gioithieu";
	}
	
	@RequestMapping("/feedback")
	public String feedback() {
		return "feedback/feedback";
	}
}
