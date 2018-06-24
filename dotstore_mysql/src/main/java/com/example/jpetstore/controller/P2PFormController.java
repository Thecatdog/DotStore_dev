package com.example.jpetstore.controller;

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
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.CategoryMapper;
import com.example.jpetstore.dao.mybatis.mapper.P2PMapper;
import com.example.jpetstore.dao.mybatis.mapper.ProductMapper;
import com.example.jpetstore.domain.Category;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.P2PItem;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.service.P2PService;
import com.example.jpetstore.vo.P2PVo;

@Controller
public class P2PFormController {
	@Autowired
	private P2PMapper p2pMapper;
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	private static final String[] COMPANYSUPPLIER = {"company", "Member"};
	
	@Autowired
	private P2PService p2pService;
	
	@ModelAttribute("p2pForm")
	public P2PForm formBackingObject(HttpServletRequest request) throws Exception {
		return new P2PForm();
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategoryList(){
		return categoryMapper.getCategoryList();
	}
	
	@ModelAttribute("companySupplier")
	public String[] getSupplier() {
		return COMPANYSUPPLIER;
	}
		
	@RequestMapping(value = "/shop/p2pForm.do", method = RequestMethod.GET)
	public ModelAndView showForm() {
		ModelAndView mv = new ModelAndView("tiles/p2pForm");
		System.out.println("sadfasfsda");
		String cate[] = { "BIRDS", "CATS", "DOGS", "FISH", "REPTILES" };
		List<Product> productList = null;

		for (int i = 0; i < cate.length; i++) {
			productList = productMapper.getProductListByCategory(cate[i]);
			mv.addObject("products" + cate[i], productList);
			System.out.println(productList);
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/shop/p2pForm.do", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request, HttpSession session, @ModelAttribute P2PVo p2pItemVo)
			throws Exception {

		P2PItem p2pItem = new P2PItem();

		p2pItem.setCategoryId(p2pItemVo.getCategoryId());

		String productId = productMapper.getProductIdListByCategory(p2pItemVo.getProductId().trim());
		p2pItem.setProductId(productId);

		p2pItem.setItemId(p2pItemVo.getItemId());
		String price = p2pItemVo.getListprice();
		p2pItem.setListprice(Integer.parseInt(price));
		p2pItem.setSupplier(getUserName(request));
		p2pItem.setStatus(p2pItemVo.getStatus());
		p2pItem.setAttr1(p2pItemVo.getAttr1());
		p2pItem.setAttr2(p2pItemVo.getAttr2());
		p2pItem.setAttr3(p2pItemVo.getAttr3());
		p2pItem.setAttr4(p2pItemVo.getAttr4());
		p2pItem.setAttr5(p2pItemVo.getAttr5());
		p2pItem.setSupplier_cate(p2pItemVo.getSupplier_cate());
		p2pItem.setDescription(p2pItemVo.getDescription());

		System.out.println(p2pItem.toString());

		p2pService.insert(p2pItem);
		return "redirect:/shop/p2p/categoryList.do";
	}
	
	@RequestMapping(value = "/shop/editP2PForm.do", method = RequestMethod.GET)
	public ModelAndView editForm(@RequestParam("itemId") String itemId) throws Exception {
		ModelAndView mv = new ModelAndView("tiles/p2pEditForm");
		Item item = p2pMapper.getItem(itemId);
		mv.addObject("item", item);
		mv.addObject("form_type","p2p");
		return mv;
	}

	@RequestMapping(value = "/shop/editP2PForm.do", method = RequestMethod.POST)
	public String editUpdate(HttpServletRequest request, HttpSession session, @ModelAttribute P2PVo p2pItemVo)
			throws Exception {

		P2PItem p2pItem = new P2PItem();

		p2pItem.setCategoryId(p2pItemVo.getCategoryId());

		String productId = productMapper.getProductIdListByCategory(p2pItemVo.getProductId());
		p2pItem.setProductId(productId);

		p2pItem.setItemId(p2pItemVo.getItemId());
		String price = p2pItemVo.getListprice();
		p2pItem.setListprice(Integer.parseInt(price));
		p2pItem.setSupplier(getUserName(request));
		p2pItem.setStatus(p2pItemVo.getStatus());
		p2pItem.setAttr1(p2pItemVo.getAttr1());
		p2pItem.setAttr2(p2pItemVo.getAttr2());
		p2pItem.setAttr3(p2pItemVo.getAttr3());
		p2pItem.setAttr4(p2pItemVo.getAttr4());
		p2pItem.setAttr5(p2pItemVo.getAttr5());
		p2pItem.setSupplier_cate(p2pItemVo.getSupplier_cate());
		p2pItem.setDescription(p2pItemVo.getDescription());

		System.out.println(p2pItem.toString());

		p2pService.update(p2pItem);
		return "redirect:/shop/p2p/categoryList.do";
	}

	
	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}


}
