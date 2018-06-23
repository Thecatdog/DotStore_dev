package com.example.jpetstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import com.example.jpetstore.dao.mybatis.mapper.OrderMapper;

@Controller
@SessionAttributes("userSession")
public class ListOrdersController {

	@Autowired OrderMapper orderMapper;

	@RequestMapping("/shop/listOrders.do")
	public ModelAndView handleRequest(
		@ModelAttribute("userSession") UserSession userSession
		) throws Exception {
		String username = userSession.getAccount().getUsername();
		System.out.println(orderMapper.orderList(username));
		return new ModelAndView("tiles/ListOrders", "orderList", orderMapper.orderList(username));
	}
}
