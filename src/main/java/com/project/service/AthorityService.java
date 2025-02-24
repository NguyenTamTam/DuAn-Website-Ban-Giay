package com.project.service;

import java.util.List;

import com.project.entity.Authority;



public interface AthorityService {

	public List<Authority> findAuthoritiesOfAdministrators();
	
	public List<Authority> findAuthoritiescust();

	public List<Authority> findAll();
	
	public void delete(Integer id);

	public Authority create(Authority auth);

}