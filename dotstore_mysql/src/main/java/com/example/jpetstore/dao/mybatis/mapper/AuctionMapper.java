package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jpetstore.domain.AuctionItem;

@Mapper
public interface AuctionMapper {

//  Account getAccountByUsername(String username);
//
//  Account getAccountByUsernameAndPassword(String username, String password);
//
  List<AuctionItem> getAuctionList(String productId);
  
  void insertAuction(AuctionItem auction);

//  void updateUpdate(Account account);

}