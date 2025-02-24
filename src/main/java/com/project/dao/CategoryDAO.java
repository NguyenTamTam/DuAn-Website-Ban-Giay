package com.project.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.entity.Category;



public interface CategoryDAO  extends JpaRepository<Category, Integer>{

}
