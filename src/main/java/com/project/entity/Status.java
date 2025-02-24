package com.project.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Status")
public class Status implements Serializable{
	@Id
	String	id;
	String status;
	
	@JsonIgnore
    @OneToMany(mappedBy = "status")
    private List<Order> orders; // Renamed from "order" to "orders" to better reflect the relationship
	
}
