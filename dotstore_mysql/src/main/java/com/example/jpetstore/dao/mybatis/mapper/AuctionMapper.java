package com.example.jpetstore.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Buyer;

@Mapper
public interface AuctionMapper {

	List<AuctionItem> getAuctionList(String productId);

	void insertAuction(AuctionItem auction);
	AuctionItem getAuctionItem(String itemId);
	void updateAuction(AuctionItem auction);
	void deleteAuctionByItemId(String itemId);

	void insertBuyer(Buyer buyer);
	void updateAuctionBuyer(Buyer buyer);
	void deleteBuyer(Buyer buyer);
	List<HashMap<String, String>> bestBuyerByItemId(String itemId);
	
	List<AuctionItem> myAuctionItemList(String username);
	List<HashMap<String, String>> myBidList(String username);
	
	HashMap<String, String> selectBuyerByitemIdAndUsername(HashMap<String, String> buyer);
	
	List<AuctionItem> selectOpenAuction();
	void updateAuctionFinish(String itemId);
}