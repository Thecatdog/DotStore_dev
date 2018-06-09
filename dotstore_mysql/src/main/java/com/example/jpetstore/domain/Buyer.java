package com.example.jpetstore.domain;

import lombok.Data;

@Data
public class Buyer {
	private String username;
	private String itemId;
	private int listprice;
	
//	public Buyer(String username, String itemId) {
//		this.username = username;
//		this.itemId = itemId;
//	}
//
//	public Buyer() {
//	}
}
