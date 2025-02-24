package com.project.entity;

import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Feedback")
public class Feedback implements Serializable {
	@Id	
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String fullname;
	String email;
	String phone_number;
	String	subject_name;
	String note;
}
