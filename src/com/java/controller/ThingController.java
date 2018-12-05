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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.CommonUtils;
import com.java.utils.PageList;
import com.java.utils.ResponseUtil;;

@Controller
@RequestMapping("/thing")
public class ThingController {
	private ThingService thingService;

	public ThingService getThingService() {
		return thingService;
	}

	@Autowired
	public void setThingService(ThingService thingService) {
		this.thingService = thingService;
	}
	@Autowired
	private ThingTypeService thingtypeService;
	@Autowired
	private PingLunService pinglunService;
	@Autowired
	private ThingType2Service thingtype2Service;
	@Autowired
	private ShopService shopService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	@SuppressWarnings("finally")
	@RequestMapping("/addpage")
	public String add(Model m) {
		m.addAttribute("thingtype",thingtypeService.Get());
		m.addAttribute("thingtype2",thingtype2Service.Get());
		return "shop/addthing";
	}
	
	@RequestMapping("/editpage")
	public String Edit(Model m) {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			Thing r = thingService.GetByID(id);
			m.addAttribute("thing",r);
			m.addAttribute("thingtype",thingtypeService.Get());
			m.addAttribute("thingtype2",thingtype2Service.Get());
			return "shop/addthing";
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping("/show")
	public String show(Model m) {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			Thing r = thingService.GetByID(id);

				ThingType tt=thingtypeService.GetByID(r.getThingtypeId());
				ThingType2 tt2=thingtype2Service.GetByID(r.getThingtype2Id());
				Shop s=shopService.GetByID(r.getShopId());
				
				r.setShop(s);
				r.setThingtype(tt);
				r.setThingtype2(tt2);
			m.addAttribute("thing",r);
			m.addAttribute("pinglun_list",pinglunService.GetByThingID(id));
			return "thingshow";
		} catch (Exception e) {
			return null;
		}
	}
	
	

	
	@SuppressWarnings("finally")
	@RequestMapping("/add")
	public String add(Thing s) {
		Shop shop=(Shop)request.getSession().getAttribute("shop");
		s.setShopId(shop.getId());
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			System.out.println(s);
			int count=0;
			if(s.getId()==null)
				count = thingService.Add(s);
			else
				count=thingService.Edit(s);
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

	@RequestMapping("/shop_list")
	public String Get(Thing h) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(10);//每页显示数量 
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		h.setPage(p);
		Shop shop=(Shop)request.getSession().getAttribute("shop");
		h.setShopId(shop.getId());
		try {
			List<Thing> list = thingService.Get(h);
			for(int i=0;i<list.size();i++)
			{
				ThingType tt=thingtypeService.GetByID(list.get(i).getThingtypeId());
				ThingType2 tt2=thingtype2Service.GetByID(list.get(i).getThingtype2Id());
				list.get(i).setThingtype(tt);
				list.get(i).setThingtype2(tt2);
			}
			System.out.println(list);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request,"thing/shop_list.do", thingService.GetCount(h), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			return "shop/thing";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/web_list")
	public String web_list(Thing h) {
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(10);//每页显示数量 
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		h.setPage(p);
		try {
			List<Thing> list = thingService.Get(h);
			for(int i=0;i<list.size();i++)
			{
				ThingType tt=thingtypeService.GetByID(list.get(i).getThingtypeId());
				ThingType2 tt2=thingtype2Service.GetByID(list.get(i).getThingtype2Id());
				Shop s=shopService.GetByID(list.get(i).getShopId());
				list.get(i).setShop(s);
				list.get(i).setThingtype(tt);
				list.get(i).setThingtype2(tt2);
			}
			System.out.println(list);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request,"thing/web_list.do", thingService.GetCount(h), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			return "thing";
		} catch (Exception e) {
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
			
			int r = thingService.Del(id);
			
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