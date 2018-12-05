package com.java.service;



import java.util.List;

import com.java.model.*;

public interface ShopService {

	public int Add(Shop r);
	public int Edit(Shop r);
	public Shop GetByID(int id);
	public int Del(int id);
	public List<Shop> Get(Shop s);
	public int GetCount(Shop s);
	public int EditPass(Shop s);
}
