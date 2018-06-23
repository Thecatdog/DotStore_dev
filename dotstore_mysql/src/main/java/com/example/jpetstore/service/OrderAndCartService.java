package com.example.jpetstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.NewCartMapper;
import com.example.jpetstore.dao.mybatis.mapper.OrderMapper;
import com.example.jpetstore.domain.Order;

@Service
public class OrderAndCartService {

	@Autowired private OrderMapper orderMapper;
	@Autowired private NewCartMapper newCartMapper;
	
	@Transactional
	public void insertOrderAndDeleteCart(Order order, String username) {
		orderMapper.insertOrder(order);
		newCartMapper.deleteCartByUsername(username);
	}
}
