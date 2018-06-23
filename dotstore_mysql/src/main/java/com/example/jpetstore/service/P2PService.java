package com.example.jpetstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.P2PMapper;
import com.example.jpetstore.domain.P2PItem;

@Service
public class P2PService {
	@Autowired
	private P2PMapper p2pMapper;

	@Transactional
	public void insert(P2PItem p2pItem) {
		p2pMapper.insertP2P(p2pItem);
	}

	@Transactional
	public void deleteById(String itemId) {
		p2pMapper.deleteById(itemId);
	}

	@Transactional
	public void update(P2PItem p2pItem) {
		p2pMapper.updateP2P(p2pItem);
	}
}
