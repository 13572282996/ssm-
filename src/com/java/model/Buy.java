package com.java.model;

import java.util.Date;

public class Buy {
    private Integer id;

    private Integer clientId;

    private Integer thingId;

    private Date intime;

    private Integer num;

    private Integer state;
    private Client client;
    private Thing thing;
    private int shopId; 
    private String stateText;
    private Pages page;
    public Pages getPage() {
		return page;
	}

	public void setPage(Pages page) {
		this.page = page;
	}

	String[] states = { "<span style='color:blue'>待处理</span>", "<span style='color:Green'>交易成功</span>" };
    public String getStateText() {
		return states[state];
	}

	public void setStateText(String stateText) {
		this.stateText = stateText;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Thing getThing() {
		return thing;
	}

	public void setThing(Thing thing) {
		this.thing = thing;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getThingId() {
        return thingId;
    }

    public void setThingId(Integer thingId) {
        this.thingId = thingId;
    }

    public Date getIntime() {
        return intime;
    }

    public void setIntime(Date intime) {
        this.intime = intime;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}