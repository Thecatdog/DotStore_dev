package com.example.jpetstore.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import com.example.jpetstore.domain.Category;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.service.AccountFormValidator;
import com.example.jpetstore.service.PetStoreFacade;

@Controller
@RequestMapping({"/shop/auctionForm.do","/shop/auctionEdit.do"})
public class AuctionFormController { 

	@Value("tiles/auctionForm")
	private String formViewName;
	@Value("tiles/auctionList")
	private String successViewName;
	
	@Autowired
	private PetStoreFacade petStore;
	public void setPetStore(PetStoreFacade petStore) {
		this.petStore = petStore;
	}

	@Autowired
	private AccountFormValidator validator;
	public void setValidator(AccountFormValidator validator) {
		this.validator = validator;
	}
		
	@ModelAttribute("auctionForm")
	public AuctionForm formBackingObject(HttpServletRequest request) 
			throws Exception {
		
//		Auction item = getAuctionItem();
		
//		if (userSession != null) {	// edit an existing account
//			return new AuctionForm(
//				petStore.getAuctionItem(userSession.getAuction().getUsername()));
//		}
//		else {	// create a new account
			return new AuctionForm();
//		}
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String showForm() {
		return formViewName;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String onSubmit(
			HttpServletRequest request, HttpSession session,
			@ModelAttribute("auctionForm") AuctionForm auctionForm,
			BindingResult result) throws Exception {

//		if (request.getParameter("auction.listOption") == null) {
//			auctionForm.getAuction().setListOption(false);
//		}
//		if (request.getParameter("auction.bannerOption") == null) {
//			auctionForm.getAccount().setBannerOption(false);
//		}
		
//		validator.validate(auctionForm, result);
		
		if (result.hasErrors()) return formViewName;
		
		petStore.createAuctionItem(auctionForm.getAuction());
		
		return successViewName;  
	}
}
