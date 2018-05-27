package com.example.jpetstore.controller;

import com.example.jpetstore.domain.Message;
import java.io.Serializable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController implements Serializable{
	
	// form_msg
	@RequestMapping("/msg/form.do") 
	public String form() {
		// GET으로 들어오면 일반 form으로 보여준다. 
		// POST으로 들어오면 답장 form으로 보여준다. (답장직msg내용필요)
		return "/msg/form";
	}
	
	// send_msg
	@RequestMapping("/msg/send.do") 
	public String send(Message msg) {
		// Command 객체를 파라미터로 지정(Message)
		return "/msg/listReceived.do";
	}
	
	// list_received_msg
	@RequestMapping("/msg/listReceived.do") 
	public ModelAndView listReceivedMsg() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	// list_sent_msg : retun
	@RequestMapping("/msg/listSent.do") 
	public ModelAndView listSentMsg() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	// detail_recived_msg 
	@RequestMapping("/msg/detailReceivedMsg.do") 
	public ModelAndView detailRecivedMsg() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	// detail_sent_msg
	@RequestMapping("/msg/detailSentMsg.do") 
	public ModelAndView detailSentMsg() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	


}
