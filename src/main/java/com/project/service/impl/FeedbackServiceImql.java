package com.project.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.dao.FeedbackDAO;
import com.project.dao.ProductDAO;
import com.project.entity.Feedback;
import com.project.entity.Order;
import com.project.entity.OrderDetail;
import com.project.entity.Product;
import com.project.service.FeedbackService;
import com.project.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class FeedbackServiceImql implements FeedbackService {
	@Autowired
	FeedbackDAO fdao;

	@Override
	public List<Feedback> findAll() {
		
		return fdao.findAll();
	}
	@Override
	public Feedback create(JsonNode feedbackData) {
		ObjectMapper mapper= new ObjectMapper();
		Feedback feedback = mapper.convertValue(feedbackData, Feedback.class);
		fdao.save(feedback);
		
		return feedback;
		
	}
}	
