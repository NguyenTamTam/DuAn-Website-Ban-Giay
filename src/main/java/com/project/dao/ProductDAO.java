package com.project.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.project.entity.Product;



public interface ProductDAO extends JpaRepository<Product, Integer>{
	@Query("SELECT p FROM Product p WHERE p.category.id=?1")
	List<Product> findByCategoryId(Integer cid);
	
	// Tìm kiếm Product
		@Query("SELECT o FROM Product o WHERE o.available LIKE 1 AND (o.name LIKE '%' + ?1 + '%')")
		List<Product> findByKey(String key);
		
		@Query("SELECT p FROM Product p WHERE p.available = 1 AND p.name LIKE %:key% AND p.price >= :minPrice AND p.price <= :maxPrice")
	    List<Product> findByKeyAndPrice(String key, double minPrice, double maxPrice);
		
		
		
		
		// Tìm kiếm theo giá
//
//		@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
//		List<Product> findByPrice(double minPrice, double maxPrice);
//	    List<Product> findByPriceBetween(double minPrice,double maxPrice);
	    
//		@Query("SELECT p FROM Product p WHERE p.category.id = :cateid"
//			    + " AND p.name LIKE %:key%"
//			    + " AND p.price >= :minPrice"
//			    + " AND p.price <= :maxPrice")
//			List<Product> findByKeyAndPrice(@Param("key") String key, @Param("minPrice") double minPrice,
//			    @Param("maxPrice") double maxPrice, @Param("cateid") Long cateid);
}
