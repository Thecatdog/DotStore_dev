package com.example.jpetstore.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

@Controller
@SessionAttributes({ "category", "productList" })
public class ViewProductController {

	@Autowired
	private AuctionMapper auctionMapper;
	@Autowired
	private P2PMapper p2pMapper;
	@Autowired
	private ItemMapper c2pMapper;
	@Autowired
	private ProductMapper productMapper;

	@RequestMapping("/shop/{type}/viewProduct.do")
	public ModelAndView handleRequest(@RequestParam("productId") String productId, ModelMap model,
			@PathVariable("type") String type) throws Exception {

		ModelAndView mv = new ModelAndView("tiles/Product");

		mv.addObject("type", type);

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
}