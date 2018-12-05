package com.java.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.java.model.*;
import com.java.service.*;
import com.java.utils.CommonUtils;

@Controller
/*@RequestMapping("/line")*/
public class indexController {
	@Autowired
	private IntroduceService introduceService;
	@Autowired
	private ThingService thingService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private ThingTypeService thingtypeService;
	@Autowired
	private NewsTypeService newstypeService;
	@Autowired
	private ThingType2Service thingtype2Service;
	@Autowired
	private HttpServletRequest request;

	/**
	 * 用户首页
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index(Model model){
		Pages p=new Pages();
		p.setPagesize(6);
		Thing t=new Thing();
		t.setPage(p);

		List<Thing> thing = thingService.Get(t);
		Introduce intr = introduceService.GetByID(1);
		model.addAttribute("thing", thing);
		model.addAttribute("intr", intr);
		request.getSession().setAttribute("menu", newstypeService.Get());
		/*request.getSession().setAttribute("client", clientService.GetByID(6));*/
		request.getSession().setAttribute("left_thingtype2", thingtype2Service.Get());
		request.getSession().setAttribute("thingtype", thingtypeService.Get());
		return "index";
		
	}
}