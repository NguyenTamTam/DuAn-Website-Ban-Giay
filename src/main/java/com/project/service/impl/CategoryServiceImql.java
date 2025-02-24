package com.project.service.impl;

import java.util.List;

import com.project.dao.CategoryDAO;
import com.project.entity.Account;
import com.project.entity.Category;
import com.project.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CategoryServiceImql implements CategoryService {
	@Autowired
	CategoryDAO cdao;
	
	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return cdao.findAll();
	}
	
	@Override
    public Category create(Category category) {
        return cdao.save(category);
    }

    @Override
    public Category update(Category category) {
        return cdao.save(category);
    }

    @Override
    public void delete(Integer id) {
        cdao.deleteById(id);
    }

}
