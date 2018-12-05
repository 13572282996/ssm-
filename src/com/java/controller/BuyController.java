package com.java.controller;

import java.util.ArrayList;
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
@RequestMapping("/buy")
public class BuyController {
	private BuyService buyService;

	public BuyService getBuyService() {
		return buyService;
	}
	@Autowired
	private ThingTypeService thingtypeService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private ThingType2Service thingtype2Service;
	@Autowired
	public void setBuyService(BuyService buyService) {
		this.buyService = buyService;
	}
	@Autowired
	private ThingService thingService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpServletResponse response;

	@SuppressWarnings({ "finally", "unchecked" })
	@RequestMapping("/buying")
	public String buying(Thing t) {
		if(request.getSession().getAttribute("client")==null)
			return Util.SetMap("您尚未登陆", false, response);
		List<Buy> l=null;
		if(request.getSession().getAttribute("buying")==null)
			l=new ArrayList<Buy>();
		else
		{
			l=(List<Buy>)request.getSession().getAttribute("buying");
			for(int i=0;i<l.size();i++)
				if(l.get(i).getThingId()==t.getId())
					return Util.SetMap("该商口已存在购物车", false, response);
		}
		Thing thing=thingService.GetByID(t.getId());
		Buy b=new Buy();
		b.setThing(thing);
		b.setThingId(thing.getId());
		l.add(b);
		
		request.getSession().setAttribute("buying", l);
		return Util.SetMap("成功加入购物车", true, response);
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/getbuying")
	public String getbuying(Model m) {
		List<Buy> l=null;
		if(request.getSession().getAttribute("buying")==null)
			l=new ArrayList<Buy>();
		else
			l=(List<Buy>)request.getSession().getAttribute("buying");
		int sum=0;
		for(int i=0;i<l.size();i++)
			sum+=l.get(i).getThing().getPrice();
		m.addAttribute("buying",l);
		m.addAttribute("sum",sum);
		return "buying";
	}
	
	@SuppressWarnings({ "finally", "unchecked" })
	@RequestMapping("/delbuying")
	public String delbuying(int tid) {
		List<Buy> l=null;
		if(request.getSession().getAttribute("buying")==null)
			l=new ArrayList<Buy>();
		else
			l=(List<Buy>)request.getSession().getAttribute("buying");
		int sum=0;
		for(int i=0;i<l.size();i++)
			if(l.get(i).getThingId()==tid)
				l.remove(i);
			else
				sum+=l.get(i).getThing().getPrice();
		request.getSession().setAttribute("buying", l);
		request.setAttribute("list",l);
		request.setAttribute("sum",sum);
		return Util.SetMap("移除成功", true, response);
	}


	@SuppressWarnings("finally")
	@RequestMapping("/state")
	public String state(Buy b) {
		b.setState(1);
		int count=buyService.EditState(b);
		if(count>0)
			return Util.SetMap("成功送出", true, response);
		else
			return Util.SetMap("操作失败", false, response);
	}
	
	@SuppressWarnings("finally")
	@RequestMapping("/add")
	public String add() {
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(request.getSession().getAttribute("buying")==null)
			return Util.SetMap("您的购物车中无任何商品", false, response);
		List<Buy> l=(List<Buy>)request.getSession().getAttribute("buying");
		Client c=(Client)request.getSession().getAttribute("client");
		
		try {
			int count=0;
			for(int i=0;i<l.size();i++)
			{
				l.get(i).setClientId(c.getId());
				count+=buyService.Add(l.get(i));
			}
			if(count==l.size())
			{
				request.getSession().removeAttribute("buying");
				return Util.SetMap("下单成功", true, response);
			}
			else
				return Util.SetMap("下单失败", false, response);
		} catch (Exception e) {
			return Util.SetMap(e.getMessage(), false, response);
		} 
	}
	
	@RequestMapping("/my_list")
	public String Get(Buy b) {
		Client c=(Client)request.getSession().getAttribute("client");
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(6);//每页显示数量 
		p.setOrder("id desc");
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		b.setPage(p);
		b.setClientId(c.getId());
		try {
			List<Buy> list = buyService.Get(b);
			for(int i=0;i<list.size();i++)
			{
				Thing t=thingService.GetByID(list.get(i).getThingId());
//				ThingType tt=thingtypeService.GetByID(list.get(i).getThingtypeId());
//				ThingType2 tt2=thingtype2Service.GetByID(list.get(i).getThingtype2Id());
//				list.get(i).setThingtype(tt);
//				list.get(i).setThingtype2(tt2);
				list.get(i).setThing(t);
			}
			System.out.println(list);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request,"buy/my_list.do", buyService.GetCount(b), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			return "mybuy";
		} catch (Exception e) {
			return null;
		}
		
	}
	
	@RequestMapping("/shop_list")
	public String shop_list(Buy b) {
		Shop s=(Shop)request.getSession().getAttribute("shop");
		//分页参数设置
		Pages p=new Pages();
		p.setPagesize(6);//每页显示数量 
		int startindex=request.getParameter("startindex")==null?0:Integer.parseInt(request.getParameter("startindex"));//起始页，默认从第1页开始读
		p.setStartindex(startindex);
		b.setPage(p);
		b.setShopId(s.getId());
		try {
			List<Buy> list = buyService.Get(b);
			for(int i=0;i<list.size();i++)
			{
				Thing t=thingService.GetByID(list.get(i).getThingId());
				Client c=clientService.GetByID(list.get(i).getClientId());
//				ThingType tt=thingtypeService.GetByID(list.get(i).getThingtypeId());
//				ThingType2 tt2=thingtype2Service.GetByID(list.get(i).getThingtype2Id());
//				list.get(i).setThingtype(tt);
//				list.get(i).setThingtype2(tt2);
				list.get(i).setThing(t);
				list.get(i).setClient(c);
			}
			System.out.println(list);
			request.setAttribute("list", list);
			//分页
			request.setAttribute("pages", PageList.Page(request,"buy/shop_list.do", buyService.GetCount(b), 
					p.getPagesize(), p.getStartindex(),request.getQueryString()));
			return "shop/ding";
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
		
	}

	
	@SuppressWarnings("finally")
	@RequestMapping("/del")
	public String Del(int id) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		Buy b=buyService.GetByID(id);
		if(b.getState()>0)
		{
			map.put("mgf", "该订单已送货或已过期，拒绝退订");
			map.put("success", false);
			String result = new JSONObject(map).toString();
			ResponseUtil.write(response, result);
			return null;
		}
		try {
			System.out.println("================================");
			System.out.println(id);
			//int id=Integer.parseInt(request.getParameter("id"));
			
			int r = buyService.Del(id);
			
			if(r>0)
			{
				map.put("mgf", "退单成功");
				map.put("success", true);
			}
			else
			{
				map.put("mgf", "退单失败");
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