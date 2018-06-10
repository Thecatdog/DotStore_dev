package com.example.jpetstore.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Buyer;

@Service
public class AuctionService {
	@Autowired
	private AuctionMapper auctionMapper;

	@Transactional
	public void insert(AuctionItem auction) {
		auctionMapper.insertAuction(auction);
	}
	
	@Transactional
	public void insertBuyer(Buyer buyer) {
		auctionMapper.insertBuyer(buyer);
		auctionMapper.updateAuctionBuyer(buyer);
	}
	
	@Transactional
	public void deleteBuyer(Buyer buyer, String itemId) {
		//입찰 지우고 다음 제일 높은 가격으로 갱신
		auctionMapper.deleteBuyer(buyer);
		List<HashMap<String, String>> mapList = auctionMapper.bestBuyerByItemId(itemId);
		
		Buyer best = new Buyer();
		best.setItemId(itemId);
		String price =  String.valueOf(mapList.get(0).get("listprice"));
		price = price.substring(0, price.length()-3);
		best.setListprice(Integer.parseInt(price));
		best.setUsername(mapList.get(0).get("username"));
		auctionMapper.updateAuctionBuyer(best);
	}
}