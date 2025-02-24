package com.project.service.impl;

import java.util.List;

import com.project.dao.AccountDAO;
import com.project.dao.AuthorityDAO;
import com.project.entity.Account;
import com.project.entity.Authority;
import com.project.service.AthorityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AthorityServiceImql  implements AthorityService {
	@Autowired
	AuthorityDAO dao;
	@Autowired
	AccountDAO acdao;

	@Override
	public List<Authority> findAuthoritiesOfAdministrators() {
		// TODO Auto-generated method stub
		List<Account> accounts =acdao.getAdministrators();
		return dao.authritiesOf(accounts);
	}
	
	public List<Authority> 	findAuthoritiescust() {
		// TODO Auto-generated method stub
		List<Account> accounts =acdao.getCust();
		return dao.authritiesOf(accounts);
	}

	@Override
	public List<Authority> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		dao.deleteById(id);
	}

	@Override
	public Authority create(Authority auth) {
		// TODO Auto-generated method stub
		return dao.save(auth);
	}
	
}