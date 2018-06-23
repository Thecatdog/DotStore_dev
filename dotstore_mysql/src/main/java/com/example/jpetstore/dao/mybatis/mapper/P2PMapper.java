package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.P2PItem;
@Mapper
public interface P2PMapper {
	List<P2PItem> getP2PList(String productId, String supplier_cate);
	void insertP2P(P2PItem p2pItem);
	Item getItem(String itemId);
	void deleteById(String itemId);
	void updateP2P(P2PItem p2pItem);
}
