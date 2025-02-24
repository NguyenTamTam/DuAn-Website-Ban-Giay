package com.project.service.impl;

import java.util.List;

import com.project.dao.RoleDAO;
import com.project.entity.Role;
import com.project.service.RoleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class RoleServiceImql implements RoleService {
	@Autowired
	RoleDAO dao;
	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

}
