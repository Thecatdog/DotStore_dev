package com.example.jpetstore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.dao.mybatis.mapper.NewCartMapper;
import com.example.jpetstore.dao.mybatis.mapper.PointMapper;
import com.example.jpetstore.dao.mybatis.mapper.ItemMapper;
import com.example.jpetstore.domain.Cart;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.NewCart;
import com.example.jpetstore.domain.Point;
import com.example.jpetstore.service.PetStoreFacade;
import com.example.jpetstore.vo.BuyerVo;

@Controller
@SessionAttributes({"sessionCart", "totalPrice"})
public class AddItemToCartController { 

	@Autowired private AuctionMapper auctionMapper;
	@Autowired private NewCartMapper newCartMapper;
	@Autowired private ItemMapper itemMapper;
	@Autowired private PointMapper pointMapper;
	
	@RequestMapping("/shop/addCart.do")
	public String addCart(@RequestParam("workingItemId") String workingItemId,
			@RequestParam("price") int price, RedirectAttributes redirectAttributes,
			HttpServletRequest request) throws Exception {
		
		//장바구니 중복 체크
		String itemId = newCartMapper.checkNewItemInCart(workingItemId, getUserName(request));
		System.out.println("cart : " + itemId);
		if (itemId != null) {
			System.out.println("장바구니 중복상품");
			redirectAttributes.addAttribute("itemId", workingItemId);
			redirectAttributes.addAttribute("message", "중복된 상품입니다.");
			return "redirect:/shop/viewItem.do";
		} else {
			NewCart cart = new NewCart(workingItemId, getUserName(request), price);
			newCartMapper.addCart(cart);
			return "redirect:/shop/viewCartList.do";
		}
	}
	
	@RequestMapping("/shop/viewCartList.do")
	public ModelAndView viewCart(HttpServletRequest request, Model model,
			@RequestParam(value="usePoint", defaultValue="0") int usePoint) throws Exception {
		ModelAndView mv = new ModelAndView("tiles/Cart");
		//user의 장바구니 itemId 목록 조회
		List<String> itemIdList = newCartMapper.chooseItemIdByUsername(getUserName(request));
		
		//itemId로 item 검색
		List<HashMap<String, String>> cartList = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> cart = new HashMap<String, String>();
		int totalPrice = 0;
		for (int i = 0; i < itemIdList.size(); i++) {
			String id = itemIdList.get(i);
			AuctionItem auction = auctionMapper.getAuctionItem(id);
			if (auction != null) {
				cart.put("itemId", auction.getItemId());
				cart.put("productId", auction.getProductId());
				cart.put("listPrice", Integer.toString(auction.getListprice()));
				cart.put("description", auction.getDescription());
				cartList.add(cart);
				totalPrice += auction.getListprice();
			}

			Item item = itemMapper.getItem(id);
			if (item != null) {
				cart.put("itemId", item.getItemId());
				cart.put("productId", item.getProductId());
				cart.put("listPrice", Integer.toString(item.getListprice()));
				cart.put("description", item.getDescription());
				cartList.add(cart);
				totalPrice += item.getListprice();
			}
			
			cart = new HashMap<String, String>();
		}
		
		mv.addObject("totalPrice", totalPrice-usePoint);
		mv.addObject("cartList", cartList);
		
		//포인트 조회
		long myPoint = pointMapper.getPointByUserId(getUserName(request));
		mv.addObject("myPoint", myPoint);
				
		//세션 저장
		model.addAttribute("sessionCart", cartList);
		model.addAttribute("totalPrice", totalPrice-usePoint);
		
		return mv;
	}
	
	@RequestMapping("/shop/removeCart.do")
	public String removeItemCart(HttpServletRequest request, @RequestParam("itemId") String itemId) throws Exception {
		newCartMapper.removeCart(itemId, getUserName(request));
		return "redirect:/shop/viewCartList.do";
	}
	
	@RequestMapping(value="/shop/usePoint.do", method=RequestMethod.POST)
	public String usePoint(HttpServletRequest request, @RequestParam("point") int usePoint,
			Model model, @ModelAttribute("totalPrice") int totalPrice,
			RedirectAttributes redirectAttributes) throws Exception {
		Point point = new Point();
		point.setUserId(getUserName(request));
		point.setPoint(-usePoint);
		point.setContent("상품 구매 포인트 차감");
		pointMapper.addPoint(point);
		
		redirectAttributes.addAttribute("usePoint", usePoint);
		return "redirect:/shop/viewCartList.do";
	}
	
	@RequestMapping("/shop/checkCart.do")
	public String checkCart(Model model, @ModelAttribute("totalPrice") int totalPrice,
			@ModelAttribute("sessionCart") List<HashMap<String, String>> cartList) throws Exception {
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("cartList", cartList);
		return "tiles/Checkout";
	}
	
	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}