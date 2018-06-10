package com.example.jpetstore.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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

	@RequestMapping(value="/shop/auctionDetail.do", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("itemId") String itemId,
			HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("tiles/auctionDetail");
		
		AuctionItem item = auctionMapper.getAuctionItem(itemId);
		mv.addObject("item", item);
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy,MM,dd");
		String dday = transFormat.format(item.getDueTime());		
		
		mv.addObject("dday", dday);
		mv.addObject("currentUser", getUserName(request));
		
//		Buyer buyer = new Buyer(getUserName(request), itemId);
//		Buyer myBidStatus = auctionMapper.selectBuyerByitemIdAndUsername(buyer);
//		mv.addObject("myBidStatus", myBidStatus);
		
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

	@RequestMapping("/shop/myAuctionList.do")
	public ModelAndView myAuctionList(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("tiles/myAuctionList");
		
		List<AuctionItem> myAuctionList = auctionMapper.myAuctionItemList(getUserName(request));
		mv.addObject("myAuctionList", myAuctionList);
		
		List<HashMap<String, String>> myBiddingList = auctionMapper.myBidList(getUserName(request));
		mv.addObject("myBiddingList", myBiddingList);
		
		return mv;
	}
	
	@RequestMapping(value = "/shop/deleteAuction.do", method = RequestMethod.GET)
	public String deleteAuction(
			@RequestParam("itemId") String itemId,
			@RequestParam("productId") String productId,
			RedirectAttributes redirectAttributes) throws Exception {
		
		auctionMapper.deleteAuctionByItemId(itemId);
		redirectAttributes.addAttribute("productId", productId);
		return "redirect:/shop/auction/viewProduct.do";
	}
	
	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}