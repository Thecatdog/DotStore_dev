package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.jpetstore.domain.P2PItem;
@Mapper
public interface P2PMapper {
	List<P2PItem> getP2PList(String productId, String supplier_cate);
	void insertP2P(P2PItem p2pItem);
	P2PItem getP2PItem(String itemId);
}
