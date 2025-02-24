package com.project.rest.controller;

import java.util.List;

import com.project.entity.Account;
import com.project.entity.Category;
import com.project.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@CrossOrigin("*")
@RestController
@RequestMapping("/rest/categories")
public class CategoryRestController {
	@Autowired
	CategoryService categoryService;
	@GetMapping()
	public List<Category> getAll() {
		return categoryService.findAll();
	}
	
	@PostMapping()
	public Category createcate(@RequestBody Category category) {
		return categoryService.create(category);
	}
	
	@PutMapping("{id}")
	public Category updatecate(@RequestBody Category category) {
        return categoryService.update(category);
    }
	
	@DeleteMapping("{id}")
	public void deletecate(@PathVariable("id") Integer id) {
		categoryService.delete(id);
    }
}
