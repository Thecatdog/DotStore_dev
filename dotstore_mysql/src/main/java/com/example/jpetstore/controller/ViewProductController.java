package com.example.jpetstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.dao.mybatis.mapper.ItemMapper;
import com.example.jpetstore.dao.mybatis.mapper.P2PMapper;
import com.example.jpetstore.dao.mybatis.mapper.ProductMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.P2PItem;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.service.PetStoreFacade;

/**
 * @author Juergen Hoeller
 * @since 30.11.2003
 * @modified-by Changsup Park
 */
@Controller
@SessionAttributes({ "category", "productList" })
public class ViewProductController {

	private PetStoreFacade petStore;

	@Autowired
	public void setPetStore(PetStoreFacade petStore) {
		this.petStore = petStore;
	}

	@Autowired
	private AuctionMapper auctionMapper;
	@Autowired
	private P2PMapper p2pMapper;
	@Autowired
	private ItemMapper c2pMapper;
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private ItemMapper itemMapper;

	@RequestMapping("/shop/{type}/viewProduct.do")
	public ModelAndView handleRequest(@RequestParam("productId") String productId, ModelMap model,
			@PathVariable("type") String type) throws Exception {
		// PagedListHolder<Item> itemList = new
		// PagedListHolder<Item>(this.petStore.getItemListByProduct(productId));
		// itemList.setPageSize(4);
		// Product product = this.petStore.getProduct(productId);
		// model.put("itemList", itemList);
		// model.put("product", product);
		// return "Product";

		ModelAndView mv = new ModelAndView("tiles/Product");

		mv.addObject("type", type);

		// System.out.println(productId);
		// String productName =
		// productMapper.getProductNameByProductId(productId);
		// mv.addObject("productName", productName);
		// System.out.println(productName);

		Product product = productMapper.getProduct(productId);
		mv.addObject("product", product);

		if (type.equals("auction")) {
			List<AuctionItem> list = auctionMapper.getAuctionList(productId);
			mv.addObject("itemList", list);
		} else if (type.equals("p2p")) {
			List<P2PItem> list = p2pMapper.getP2PList(productId, "member");
			mv.addObject("itemList", list);
		} else if (type.equals("c2p")) {
			List<Item> list = c2pMapper.getC2PList(productId, "company");
			System.out.println(list);
			mv.addObject("itemList", list);
		}

		return mv;
	}

	// @RequestMapping("/shop/{type}/viewProduct.do")
	// public String handleRequest(
	// @RequestParam("productId") String productId,
	// ModelMap model) throws Exception {
	// PagedListHolder<Item> itemList = new
	// PagedListHolder<Item>(this.petStore.getItemListByProduct(productId));
	// itemList.setPageSize(4);
	// Product product = this.petStore.getProduct(productId);
	// model.put("itemList", itemList);
	// model.put("product", product);
	// return "Product";
	// }

	@RequestMapping("/shop/{type}/viewProduct2.do")
	public String handleRequest2(@ModelAttribute("product") Product product,
			@ModelAttribute("itemList") PagedListHolder<Item> itemList, @RequestParam("pageName") String page,
			ModelMap model) throws Exception {
		if ("next".equals(page)) {
			itemList.nextPage();
		} else if ("previous".equals(page)) {
			itemList.previousPage();
		}
		model.put("itemList", itemList);
		model.put("product", product);
		return "Product";
	}
}