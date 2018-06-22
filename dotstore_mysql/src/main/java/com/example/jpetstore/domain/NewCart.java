package com.example.jpetstore.domain;

import lombok.Data;

@Data
public class NewCart {
	private String itemId;
	private String username;
	private int price;
	
	public NewCart(String itemId, String username, int price) {
		this.itemId = itemId;
		this.username = username;
		this.price = price;
	}
}
