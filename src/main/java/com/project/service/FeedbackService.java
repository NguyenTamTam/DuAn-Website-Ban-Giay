package com.project.service;

import java.util.List;
import java.util.Optional;

import com.fasterxml.jackson.databind.JsonNode;
import com.project.entity.Feedback;
import com.project.entity.Order;
import com.project.entity.Product;



public interface FeedbackService {

	List<Feedback> findAll();
	
	Feedback create(JsonNode feedbackData);

	
	
	
	
}
