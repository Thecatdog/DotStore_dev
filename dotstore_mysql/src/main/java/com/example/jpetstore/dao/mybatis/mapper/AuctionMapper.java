package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jpetstore.domain.AuctionItem;

@Mapper
public interface AuctionMapper {

	AuctionItem getAuctionItem(String itemId);
	
	List<AuctionItem> getAuctionList(String productId);

	void insertAuction(AuctionItem auction);

	// void updateUpdate(Account account);

}