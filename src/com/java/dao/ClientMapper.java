package com.java.dao;

import java.util.List;

import com.java.model.*;

public interface ClientMapper {

	int Add(Client client);
	int Edit(Client client);
	int Del(int id);
	Client GetByID(int id);
	Client Login(String login);
	int EditPass(Client client);
	List<Client> Get(Client c);
	int GetCount(Client c);
}