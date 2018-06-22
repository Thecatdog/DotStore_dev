package com.example.jpetstore.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Buyer;
import com.example.jpetstore.domain.NewCart;

@Mapper
public interface NewCartMapper {

	void addCart(NewCart cart);
	List<String> chooseItemIdByUsername(String username);
	void removeCart(String itemId);
}