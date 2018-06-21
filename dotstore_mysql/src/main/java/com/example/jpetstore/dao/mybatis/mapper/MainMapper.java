package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;

@Mapper
public interface MainMapper {
	List<Item> getBestItems() throws DataAccessException; // 베스트셀러 아이템 
	List<AuctionItem> getBestAuctionItems() throws DataAccessException; // 베스트 옥션 아이템
}