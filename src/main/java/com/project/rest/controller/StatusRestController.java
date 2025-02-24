package com.project.rest.controller;

import java.util.List;

import com.project.entity.Category;
import com.project.entity.Status;
import com.project.service.CategoryService;
import com.project.service.StatusService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@CrossOrigin("*")
@RestController
@RequestMapping("/rest/Status")
public class StatusRestController {
	@Autowired
	StatusService   statusService;
	@GetMapping()
	public List<Status> getAll() {
		return statusService.findAll();
	}
	
}
