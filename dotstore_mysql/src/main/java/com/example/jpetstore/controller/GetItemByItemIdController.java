package com.example.jpetstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.dao.mybatis.mapper.ItemMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;

@Controller
public class GetItemByItemIdController {

	@Autowired private ItemMapper itemMapper;
	@Autowired private AuctionMapper auctionMapper;
	
	@RequestMapping("/shop/{itemId}/findItem.do")
	public String findItem(@PathVariable("itemId") String itemId, RedirectAttributes redirectAttributes) {
		String view = "";
		
		AuctionItem auction = auctionMapper.getAuctionItem(itemId);
		if (auction != null) 
			view = "redirect:/shop/auctionDetail.do";
		
		Item item = itemMapper.getItem(itemId);
		if (item != null) 
			view = "redirect:/shop/viewItem.do";
		
		redirectAttributes.addAttribute("itemId", itemId);
		return view;
	}
}
