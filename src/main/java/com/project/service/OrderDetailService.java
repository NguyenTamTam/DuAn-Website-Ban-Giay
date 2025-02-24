package com.project.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.project.entity.Order;
import com.project.entity.OrderDetail;
import com.project.entity.Product;


public interface OrderDetailService {



	List<OrderDetail> findAll();

	
//	double getTotalPrice();

}