package com.example.jpetstore.dao;

import org.springframework.dao.DataAccessException;
import com.example.jpetstore.domain.Message;

public interface MessageDao {
	Message getReceivedMsg(String username) throws DataAccessException; // 받은 메시지 리스트
	Message getSentMsg(String username) throws DataAccessException;		// 보낸 메시지 리스트
	void sendMsg(Message message) throws DataAccessException;			// 메시지 전송
	void deleteMsg(Message message) throws DataAccessException;			// 메시지 삭제
}