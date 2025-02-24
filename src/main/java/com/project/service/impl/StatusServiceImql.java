package com.project.service.impl;

import java.util.List;

import com.project.dao.StatusDAO;
import com.project.entity.Status;
import com.project.service.StatusService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class StatusServiceImql implements StatusService {
	@Autowired
	StatusDAO statusDAO;
	
	@Override
	public List<Status> findAll() {
		// TODO Auto-generated method stub
		return statusDAO.findAll();
	}

}
