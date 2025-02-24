package com.project.rest.controller;

import java.util.List;
import java.util.Optional;

import com.project.entity.Authority;
import com.project.service.AthorityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@CrossOrigin("*")
@RestController
@RequestMapping("/rest/authorities")
public class AthorityRestController {
	@Autowired
	AthorityService athorityService;
	
	@GetMapping
	public List<Authority> findAll(
	        @RequestParam(name = "admin", required = false) Optional<Boolean> admin,
	        @RequestParam(name = "cust", required = false) Optional<Boolean> cust) {
	    if (admin.orElse(false)) {
	        return athorityService.findAuthoritiesOfAdministrators();
	    } else if (cust.orElse(false)) {
	        return athorityService.findAuthoritiescust();
	    } else {
	        return athorityService.findAll();
	    }
	}
	
	
	@PostMapping
	public Authority post(@RequestBody Authority auth) {
		return athorityService.create(auth);
	}
	@DeleteMapping("{id}")
	public void delete(@PathVariable("id")Integer id) {
		athorityService.delete(id);
	}
}