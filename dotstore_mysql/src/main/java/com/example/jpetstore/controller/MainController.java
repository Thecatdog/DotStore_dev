package com.example.jpetstore.controller;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.jpetstore.dao.mybatis.mapper.MainMapper;
import com.example.jpetstore.dao.mybatis.mapper.PointMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.P2PItem;
import com.example.jpetstore.domain.Point;

@Controller
public class MainController implements Serializable{
	@Autowired MainMapper mainMapper;
	@Autowired PointMapper pointMapper;

	// Message List
	@RequestMapping(value = "/shop/index.do")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("tiles/index");

		List<Item> itemList = mainMapper.getBestItems();
		List<AuctionItem> auctionList = mainMapper.getBestAuctionItems();
	
		List<Item> c2pItem = new ArrayList<>();
		List<Item> p2pItem = new ArrayList<>();
		for(Item i : itemList) {
			if(i.getSupplier_cate().equals("member")) p2pItem.add(i);
			else c2pItem.add(i);
		}
		
		mv.addObject("c2pItem", c2pItem);
		mv.addObject("p2pItem", p2pItem);
		mv.addObject("auctionBestSellers", auctionList);
		
		return mv;
	}
	
	// Top.jsp 에서 point를 구하는 통신 API
	@RequestMapping(value = "/top.do")
	@ResponseBody
	// request body로 안받는 이유 : vo로 새로 만들어서 받아야해서
	public String getPoint(@RequestParam(value="userId" , required = false) String userId) {
		long point = pointMapper.getPointByUserId(userId);
		String strPoint = String.valueOf(point);
		return strPoint;
	}

}
