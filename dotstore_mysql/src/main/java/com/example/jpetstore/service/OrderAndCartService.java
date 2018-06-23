package com.example.jpetstore.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.NewCartMapper;
import com.example.jpetstore.dao.mybatis.mapper.OrderItemMapper;
import com.example.jpetstore.dao.mybatis.mapper.OrderMapper;
import com.example.jpetstore.domain.Order;
import com.example.jpetstore.domain.OrderItem;

@Service
public class OrderAndCartService {

	@Autowired private OrderMapper orderMapper;
	@Autowired private NewCartMapper newCartMapper;
	@Autowired private OrderItemMapper orderItemMapper;
	
	//주문 정보 삽입하고, 장바구니 상품 삭제, 주문 정보에 필요한 상품id 삽입
	@Transactional
	public void insertOrderAndDeleteCart(Order order, List<HashMap<String, String>> cartList, String username) {
		orderMapper.insertOrder(order);
		
		int orderId = orderMapper.getMaxorderId();
		
		for (int i = 0; i<cartList.size(); i++) {
			String itemId = cartList.get(i).get("itemId");
			OrderItem item = new OrderItem(orderId, itemId);
			orderItemMapper.insertOrderItem(item);
		}
		
		newCartMapper.deleteCartByUsername(username);
	}
}
