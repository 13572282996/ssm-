package com.java.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.CommonUtils;
import com.java.utils.ResponseUtil;
import com.sun.corba.se.spi.protocol.RequestDispatcherRegistry;;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private AdminService adminService;

	public AdminService getAdminService() {
		return adminService;
	}

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;
	

	
	
	@RequestMapping("/login")
	public String Login(Admin admin) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			Admin a = adminService.Login(admin.getLogin());
			System.out.println(admin);
			if(a==null)
			{
				map.put("mgf", "用户不存在");
				map.put("success", false);
			}
			else if(!a.getPwd().equals(admin.getPwd()))
			{
				map.put("mgf", "密码错误");
				map.put("success", false);
			}
			else
			{
				request.getSession().setAttribute("admin", a);
				map.put("mgf", "验证通过!");
				map.put("success", true);
			}
		} catch (Exception e) {
			map.put("mgf", "错误："+e.getMessage());
			map.put("success", false);
		} 
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}

	
	@RequestMapping("/exit")
	public String Exit() {
		
		request.getSession().removeAttribute("admin");
			
		return "adminlogin";
	}
}