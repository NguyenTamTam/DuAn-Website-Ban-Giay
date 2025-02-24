package com.project.rest.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.project.entity.Authority;
import com.project.entity.Category;
import com.project.entity.Order;
import com.project.entity.OrderDetail;
import com.project.entity.Product;
import com.project.service.OrderDetailService;
import com.project.service.OrderService;

@CrossOrigin("*")
@RestController
//@RequestMapping("/rest/orders")
public class OrderRestController {
	@Autowired
	OrderService orderService;
	OrderDetailService orderDetailService;
	
	@GetMapping("/by-username/{username}")
    public List<Order> getOrdersByUsername(@PathVariable String username) {
        return orderService.getOrdersByUsername(username);
    }
	
	  @GetMapping("/rest/order")
	  public List<Order> getAllOrders() {
	    return orderService.findAll(); // Trả về danh sách tất cả đơn hàng từ cơ sở dữ liệu
	  }
	  @GetMapping("/rest/orderdetail")
	  public List<OrderDetail> getAllOrderDetails() {
	    return orderDetailService.findAll(); // Trả về danh sách tất cả đơn hàng từ cơ sở dữ liệu
	  }
	  
	@PostMapping("/rest/orders")
	public Order create(@RequestBody JsonNode orderData) {
		return orderService.create(orderData);
	}
	
	
	@PutMapping("/rest/orders{id}")
	public Order put(@PathVariable("id")Integer id,@RequestBody Order order) {
		return orderService.update(order);
	}
	
	@GetMapping()
	public List<Order> getorder(){
		return orderService.findAll();
	}

	@PutMapping("/rest/order/{id}")
	public Order take(@PathVariable("id")Integer id,@RequestBody Order order) {
		return orderService.update(order);
	}
	@DeleteMapping("{id}")
	public void delete(@PathVariable("id")Long id) {
		orderService.delete(id);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<String> deleteOrder(@PathVariable("id") Long id, Model model, HttpServletResponse response) {
	    orderService.delete(id);

	     return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
	}
}