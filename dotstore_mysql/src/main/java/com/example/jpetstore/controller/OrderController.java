package com.example.jpetstore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.util.WebUtils;

import com.example.jpetstore.dao.mybatis.mapper.AccountMapper;
import com.example.jpetstore.domain.Account;
import com.example.jpetstore.domain.Cart;
import com.example.jpetstore.service.OrderValidator;
import com.example.jpetstore.service.PetStoreFacade;

/**
 * @author Juergen Hoeller
 * @since 01.12.2003
 * @modified by Changsup Park
 */
@Controller
@SessionAttributes({"sessionCart", "totalPrice", "orderForm"})
public class OrderController {
	@Autowired
	private PetStoreFacade petStore;
	@Autowired
	private OrderValidator orderValidator;
	@Autowired private AccountMapper accountMapper;
	
	@ModelAttribute("orderForm")
	public OrderForm createOrderForm() {
		return new OrderForm();
	}

	@ModelAttribute("creditCardTypes")
	public List<String> referenceData() {
		ArrayList<String> creditCardTypes = new ArrayList<String>();
		creditCardTypes.add("Visa");
		creditCardTypes.add("MasterCard");
		creditCardTypes.add("American Express");
		return creditCardTypes;			
	}
	
	@RequestMapping("/shop/newOrder.do")
	public String initNewOrder(HttpServletRequest request,
			@ModelAttribute("sessionCart") List<HashMap<String, String>> cartList,
			@ModelAttribute("totalPrice") int totalPrice,
			@ModelAttribute("orderForm") OrderForm orderForm
			) throws ModelAndViewDefiningException {
		
		Account account = accountMapper.selectUserAccount(getUserName(request));
		orderForm.getOrder().initOrder(account, totalPrice);
		
		return "tiles/NewOrderForm";
	}
	
	@RequestMapping("/shop/newOrderSubmitted.do")
	public String bindAndValidateOrder(HttpServletRequest request,
			@ModelAttribute("orderForm") OrderForm orderForm, 
			BindingResult result) {
		if (orderForm.didShippingAddressProvided() == false) {	
			// from NewOrderForm
			orderValidator.validateCreditCard(orderForm.getOrder(), result);
			orderValidator.validateBillingAddress(orderForm.getOrder(), result);
			if (result.hasErrors()) return "tiles/NewOrderForm";
			
			if (orderForm.isShippingAddressRequired() == true) {
				orderForm.setShippingAddressProvided(true);
				return "tiles/ShippingForm";
			}
			else {			
				return "tiles/ConfirmOrder";
			}
		}
		else {		// from ShippingForm
			orderValidator.validateShippingAddress(orderForm.getOrder(), result);
			if (result.hasErrors()) return "tiles/ShippingForm";
			return "tiles/ConfirmOrder";
		}
	}
	
	@RequestMapping("/shop/confirmOrder.do")
	protected ModelAndView confirmOrder(
			@ModelAttribute("orderForm") OrderForm orderForm, 
			SessionStatus status) {
		petStore.insertOrder(orderForm.getOrder());
		ModelAndView mav = new ModelAndView("tiles/ViewOrder");
		mav.addObject("order", orderForm.getOrder());
		mav.addObject("message", "Thank you, your order has been submitted.");
		status.setComplete();  // remove sessionCart and orderForm from session
		return mav;
	}
	
	public String getUserName(HttpServletRequest request) {
		UserSession userSession = (UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}
