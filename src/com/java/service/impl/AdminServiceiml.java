package com.java.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.*;
import com.java.model.*;
import com.java.service.AdminService;
@Service("AdminService")
public class AdminServiceiml implements AdminService {

	private AdminMapper adminMapper;

	public AdminMapper getAddMapper() {
		return adminMapper;
	}
	@Autowired
	public void setAddMapper(AdminMapper adminMapper) {
		this.adminMapper = adminMapper;
	}
	
	@Override
	public Admin Login(String login) {
		return adminMapper.Login(login);
	}


}
