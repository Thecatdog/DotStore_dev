package com.example.jpetstore.controller;

import com.example.jpetstore.domain.P2PItem;

import lombok.Data;

@Data
@SuppressWarnings("serial")
public class P2PForm {
	private P2PItem p2pItem;
	
	public P2PForm(P2PItem p2pItem) {
		this.p2pItem = p2pItem;
	}
	
	public P2PForm() {
		this.p2pItem = new P2PItem();
	}
	
	public P2PItem getP2PItem() {
		return this.p2pItem;
	}
}
