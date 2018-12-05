package com.java.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dao.*;
import com.java.model.*;
import com.java.service.ShopService;
@Service("ShopService")
public class ShopServiceiml implements ShopService {

	private ShopMapper shopMapper;

	public ShopMapper getAddMapper() {
		return shopMapper;
	}
	@Autowired
	public void setAddMapper(ShopMapper shopMapper) {
		this.shopMapper = shopMapper;
	}
	
	@Override    
	public int Edit(Shop shop) {
		return shopMapper.Edit(shop);
	}
	
	@Override    
	public int EditPass(Shop shop) {
		return shopMapper.EditPass(shop);
	}
	
	@Override
	public Shop GetByID(int id) {
		return shopMapper.GetByID(id);
	}
	
	@Override
	public int Add(Shop shop) {
		return shopMapper.Add(shop);
	}
	
	@Override
	public int Del(int id) {
		int result = shopMapper.Del(id);
		return result;
	}

	@Override
	public List<Shop> Get(Shop shop) {
		return shopMapper.Get(shop);
	}
	
	@Override
	public int GetCount(Shop shop) {
		return shopMapper.GetCount(shop);
	}

}
