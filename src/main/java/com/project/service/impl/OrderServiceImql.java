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
import com.project.service.OrderService;


@Service
public class OrderServiceImql implements OrderService {
	@Autowired
	OrderDAO odao;
	@Autowired
	OrderDetailDAO ddao;
	@Override
	public Order create(JsonNode orderData) {
		ObjectMapper mapper= new ObjectMapper();
		Order order = mapper.convertValue(orderData, Order.class);
		odao.save(order);
		TypeReference<List<OrderDetail>> type =new TypeReference<List<OrderDetail>>() {};
		List<OrderDetail> details=mapper.convertValue(orderData.get("orderDetails"),type )
				.stream().peek(d ->d.setOrder(order)).collect(Collectors.toList());
		ddao.saveAll(details);
		return order;
		
	}
	@Override
	public Order findById(Long id) {
		// TODO Auto-generated method stub
		return odao.findById(id).get();
	}
	@Override
	public List<Order> findByUsername(String username) {
		// TODO Auto-generated method stub
		return odao.findByUsername(username);
	}
	
	// Tính tổng
		@Autowired
	    public OrderServiceImql(OrderDetailDAO ddao) {
	        this.ddao = ddao;
	    }

	    public void addItem(OrderDetail item) {
	        ddao.save(item);
	    }
		@Override
		public List<Order> findAll() {
			// TODO Auto-generated method stub
			return odao.findAll();
		}
		@Override
		public Order update(Order order) {
			// TODO Auto-generated method stub
			return odao.save(order);
		}
		

		
		
		@Override
	    @Transactional
	    public void delete(Long id) {
	        Order order = odao.findById(id).orElse(null);
	        if (order != null) {
	            odao.deleteById(id);
	        }
	    }
//	    public double getTotalPrice() {
//	        return ddao.getTotalPrice();
//	    }
		@Override
		public List<Order> getOrdersByUsername(String username) {
			return odao.findByAccount_Username(username);
		}
}