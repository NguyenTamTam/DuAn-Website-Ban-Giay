package com.project.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.entity.Role;



public interface RoleDAO extends JpaRepository<Role, String> {

}
