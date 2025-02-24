package com.project.rest.controller;

import java.util.List;
import java.util.Optional;

import com.project.dao.AccountDAO;
import com.project.dao.AuthorityDAO;
import com.project.dao.RoleDAO;
import com.project.entity.Account;
import com.project.entity.Authority;
import com.project.entity.Role;
import com.project.service.AccountService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@CrossOrigin("*")
@RestController
public class AccountRestController {
	@Autowired
	AccountService accountService;
	@Autowired
	private RoleDAO roleDAO;
	@Autowired
	private AuthorityDAO authorityDAO;
	@Autowired
	  private AccountDAO accountDAO;
	  @Autowired
		BCryptPasswordEncoder pe;
	
	@GetMapping("/rest/accounts")
	public List<Account> getAccounts(@RequestParam("admin") Optional<Boolean> admin) {
	    if (admin.orElse(false)) {
	        return accountService.getAdministrators();
	    }
	    return accountService.findAll();
	}

	@GetMapping("/rest/cust")
	public List<Account> getCust(@RequestParam("cust") Optional<Boolean> cust) {
	    if (cust.orElse(false)) {
	        return accountService.getCust();
	    }
	    return accountService.findAll();
	}
	
	
	
	@PostMapping("/rest/cust")
    public Account createAccount(@RequestBody Account account) {
		  account.setPassword(pe.encode(account.getPassword()));
		accountDAO.save(account);
		 Role role = new Role();
		    role.setId("CUST");
		    role.setName("Khach hang");
		    roleDAO.save(role);
		    Authority authority = new Authority();
		    authority.setAccount(account);
		    authority.setRole(role);
		    authorityDAO.save(authority);
        return accountService.create (account);
    }

    @PutMapping("/rest/cust/{username}")
    public Account updateAccount(@RequestBody Account account) {
    	  account.setPassword(pe.encode(account.getPassword()));
        return accountService.update(account);
    }

    @DeleteMapping("/rest/cust/{username}")
    public void deleteAccount(@PathVariable("username") String username) {
        accountService.delete(username);
    }
    
    
    @GetMapping("/rest/staf")
	public List<Account> getstaf(@RequestParam("staf") Optional<Boolean> staf) {
	    if (staf.orElse(false)) {
	        return accountService.getstaf();
	    }
	    return accountService.findAll();
	}
    
    @PostMapping("/rest/staf")
    public Account createAccountSTAf(@RequestBody Account account) {
    	  account.setPassword(pe.encode(account.getPassword()));
		accountDAO.save(account);
		 Role role = new Role();
		    role.setId("STAF");
		    role.setName("Nhan Vien");
		    roleDAO.save(role);
		    Authority authority = new Authority();
		    authority.setAccount(account);
		    authority.setRole(role);
		    authorityDAO.save(authority);
        return accountService.create (account);
    }

    @PutMapping("/rest/staf/{username}")
    public Account updateAccountSTAF(@RequestBody Account account) {
    	  account.setPassword(pe.encode(account.getPassword()));
        return accountService.update(account);
    }
   

    @DeleteMapping("/rest/staf/{username}")
    public void deleteAccountSTAF(@PathVariable("username") String username) {


        accountService.delete(username);
    }
}
