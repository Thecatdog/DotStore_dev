package com.example.jpetstore.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.domain.AuctionItem;

@Controller
public class AuctionDetailController {

	@Autowired
	private AuctionMapper auctionMapper;

	@RequestMapping("/shop/auctionDetail.do")
	public ModelAndView detail(@RequestParam("itemId") String itemId,
			HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("tiles/auctionDetail");
		
		AuctionItem item = auctionMapper.getAuctionItem(itemId);
		mv.addObject("item", item);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy,MM,dd");
		String dday = transFormat.format(item.getDueTime());		
		
		System.out.println(item.getDueTime());
		System.out.println(dday);

		mv.addObject("dday", dday);
		mv.addObject("currentUser", getUserName(request));
		
		return mv;
	}
	
	

	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}