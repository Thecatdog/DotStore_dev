package com.example.jpetstore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.jpetstore.dao.mybatis.mapper.ItemMapper;
import com.example.jpetstore.domain.Item;

@Service
public class C2PService {

@Autowired private ItemMapper c2pMapper;

@Transactional
public void insert(Item c2pItem) {
	c2pMapper.insertC2P(c2pItem);
}
@Transactional
public void deleteById(String itemId) {
	c2pMapper.deleteById(itemId);
}

}
