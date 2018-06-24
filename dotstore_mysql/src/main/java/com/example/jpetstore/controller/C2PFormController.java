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
import com.example.jpetstore.dao.mybatis.mapper.ItemMapper;
import com.example.jpetstore.dao.mybatis.mapper.ProductMapper;
import com.example.jpetstore.domain.Category;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.service.C2PService;
import com.example.jpetstore.vo.C2PVo;
import com.example.jpetstore.vo.P2PVo;

@Controller
public class C2PFormController {
	@Autowired
	private ItemMapper c2pMapper;
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired 
	private ProductMapper productMapper;

	private static final String[] COMPANYSUPPLIER = {"company", "Member"};

	@Autowired
	private C2PService c2pService;
	
	@ModelAttribute("c2pForm")
	public C2PForm formBackingObject(HttpServletRequest request) throws Exception {
		return new C2PForm();
	}
	
	@ModelAttribute("categories")
	public List<Category> getCategoryList(){
		return categoryMapper.getCategoryList();
	}
	
	@ModelAttribute("companySupplier")
	public String[] getSupplier() {
		return COMPANYSUPPLIER;
	}
		
	@RequestMapping(value = "/shop/c2pForm.do", method = RequestMethod.GET)
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
	
	@RequestMapping(value = "/shop/c2pForm.do", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request, HttpSession session, @ModelAttribute C2PVo c2pItemVo)
			throws Exception {

		Item c2pItem = new Item();

		c2pItem.setCategoryId(c2pItemVo.getCategoryId());

		String productId = productMapper.getProductIdListByCategory(c2pItemVo.getProductId().trim());
		c2pItem.setProductId(productId);

		c2pItem.setItemId(c2pItemVo.getItemId());
		String price = c2pItemVo.getListprice();
		c2pItem.setListprice(Integer.parseInt(price));
		c2pItem.setSupplier(getUserName(request));
		c2pItem.setStatus("1");
		c2pItem.setAttr1(c2pItemVo.getAttr1());
		c2pItem.setAttr2(c2pItemVo.getAttr2());
		c2pItem.setAttr3(c2pItemVo.getAttr3());
		c2pItem.setAttr4(c2pItemVo.getAttr4());
		c2pItem.setAttr5(c2pItemVo.getAttr5());
		c2pItem.setSupplier_cate(c2pItemVo.getSupplier_cate());
		c2pItem.setDescription(c2pItemVo.getDescription());

		System.out.println(c2pItem.toString());

		c2pService.insert(c2pItem);
		return "redirect:/shop/c2p/categoryList.do";
	}
	
	@RequestMapping(value = "/shop/editC2PForm.do", method = RequestMethod.GET)
	public ModelAndView editForm(@RequestParam("itemId") String itemId) throws Exception {
		ModelAndView mv = new ModelAndView("tiles/p2pEditForm");
		Item item = c2pMapper.getItem(itemId);
		mv.addObject("item", item);
		mv.addObject("form_type","c2p");
		return mv;
	}
	@RequestMapping(value = "/shop/editC2PForm.do", method = RequestMethod.POST)
	public String editUpdate(HttpServletRequest request, HttpSession session, @ModelAttribute P2PVo c2pItemVo)
			throws Exception {

		Item c2pItem = new Item();

		c2pItem.setCategoryId(c2pItemVo.getCategoryId());

		String productId = productMapper.getProductIdListByCategory(c2pItemVo.getProductId());
		c2pItem.setProductId(productId);

		c2pItem.setItemId(c2pItemVo.getItemId());
		String price = c2pItemVo.getListprice();
		c2pItem.setListprice(Integer.parseInt(price));
		c2pItem.setSupplier(getUserName(request));
		c2pItem.setStatus("1");
		c2pItem.setAttr1(c2pItemVo.getAttr1());
		c2pItem.setAttr2(c2pItemVo.getAttr2());
		c2pItem.setAttr3(c2pItemVo.getAttr3());
		c2pItem.setAttr4(c2pItemVo.getAttr4());
		c2pItem.setAttr5(c2pItemVo.getAttr5());
		c2pItem.setSupplier_cate(c2pItemVo.getSupplier_cate());
		c2pItem.setDescription(c2pItemVo.getDescription());

		System.out.println(c2pItem.toString());

		c2pService.update(c2pItem);
		return "redirect:/shop/c2p/categoryList.do";
	}


	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}

}
