package com.example.jpetstore.controller;

import com.example.jpetstore.dao.mybatis.mapper.MessageMapper;
import com.example.jpetstore.domain.Message;
import com.example.jpetstore.service.MessageService;
import com.example.jpetstore.vo.MessageVo;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

@Controller
public class MessageController implements Serializable{
	@Autowired MessageMapper messageMapper;
	@Autowired MessageService messageService;

	// Message List
	@RequestMapping(value = "/msg/{type}/list.do", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable("type") String type, 
							 @RequestParam(value="page", defaultValue="1") int currPage, 
							 @RequestParam(value="searchKey", required=false) String searchKey,
							 HttpServletRequest request) {

		ModelAndView mv = new ModelAndView("tiles/MsgList");

		String username = getUserName(request);
		List<Message> messageList = messageMapper.getMessages(username, type, searchKey);
	
		// Paging(5개 단위로 보여주기)
		int divNum = 5;
		double msgSize = messageList.size();
		int pageLen = (int)(Math.ceil(msgSize/divNum));
		int lastMsgIndex = messageList.size()-1;
		
		// 5개씩 리스트를 쪼개다보니, 마지막 페이지에서는 null exception이 발생 -> if로 예외 처리
		List<Message> subMessageList = null;
		if(lastMsgIndex > currPage*divNum) subMessageList = messageList.subList((currPage-1)*divNum, currPage*divNum);
		else subMessageList = messageList.subList((currPage-1)*divNum, lastMsgIndex+1);

		mv.addObject("pageLen", pageLen);
		mv.addObject("currPage", currPage);
		mv.addObject("messageList", subMessageList);
		
		return mv;
	}
		
	// Message send
	@RequestMapping(value="/msg/send.do", method=RequestMethod.GET)
	public ModelAndView send() {

		ModelAndView mv = new ModelAndView("tiles/MsgWrite");

		return mv;
	}
	@RequestMapping(value="/msg/send.do", method=RequestMethod.POST) 
	public String send(@ModelAttribute MessageVo msgvo, HttpServletRequest request) {
		Message msg = new Message();
		msg.setReceiverId(msgvo.getReceiverId());
		msg.setTitle(msgvo.getTitle());
		msg.setContext(msgvo.getContext());
		msg.setSenderId(getUserName(request));
		
		messageService.insert(msg);
		return "redirect:/msg/recv/list.do";
	}
	
	// Message Detail
	@RequestMapping("/msg/detail.do")
	public ModelAndView detail(@RequestParam("id") int messageId) {
		ModelAndView mv = new ModelAndView("MsgDetail");
		Message msg = messageMapper.getMessageById(messageId);
		mv.addObject("message", msg);
		return mv;
	}

	// Message Delete
	@RequestMapping(value="/msg.do", method=RequestMethod.GET)
	public String delete(@RequestParam("id") int messageId) {
		messageService.deleteById(messageId);
		return "redirect:/msg/recv/list.do";
	}
	@RequestMapping(value="/msg.do", method=RequestMethod.POST)
	public String delete(@RequestParam("delList") List<Integer> ids) {
		for(Integer id : ids) 
			messageService.deleteById(id);
		return "redirect:/msg/recv/list.do";
	}

	// Request로 Username 가져오는 함수 : return 값 : UserId<String>
	public String getUserName(HttpServletRequest request) {
		UserSession userSession = 
				(UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}
