package com.project.service.impl;


import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.dao.OrderDAO;
import com.project.dao.OrderDetailDAO;
import com.project.dao.ProductDAO;
import com.project.entity.Order;
import com.project.entity.OrderDetail;
import com.project.entity.Product;
import com.project.service.OrderDetailService;
import com.project.service.OrderService;


@Service
public class OrderDetailServiceImql implements OrderDetailService {
	@Autowired
	OrderDAO odao;
	@Autowired
	OrderDetailDAO ddao;
	

	    
		@Override
		public List<OrderDetail> findAll() {
			// TODO Auto-generated method stub
			return ddao.findAll();
		}

}