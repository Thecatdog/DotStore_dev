package com.example.jpetstore.service;

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
}