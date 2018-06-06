package com.example.jpetstore.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Buyer;
import com.example.jpetstore.service.AuctionService;
import com.example.jpetstore.vo.AuctionVo;
import com.example.jpetstore.vo.BuyerVo;

@Controller
public class AuctionDetailController {

	@Autowired
	private AuctionMapper auctionMapper;
	@Autowired
	private AuctionService auctionService;

	@RequestMapping(value="/shop/auctionDetail.do")
	public ModelAndView detail(@RequestParam("itemId") String itemId,
			HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("tiles/auctionDetail");
		
		AuctionItem item = auctionMapper.getAuctionItem(itemId);
		mv.addObject("item", item);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy,MM,dd");
		String dday = transFormat.format(item.getDueTime());		
		
		mv.addObject("dday", dday);
		mv.addObject("currentUser", getUserName(request));
		
		return mv;
	}
	
	@RequestMapping(value="/shop/auctionDetail.do", method = RequestMethod.POST)
	public String bidding(
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes,
			@RequestParam("itemId") String itemId,
			@ModelAttribute BuyerVo buyerVo) throws Exception {
		
		Buyer buyer = new Buyer();
		buyer.setUsername(getUserName(request));
		buyer.setItemId(itemId);
		buyer.setListprice(buyerVo.getListprice());
		
		auctionService.insertBuyer(buyer); //Buyer테이블 삽입, Auction테이블 갱신 동시에
		
		redirectAttributes.addAttribute("itemId", itemId);
		return "redirect:/shop/auctionDetail.do";
	}

	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}