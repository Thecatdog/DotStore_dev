package com.example.jpetstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.MessageMapper;
import com.example.jpetstore.domain.Message;

@Service
public class MessageService {
	@Autowired private MessageMapper messageMapper;
	
	@Transactional
	public void insert(Message message) {
		messageMapper.sendMessage(message);
	}
	
	@Transactional
	public void delete(Message message) {
		messageMapper.deleteMessage(message);
	}

}
