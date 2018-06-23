package com.example.jpetstore.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.AuctionMapper;
import com.example.jpetstore.dao.mybatis.mapper.CategoryMapper;
import com.example.jpetstore.dao.mybatis.mapper.ProductMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Category;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.service.AccountFormValidator;
import com.example.jpetstore.service.AuctionService;
import com.example.jpetstore.vo.AuctionVo;

@Controller
// @RequestMapping({"/shop/auctionForm.do","/shop/auctionEdit.do"})
public class AuctionFormController {

	@Autowired
	private AuctionMapper auctionMapper;
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductMapper productMapper;
	private static final String[] COMPANYSUPPLIER = { "Company", "Member" };

	@Autowired
	private AuctionService auctionService;

	// @Autowired
	// private AccountFormValidator validator;
	// public void setValidator(AccountFormValidator validator) {
	// this.validator = validator;
	// }

	@ModelAttribute("categories")
	public List<Category> getCategoryList() {
		return categoryMapper.getCategoryList();
	}

	@ModelAttribute("companySupplier")
	public String[] getSupplier() {
		return COMPANYSUPPLIER;
	}
	
	@RequestMapping(value = "/shop/auctionForm.do", method = RequestMethod.GET)
	public ModelAndView showForm() {
		ModelAndView mv = new ModelAndView("tiles/auctionForm");

		String cate[] = { "BIRDS", "CATS", "DOGS", "FISH", "REPTILES" };
		List<Product> productList = null;

		for (int i = 0; i < cate.length; i++) {
			productList = productMapper.getProductListByCategory(cate[i]);
			mv.addObject("products" + cate[i], productList);
			//System.out.println(productList);
		}
		
		return mv;
	}

	@RequestMapping(value = "/shop/auctionForm.do", method = RequestMethod.POST)
	public String onSubmit(HttpServletRequest request, @ModelAttribute AuctionVo auctionVo)
			throws Exception {

		// validator.validate(auctionForm, result);

		AuctionItem auction = new AuctionItem();

		auction.setCategoryId(auctionVo.getCategoryId());

		String productId = productMapper.getProductIdListByCategory(auctionVo.getProductId().trim());
		auction.setProductId(productId);

		auction.setItemId(auctionVo.getItemId());
		String price = auctionVo.getListprice();
		auction.setListprice(Integer.parseInt(price));
		if (!auctionVo.getUnitcost().equals(""))
			auction.setUnitcost(Integer.parseInt(auctionVo.getUnitcost()));
		else
			auction.setUnitcost(0);
		auction.setSupplier(getUserName(request));
		auction.setStatus(auctionVo.getStatus());
		auction.setAttr1(auctionVo.getAttr1());
		auction.setAttr2(auctionVo.getAttr2());
		auction.setAttr3(auctionVo.getAttr3());
		auction.setAttr4(auctionVo.getAttr4());
		auction.setAttr5(auctionVo.getAttr5());

		auction.setBuyerId(null);

		String time = auctionVo.getDueTime();
		java.sql.Date d = java.sql.Date.valueOf(time);
		auction.setDueTime(d);

		auction.setDescription(auctionVo.getDescription());
		auction.setCompanySupplier(auctionVo.getCompanySupplier());

		System.out.println(auction.toString());

		auctionService.insert(auction);
		return "redirect:/shop/auction/categoryList.do";
	}
	
	@RequestMapping(value = "/shop/editAuction.do", method = RequestMethod.GET)
	public ModelAndView editForm(@RequestParam("itemId") String itemId) throws Exception {
		ModelAndView mv = new ModelAndView("tiles/auctionEditForm");
		AuctionItem item = auctionMapper.getAuctionItem(itemId);
		mv.addObject("item", item);
		return mv;
	}
	
	@RequestMapping(value = "/shop/editAuction.do", method = RequestMethod.POST)
	public String update(@RequestParam("itemId") String itemId,
			RedirectAttributes redirectAttributes,
			@ModelAttribute AuctionVo auctionVo) throws Exception {
		
		AuctionItem auction = new AuctionItem();
		System.out.println(auctionVo.toString());
		
		auction.setItemId(auctionVo.getItemId());
		auction.setUnitcost(Integer.parseInt(auctionVo.getUnitcost()));
		auction.setStatus(auctionVo.getStatus());
		auction.setAttr1(auctionVo.getAttr1());
		auction.setAttr2(auctionVo.getAttr2());
		auction.setAttr3(auctionVo.getAttr3());
		auction.setAttr4(auctionVo.getAttr4());
		auction.setAttr5(auctionVo.getAttr5());

		String time = auctionVo.getDueTime();
		java.sql.Date d = java.sql.Date.valueOf(time);
		auction.setDueTime(d);

		auction.setDescription(auctionVo.getDescription());
		
		System.out.println(auction.toString());
		
		auctionMapper.updateAuction(auction);
		
		redirectAttributes.addAttribute("itemId", itemId);
		return "redirect:/shop/auctionDetail.do";
	}
	
	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}