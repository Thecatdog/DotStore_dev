package com.example.jpetstore.domain;

import lombok.Data;

@Data
public class OrderItem {
	private int orderid;
	private String itemid;
	
	public OrderItem(int orderId, String itemId) {
		this.orderid = orderId;
		this.itemid = itemId;
	}
}
