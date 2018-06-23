package com.example.jpetstore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.dao.mybatis.mapper.ItemMapper;
import com.example.jpetstore.dao.mybatis.mapper.OrderItemMapper;
import com.example.jpetstore.dao.mybatis.mapper.OrderMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.Order;

@Controller
@SessionAttributes("userSession")
public class ViewOrderController {

	@Autowired OrderMapper orderMapper;
	@Autowired OrderItemMapper orderItemMapper;
	@Autowired AuctionMapper auctionMapper;
	@Autowired ItemMapper itemMapper;

	@RequestMapping("/shop/viewOrder.do")
	public ModelAndView handleRequest(
			@ModelAttribute("userSession") UserSession userSession,
			@RequestParam("orderId") int orderId
			) throws Exception {
		
		ModelAndView mv = new ModelAndView("tiles/ViewOrder");
		
		Order order = orderMapper.getOrderByOrderId(orderId);
		System.out.println(order);
		List<String> itemIdList = orderItemMapper.getItemIdListByOrderId(orderId);
		System.out.println(itemIdList);
		
		//itemId로 item 검색
		List<HashMap<String, String>> cartList = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> cart = new HashMap<String, String>();
		for (int i = 0; i < itemIdList.size(); i++) {
			String id = itemIdList.get(i);
			AuctionItem auction = auctionMapper.getAuctionItem(id);
			if (auction != null) {
				cart.put("itemId", auction.getItemId());
				cart.put("productId", auction.getProductId());
				cart.put("listPrice", Integer.toString(auction.getListprice()));
				cart.put("description", auction.getDescription());
				cartList.add(cart);
			}

			Item item = itemMapper.getItem(id);
			if (item != null) {
				cart.put("itemId", item.getItemId());
				cart.put("productId", item.getProductId());
				cart.put("listPrice", Integer.toString(item.getListprice()));
				cart.put("description", item.getDescription());
				cartList.add(cart);
			}
			
			cart = new HashMap<String, String>();
		}
		
		order.setCartList(cartList);
		mv.addObject("order", order);
		
		return mv;
	}
}
