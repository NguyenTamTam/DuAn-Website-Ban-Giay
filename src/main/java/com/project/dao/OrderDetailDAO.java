package com.project.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.entity.Order;
import com.project.entity.OrderDetail;
import com.project.entity.Product;




public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long>{
	void deleteByProduct(Product product);
	
	@Query("SELECT o FROM Order o WHERE o.status.status=?1")
	List<OrderDetail> findBy(String status);
}
