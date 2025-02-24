package com.project.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.project.entity.Feedback;



public interface FeedbackDAO extends JpaRepository<Feedback, Integer> {
	
	

}
