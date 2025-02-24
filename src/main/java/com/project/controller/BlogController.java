package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BlogController {
	
	@RequestMapping("/news/index")
	public String blog(){
		return ("news/index");
	}
	
	@RequestMapping("/news1/index")
	public String blog1(){
		return ("news/news1");
	}
	
	@RequestMapping("/news2/index")
	public String blog2(){
		return ("news/news2");
	}
	
	@RequestMapping("/news3/index")
	public String blog3(){
		return ("news/news3");
	}
	
	@RequestMapping("/news4/index")
	public String blog4(){
		return ("news/news4");
	}
}
