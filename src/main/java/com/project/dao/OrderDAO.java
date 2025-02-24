package com.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.entity.Order;



public interface OrderDAO extends JpaRepository<Order, Long>{
	List<Order> findByAccount_Username(String username);
	
	@Query("SELECT o FROM Order o WHERE o.account.username=?1")
	List<Order> findByUsername(String username);
	
	@Query("SELECT o FROM Order o WHERE o.status.status=?1")
	List<Order> findByStatus(String status);

}
