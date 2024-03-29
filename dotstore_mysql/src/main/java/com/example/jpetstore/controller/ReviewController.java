package com.example.jpetstore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.jpetstore.dao.mybatis.mapper.ReviewMapper;
import com.example.jpetstore.domain.Point;
import com.example.jpetstore.domain.Review;
import com.example.jpetstore.service.ReviewService;
import com.example.jpetstore.vo.ReviewVo;

@Controller
public class ReviewController {
	
	@Autowired ReviewService reviewService;
	@Autowired ReviewMapper reviewMapper;

	@RequestMapping(value="/shop/{itemId}/review.do", method=RequestMethod.POST)
	public String send(
			@RequestParam("content") String content,
			@PathVariable("itemId") String itemId,
			HttpServletRequest request) {
		String userid = MessageController.getUserName(request);
		Review review = new Review();
		review.setUserId(userid);
		review.setItemId(itemId);
		review.setContent(content);
		
		Point point = new Point();
		point.setUserId(userid);
		point.setPoint(20);
		point.setContent("상품 리뷰 등록 20포인트 적립");

		reviewService.insert(review, point);
		
		return "redirect:/shop/viewItem.do?itemId={itemId}"; 
	}
	
	@RequestMapping("/review.do")
	public String delete(
			@RequestParam("reviewId") int reviewId,
			@RequestParam("itemId") String itemId,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request) {
		
		String userid = MessageController.getUserName(request);
		
		Point point = new Point();
		point.setUserId(userid);
		point.setPoint(-20);
		point.setContent("상품 리뷰 취소 20포인트 차감");
		
		reviewService.deleteById(reviewId, point);
		
//		return "redirect:/shop/viewItem.do?itemId="+itemId;
		redirectAttributes.addAttribute("itemId", itemId);
		return "redirect:/shop/viewItem.do";
	}

	
	@RequestMapping(value = "/edit/review.do", method = RequestMethod.POST)
	@ResponseBody
    public ReviewVo update(@RequestBody ReviewVo review) throws Exception {
		//System.out.println(review.getContent() + ", " + review.getReviewId());
		reviewService.updateById(review.getReviewId(), review.getContent());
		return review;
	}
	
	
}
