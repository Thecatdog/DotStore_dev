package com.example.jpetstore.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpetstore.dao.mybatis.mapper.ReviewMapper;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.Product;
import com.example.jpetstore.domain.Review;
import com.example.jpetstore.service.PetStoreFacade;
import com.example.jpetstore.service.ReviewService;

/**
 * @author Juergen Hoeller
 * @since 30.11.2003
 * @modified-by Changsup Park
 */
@Controller
public class ViewItemController { 

	private PetStoreFacade petStore;
	@Autowired ReviewMapper reviewMapper;
	@Autowired ReviewService reviewService;

	@Autowired
	public void setPetStore(PetStoreFacade petStore) {
		this.petStore = petStore;
	}

	@RequestMapping("/shop/viewItem.do")
	public String handleRequest(@RequestParam("itemId") String itemId, ModelMap model, HttpServletRequest request) throws Exception {
		
		Item item = this.petStore.getItem(itemId);
		Product product = item.getProduct();
		
		// 리뷰를 위한 코드 추가 
		List<Review> reviewList = reviewMapper.getListByItemId(itemId);
//		for(Review r : reviewList)
//			System.out.println(r.toString());
		model.put("reviewList", reviewList);
		
		model.put("item", item);
		model.put("product", product);
		
		return "Item";
	}

}
