package com.example.jpetstore.controller;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.jpetstore.dao.mybatis.mapper.MainMapper;
import com.example.jpetstore.dao.mybatis.mapper.PointMapper;
import com.example.jpetstore.domain.AuctionItem;
import com.example.jpetstore.domain.Calendar;
import com.example.jpetstore.domain.Item;
import com.example.jpetstore.domain.P2PItem;
import com.example.jpetstore.domain.Point;
import com.example.jpetstore.service.PointService;

@Controller
public class MainController implements Serializable{
	@Autowired MainMapper mainMapper;
	@Autowired PointMapper pointMapper;
	@Autowired PointService pointService;

	// Message List
	@RequestMapping(value = "/shop/index.do")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("tiles/index");

		List<Item> itemList = mainMapper.getBestItems();
		List<AuctionItem> auctionList = mainMapper.getBestAuctionItems();
	
		List<Item> c2pItem = new ArrayList<>();
		List<Item> p2pItem = new ArrayList<>();
		for(Item i : itemList) {
			if(i.getSupplier_cate().equals("member")) p2pItem.add(i);
			else c2pItem.add(i);
		}
		
		mv.addObject("c2pItem", c2pItem);
		mv.addObject("p2pItem", p2pItem);
		mv.addObject("auctionBestSellers", auctionList);
		
		return mv;
	}
	
	// Top.jsp 에서 point를 구하는 통신 API
	@RequestMapping(value = "/top.do")
	@ResponseBody
	// request body로 안받는 이유 : vo로 새로 만들어서 받아야해서
	public String getPoint(@RequestParam(value="userId" , required = false) String userId) {
		long point = pointMapper.getPointByUserId(userId);
		String strPoint = String.valueOf(point);
		return strPoint;
	}
	
	@RequestMapping(value = "/daily.do")
	public ModelAndView calendar(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("tiles/calendar");
		String userId = MessageController.getUserName(request);
		
		// Data 가져오기
		List<Calendar> calList = pointMapper.getCalendarList(userId);
		for(Calendar c : calList) {
			System.out.println(c.toString());
		}
		mv.addObject("calList", calList);
		
		return mv;
	}
	
	@RequestMapping(value = "/daily/check.do")
	@ResponseBody
	public String clickCalendar(@RequestParam(value="userId" , required = false) String userId) {

		Point point = new Point();
		point.setUserId(userId);
		point.setPoint(+5);
		point.setContent("출석체크 5포인트 적립");
		
		// Date에 저장 & point 적립
		pointService.insertCalendar(userId, point);
		
		return userId;
	}

}
