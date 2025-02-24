package com.project.service;

import java.util.List;


import com.project.entity.Category;



public interface CategoryService {

	List<Category> findAll();

	Category create(Category  category );
	 
	Category update(Category  category);
	 
	 void delete(Integer id);

}
