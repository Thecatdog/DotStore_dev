package com.example.jpetstore.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.example.jpetstore.domain.Auction;

public interface AuctionDao {
	
	// 경매 정보 가져오기
	Auction getAuctionItem(String itemId) throws DataAccessException;
	
	// 경매 상품 등록
	void createAuctionItem(Auction auction) throws DataAccessException;
	
	// 경매 상품 자세히 보기
	void readAuctionItem(Auction auction) throws DataAccessException;
	  
	// 경매 상품 수정
	void updateAuctionItem(Auction auction) throws DataAccessException;
	
	// 경매 상품 삭제
	void deleteAuctionItem(Auction auction) throws DataAccessException;
	  
	// 경매 가격 수정
	void changeAuctionItem(Auction auction, int price) throws DataAccessException;
	  
	// 경매 목록 가져오기
	List<Auction> getAuctionItemList() throws DataAccessException;
}