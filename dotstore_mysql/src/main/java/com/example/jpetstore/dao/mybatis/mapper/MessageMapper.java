package com.example.jpetstore.dao.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import com.example.jpetstore.domain.Message;

@Mapper
public interface MessageMapper {
	List<Message> getMessages(String username, String type) throws DataAccessException; // 메시지 리스트
	Message getMessageById(int messageId) throws DataAccessException; 	// 메시지 1개
	void sendMessage(Message message) throws DataAccessException;		// 메시지 전송
	void deleteById(int messageId) throws DataAccessException;			// 메시지 삭제
	
}
