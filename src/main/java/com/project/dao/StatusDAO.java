package com.project.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.entity.Status;



public interface StatusDAO  extends JpaRepository<Status, Integer>{

}
