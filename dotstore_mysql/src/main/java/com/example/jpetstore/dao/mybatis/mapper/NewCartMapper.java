package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.example.jpetstore.domain.NewCart;

@Mapper
public interface NewCartMapper {

	void addCart(NewCart cart);
	List<String> chooseItemIdByUsername(String username);
	void removeCart(String itemId, String username);
	void deleteCartByUsername(String username);
	String checkNewItemInCart(String itemId, String username);
}