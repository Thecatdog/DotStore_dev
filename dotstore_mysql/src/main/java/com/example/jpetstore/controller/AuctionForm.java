package com.example.jpetstore.controller;

import java.io.Serializable;

import com.example.jpetstore.domain.Auction;

@SuppressWarnings("serial")
public class AuctionForm implements Serializable {

	private Auction auction;

//	private boolean newAccount;

	public AuctionForm(Auction auction) {
		this.auction = auction;
//		this.newAccount = false;
	}

	public AuctionForm() {
		this.auction = new Auction();
//		this.newAccount = true;
	}

	public Auction getAuction() {
		return auction;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

}
