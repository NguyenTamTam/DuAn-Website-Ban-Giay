package com.project.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.project.entity.Feedback;
import com.project.entity.Order;
import com.project.service.FeedbackService;
import com.project.service.OrderService;


@CrossOrigin("*")
@RestController
@RequestMapping("/rest/feedback")
public class FeedbackRestController {
	@Autowired
	FeedbackService feedbackService;
	
	@PostMapping()
	public Feedback create(@RequestBody JsonNode feedbackData) {
		return feedbackService.create(feedbackData);
	}
	@GetMapping()
	public List<Feedback> getAll() {
		return feedbackService.findAll();
	}
	
}
