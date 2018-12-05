package com.java.dao;

import java.util.List;

import com.java.model.Shop;

public interface ShopMapper {
    int Del(Integer id);

    int Add(Shop record);

    int EditPass(Shop s);
    Shop GetByID(Integer id);

    int Edit(Shop record);

    int GetCount(Shop record);
    List<Shop> Get(Shop record);
}