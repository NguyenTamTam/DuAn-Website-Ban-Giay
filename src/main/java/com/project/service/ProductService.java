package com.project.service;

import java.util.List;
import java.util.Optional;

import com.project.entity.Product;



public interface ProductService {

	List<Product> findAll();

	Product findById(Integer id);


	List<Product> findByCategoryId(Integer cid);

	Product create(Product product);

	Product update(Product product);

	void delete(Integer id);
	
	List<Product> findByKey(String key);

	
	List<Product> findProductsByPriceRange(double minPrice, double maxPrice);
	List<Product> findByKeyAndPrice(String key, double minPrice, double maxPrice);
	
	
	
}
