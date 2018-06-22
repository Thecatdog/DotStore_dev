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
import com.example.jpetstore.service.PetStoreFacade;

/**
 * @author Juergen Hoeller
 * @param <AuctionItem>
 * @since 30.11.2003
 * @modified-by Changsup Park
 */
@Controller
@SessionAttributes({"sessionCart", "totalPrice"})
public class AddItemToCartController { 

	private PetStoreFacade petStore;
	//추가
	@Autowired private AuctionMapper auctionMapper;
	@Autowired private NewCartMapper newCartMapper;
	@Autowired private ItemMapper itemMapper;
	@Autowired private PointMapper pointMapper;
	//
	
	@Autowired
	public void setPetStore(PetStoreFacade petStore) {
		this.petStore = petStore;
	}

//	@ModelAttribute("sessionCart")
//	public Cart createCart() {
//		return new Cart();
//	}
	
//	@RequestMapping("/shop/{type}/addItemToCart.do")
//	public ModelAndView handleRequest(
//			@RequestParam("workingItemId") String workingItemId,
//			@ModelAttribute("sessionCart") Cart cart ,
//			@PathVariable("type") String type
//			) throws Exception {
//		ModelAndView mv = new ModelAndView("tiles/Cart");
//		
//		if (cart.containsItemId(workingItemId)) {
//			cart.incrementQuantityByItemId(workingItemId);
//		}
//		else {
//			// isInStock is a "real-time" property that must be updated
//			// every time an item is added to the cart, even if other
//			// item details are cached.
//			
//			//변경
//			AuctionItem auction = new AuctionItem();
//			Item item = new Item();
//			boolean isInStock = false;
//			if (type.equals("auction")) {
//				auction = auctionMapper.getAuctionItem(workingItemId);
//				item = null;
//			} else {
//				isInStock = this.petStore.isItemInStock(workingItemId);
//				item = this.petStore.getItem(workingItemId);
//			}
//			System.out.println("auction : " + auction);
//			System.out.println("item : " + item);
//			System.out.println("isInStock : " + isInStock);
//			cart.addItem(auction, item, isInStock);
//			//
//		}
//		mv.addObject("cart", cart);
//		return mv;
//	}
	
	@RequestMapping("/shop/addCart.do")
	public String addCart(@RequestParam("workingItemId") String workingItemId,
			@RequestParam("price") int price,
			HttpServletRequest request) throws Exception {
		
		NewCart cart = new NewCart(workingItemId, getUserName(request), price);
		System.out.println(cart.toString());
		newCartMapper.addCart(cart);
		
		return "redirect:/shop/viewCartList.do";
	}
	
	@RequestMapping("/shop/viewCartList.do")
	public ModelAndView viewCart(HttpServletRequest request, Model model) throws Exception {
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
		
		mv.addObject("totalPrice", totalPrice);
		mv.addObject("cartList", cartList);
		
		//포인트 조회
		long myPoint = pointMapper.getPointByUserId(getUserName(request));
		mv.addObject("myPoint", myPoint);
				
		//세션 저장
		model.addAttribute("sessionCart", cartList);
		model.addAttribute("totalPrice", totalPrice);
		
		return mv;
	}
	
	@RequestMapping("/shop/removeCart.do")
	public String removeItemCart(@RequestParam("itemId") String itemId) throws Exception {
		newCartMapper.removeCart(itemId);
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