package com.example.jpetstore.controller;

import com.example.jpetstore.domain.Item;

import lombok.Data;

@Data
@SuppressWarnings("serial")
public class C2PForm {
	private Item c2pItem;
	
	public C2PForm(Item c2pItem) {
		this.c2pItem = c2pItem;
	}
	
	public C2PForm() {
		this.c2pItem = new Item();
	}
	
	public Item getC2PItem() {
		return this.c2pItem;
	}

}
