package com.example.jpetstore.controller;

import java.io.Serializable;

import com.example.jpetstore.domain.AuctionItem;

import lombok.Data;

@Data
@SuppressWarnings("serial")
public class AuctionForm implements Serializable {

private AuctionItem auction;

public AuctionForm(AuctionItem auction) {
this.auction = auction;
}

public AuctionForm() {
this.auction = new AuctionItem();
}

public AuctionItem getAuction() {
// TODO Auto-generated method stub
return auction;
}

}