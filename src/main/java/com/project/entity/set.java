package com.project.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
public class set {
	@Id	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String sum;
	String image;
}
