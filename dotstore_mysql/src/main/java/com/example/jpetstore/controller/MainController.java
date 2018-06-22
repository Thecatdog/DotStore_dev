package com.example.jpetstore.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.jpetstore.dao.mybatis.mapper.MainMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.P2PItem;

@Controller
public class MainController implements Serializable{
	@Autowired MainMapper mainMapper;

	// Message List
	@RequestMapping(value = "/shop/index.do")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("tiles/index");

		List<Item> itemList = mainMapper.getBestItems();
		List<AuctionItem> auctionList = mainMapper.getBestAuctionItems();
	
		List<Item> c2pItem = new ArrayList<>();
		List<Item> p2pItem = new ArrayList<>();
		
		for(Item i : itemList) {
			if(i.getSupplier_cate().equals("member")) {
				p2pItem.add(i);
				System.out.println("member : " + i.toString());
			}
			else {
				c2pItem.add(i);
				System.out.println("company : " + i.toString());
			}
		}
		
		mv.addObject("c2pItem", c2pItem);
		mv.addObject("p2pItem", p2pItem);
		mv.addObject("auctionBestSellers", auctionList);
		return mv;
	}
	
}
