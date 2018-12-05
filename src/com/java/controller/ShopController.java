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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.CommonUtils;
import com.java.utils.ResponseUtil;;

@Controller
@RequestMapping("/shop")
public class ShopController {
	private ShopService shopService;

	public ShopService getShopService() {
		return shopService;
	}

	@Autowired
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	@SuppressWarnings("finally")
	@RequestMapping("/addpage")
	public String add() {
		return "admin/addshop";
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("/pwdpage")
	public String pwdpage() {
		return "shop/pwd";
	}
	
	@RequestMapping("/exit")
	public String Exit() {
		
		request.getSession().removeAttribute("shop");
			
		return "adminlogin";
	}
	
	@RequestMapping("/editpage")
	public String GetByID() {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			Shop r = shopService.GetByID(id);
			request.setAttribute("shop", r);
			return "admin/addshop";
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping("/shop_editpage")
	public String ShopEdit() {
		try {
			Shop shop=(Shop)request.getSession().getAttribute("shop");
			Shop r = shopService.GetByID(shop.getId());
			request.setAttribute("shop", r);
			return "shop/edit";
		} catch (Exception e) {
			return null;
		}
	}
	
	
	@RequestMapping("/login")
	public String Login() {
		Map<String,Object> map = new HashMap<String,Object>();
		int id=0;
		try{
			id=Integer.parseInt(request.getParameter("login"));
		}
		catch(Exception e) {
			map.put("mgf", "用户不存在");
			map.put("success", false);
			String result = new JSONObject(map).toString();
			ResponseUtil.write(response, result);
			return null;
		}
		
		try {
			Shop a = shopService.GetByID(id);
			System.out.println(a);
			if(a==null)
			{
				map.put("mgf", "用户不存在");
				map.put("success", false);
			}
			else if(!a.getPwd().equals(request.getParameter("pwd")))
			{
				map.put("mgf", "密码错误");
				map.put("success", false);
			}
			else
			{
				request.getSession().setAttribute("shop", a);
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
	
	@SuppressWarnings("finally")
	@RequestMapping("/pwd")
	public String EditPass() {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			Shop shop=(Shop)request.getSession().getAttribute("shop");
			shop.setPwd(request.getParameter("pwd"));
			int r=shopService.EditPass(shop);
			if(r>0)
			{
				map.put("mgf", "密码修改成功，下次请用新密码登陆");
				map.put("success", true);
				request.getSession().setAttribute("shop", shop);
			}
			else
			{
				map.put("mgf", "密码修改失败");
				map.put("success", false);
			}
		} catch (Exception e) {
			map.put("mgf", "错误："+e.getMessage());
			map.put("success", false);
		} 
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("/add")
	public String add(Shop s) {
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println(s);
			int count=0;
			if(s.getId()==null)
				count = shopService.Add(s);
			else
				count=shopService.Edit(s);
			if(count>0)
			{
				map.put("mgf", "操作成功");
				map.put("success", true);
			}
			else
			{
				map.put("mgf", "操作失败");
				map.put("success", false);
			}
		} catch (Exception e) {
			map.put("mgf", "错误："+e.getMessage());
			map.put("success", false);
		} 
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}

	@RequestMapping("/admin_list")
	public String Get(Shop s) {
		try {
			List<Shop> list = shopService.Get(s);
			System.out.println(list);
			request.setAttribute("list", list);
			return "admin/shop";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	@RequestMapping("/web_list")
	public String web_list(Shop s) {
		try {
			List<Shop> list = shopService.Get(s);
			System.out.println(list);
			request.setAttribute("list", list);
			return "shop";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("/del")
	public String Del(int id) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println("================================");
			System.out.println(id);
			//int id=Integer.parseInt(request.getParameter("id"));
			
			int r = shopService.Del(id);
			
			if(r>0)
			{
				map.put("mgf", "删除成功");
				map.put("success", true);
			}
			else
			{
				map.put("mgf", "删除失败");
				map.put("success", false);
			}
		} catch (Exception e) {
			map.put("mgf", "错误："+e.getMessage());
			map.put("success", false);
		} 
		String result = new JSONObject(map).toString();
		ResponseUtil.write(response, result);
		return null;
	}
	
	
}