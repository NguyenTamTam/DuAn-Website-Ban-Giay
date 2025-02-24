package com.project.service;

import java.util.List;
import java.util.Optional;

import com.project.entity.Account;



public interface AccountService {
	public Account findById(String username);
	
	public List<Account> getAdministrators();
	
	public List<Account> getCust();
	
	public List<Account> getstaf();

	 List<Account> findAll();
	
	 Account create(Account account);
	 
	 Account update(Account account);
	 
	 void delete(String username);
	 
	 Account findByUsername(String username);
	 List<Account> findAccountByUsername(String username);
//	Account findById2(String username, String email, String fullname);

//	public List<Account> saveRegistration();
}