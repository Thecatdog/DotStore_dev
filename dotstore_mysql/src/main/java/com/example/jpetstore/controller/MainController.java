package com.example.jpetstore.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.jpetstore.dao.mybatis.mapper.MainMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;

@Controller
public class MainController implements Serializable{
	@Autowired MainMapper mainMapper;

	// Message List
	@RequestMapping(value = "/shop/index.do")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("tiles/index");

		List<Item> itemList = mainMapper.getBestItems();
		//List<Auction> p2pList = mainMapper.getBestAuction();
		mv.addObject("bestSellers", itemList);
		return mv;
	}
	
}
