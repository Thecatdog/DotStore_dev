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
	public ModelAndView list(@PathVariable("type") String type, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("MsgList");
		String username = getUserName(request);
		List<Message> messageList = messageMapper.getMessages(username, type);
		mv.addObject("messageList", messageList);
		
//		for(Message msg : messageList) {
//			System.out.println(msg.toString());
//		}
		return mv;
	}
	
	// Message send
	@RequestMapping(value="/msg/send.do", method=RequestMethod.GET)
	public ModelAndView send() {
		ModelAndView mv = new ModelAndView("MsgWrite");
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
		return "redirect:/msg/list.do";
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
	@RequestMapping(value="/msg.do")
	public String delete(@RequestParam("id") int messageId) {
		messageService.delete(messageId);
		return "redirect:/msg/list.do";
	}
	
	// Username 가져오는 함수 : return 값 : UserId<String>
	public String getUserName(HttpServletRequest request) {
		UserSession userSession = 
				(UserSession) WebUtils.getSessionAttribute(request, "userSession");
		String username = userSession.getAccount().getUsername();
		return username;
	}
}
