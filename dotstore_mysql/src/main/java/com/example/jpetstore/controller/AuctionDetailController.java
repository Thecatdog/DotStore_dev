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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.dao.mybatis.mapper.OrderMapper;
import com.example.jpetstore.dao.mybatis.mapper.PointMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Buyer;
import com.example.jpetstore.domain.Point;
import com.example.jpetstore.service.AuctionService;
import com.example.jpetstore.vo.AuctionVo;
import com.example.jpetstore.vo.BuyerVo;
import com.example.jpetstore.vo.PagingVo;

@Controller
public class AuctionDetailController {

	@Autowired
	private AuctionMapper auctionMapper;
	@Autowired
	private AuctionService auctionService;
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private OrderMapper orderMapper;

	@RequestMapping(value="/shop/auctionDetail.do", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam("itemId") String itemId,
			@RequestParam(value="message", defaultValue="d") String message,
			HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("tiles/auctionDetail");
		mv.addObject("message", message);

		AuctionItem item = auctionMapper.getAuctionItem(itemId);
		mv.addObject("item", item);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy,MM,dd");
		String dday = transFormat.format(item.getDueTime());
		mv.addObject("dday", dday);

		mv.addObject("currentUser", getUserName(request));

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("itemId", itemId);
		map.put("username", getUserName(request));
		HashMap<String, String> myBidStatus = auctionMapper.selectBuyerByitemIdAndUsername(map);

		int isBest = 0; //내가 최고 입찰자인가 확인
		if (myBidStatus != null) {
			String str_myPrice = String.valueOf(myBidStatus.get("listprice"));
			str_myPrice = str_myPrice.substring(0, str_myPrice.length()-3);
			mv.addObject("myPrice", str_myPrice);
			String str_nowPrice = String.valueOf(item.getListprice());

			if (str_myPrice.equals(str_nowPrice)) isBest = 1; //내가 최고 입찰자
		}

		mv.addObject("myBidStatus", isBest);
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

	@RequestMapping(value="/shop/deleteBidding.do")
	public String deleteBidding(
			HttpServletRequest request,
			@RequestParam("itemId") String itemId,
			@RequestParam("myPrice") String myPrice,
			RedirectAttributes redirectAttributes) throws Exception {

		Buyer buyer = new Buyer();
		buyer.setItemId(itemId);
		buyer.setListprice(Integer.parseInt(myPrice));
		buyer.setUsername(getUserName(request));

		auctionService.deleteBuyer(buyer, itemId);

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
		mv.addObject("point", pointMapper.getPointByUserId(getUserName(request)));
		mv.addObject("orderList", orderMapper.orderList(getUserName(request)));
		
		return mv;
	}

	@RequestMapping(value = "/shop/deleteAuction.do", method = RequestMethod.GET)
	public String deleteAuction(
			@RequestParam("itemId") String itemId,
			@RequestParam("productId") String productId,
			RedirectAttributes redirectAttributes) throws Exception {

		auctionService.deleteAuction(itemId);
		redirectAttributes.addAttribute("productId", productId);
		return "redirect:/shop/auction/viewProduct.do";
	}

	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}

	@ResponseBody
	@RequestMapping(value = "/my/point.do", method = RequestMethod.GET)
	public List<Point> listPoint(HttpServletRequest request, @RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		final int size = 5;
		return pointMapper.listByUserId(new PagingVo(getUserName(request), (page - 1) * size, size));
	}
}