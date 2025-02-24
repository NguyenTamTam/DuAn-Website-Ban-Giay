package com.project.service.impl;

import java.util.List;
import java.util.Optional;

import com.project.dao.AccountDAO;
import com.project.entity.Account;
import com.project.service.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AccountServiceImql implements AccountService {
	@Autowired
	AccountDAO dao;

	@Override
	public Account findById(String username) { 
		return dao.findById(username).get();
	}

	
	@Override
	public List<Account> getAdministrators() {
		return dao.getAdministrators();
	}
	
	@Override
	public List<Account> getCust() {
		return dao.getCust();
	}
	
	@Override
	public List<Account> getstaf() {
		return dao.getstaf();
	}

	
	@Override
    public List<Account> findAll() {
        return dao.findAll();
    }
	
	 @Override
	    public Account create(Account account) {
	        return dao.save(account);
	    }

	    @Override
	    public Account update(Account account) {
	        return dao.save(account);
	    }

	    @Override
	    public void delete(String username) {
	        dao.deleteById(username);
	    }
	
	 @Override
	    public Account findByUsername(String username) {
	        Optional<Account> optionalAccount = dao.findByUsername(username);
	        return optionalAccount.orElse(null);
	    }


	@Override
	public List<Account> findAccountByUsername(String username) {
		// TODO Auto-generated method stub
		return dao.findAccountByUsername(username);
	}
	 

}